

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nikestore/home/nike_shoes.dart';
import 'package:nikestore/home/nike_shoes_detail.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final ValueNotifier<bool> notifierBottomBarVisible =ValueNotifier(true);


  void _onShoesPressed(NikeShoes shoes,BuildContext context) async{
    notifierBottomBarVisible.value =false;

   await Navigator.of(context).push(PageRouteBuilder(pageBuilder: (context,animation1,animation2){
      return FadeTransition(
        child:NikeShoesDetail(shoes: shoes,),
        opacity: animation1,
      );
    }));
    notifierBottomBarVisible.value =false;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Padding(
          padding: const EdgeInsets.only(left:20.0,right: 20,top: 20),
          child: Column(crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset('assets/images/nike_logo.png',height: 40,
              ),
              Expanded(
                  child: new ListView.builder
                    (
                      itemCount: shoes.length,
                      padding: const EdgeInsets.only(bottom: 20),
                      itemBuilder: (BuildContext ctxt, int Index) {
                        final shoesItem = shoes[Index];
                        return  NikeShoesItem(shoesItem:shoesItem,
                        onTap: (){
                          _onShoesPressed(shoesItem,context);
                        },);
                      }
                  )
              )
            ],
          ),
        ),

        ValueListenableBuilder<bool>(
 valueListenable:notifierBottomBarVisible,
  child:  Container(color: Colors.white.withOpacity(0.7),

    child:   Row(



    children: [



    Expanded(child: Icon(Icons.home)),

    Expanded(child: Icon(Icons.search)),

    Expanded(child: Icon(Icons.favorite_outline_rounded)),

    Expanded(child: Icon(Icons.shopping_cart)),

    Expanded(child: Center(

    child: CircleAvatar(radius: 13,

    backgroundImage: AssetImage ('assets/images/feet.png'),

    ),

    )),



    ],



    ),

    ),
  builder: (context, value,child) {

    return     AnimatedPositioned(duration: const Duration(
    
      milliseconds: 200
    
    ),
    
        height: kToolbarHeight,
    
        left: 0,right: 0,
    
        bottom: 0,
    
        child:child);
  }
)
      ],
      ),
    );
  }
}
class NikeShoesItem extends StatelessWidget {

  final NikeShoes shoesItem;
  final VoidCallback onTap;

 const NikeShoesItem({Key key,this.shoesItem,this.onTap}):super (key:key);

  @override
  Widget build(BuildContext context) {
    const itemHeight = 290.0;
    return InkWell(onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: SizedBox(
          height: itemHeight,
          child: Stack(
            fit: StackFit.expand,
            children: [
 Positioned.fill(
   child: Hero(tag: 'background_${shoesItem.model}',
     child: Container(decoration: BoxDecoration(
         borderRadius: BorderRadius.circular(15),
         color: Color(shoesItem.color),
     ),

     ),
   ),
 ),
              Align(
                alignment: Alignment.topCenter,
                child: Hero(tag: 'number_${shoesItem.model}',
                  child: SizedBox(
                    height: itemHeight *0.6,
                    child: Material(
                      color: Colors.transparent,
                      child: FittedBox(
                        child: Text(shoesItem.modelNumber.toString(),
                         style: TextStyle(
                           color: Colors.black12.withOpacity(0.05),
                           fontWeight: FontWeight.bold
                         ),),
                      ),
                    ),
                  ),
                )

              ),
              Positioned(  height: itemHeight * 0.65,
                top: 20,
                left: 100,
                child: Hero(tag: 'image_${shoesItem.model}',
                  child: Image.asset(shoesItem.images.first,
                    fit: BoxFit.contain,),
                ),

              ),
              Positioned(bottom: 20,left: 0,

                  child: Icon(Icons.favorite_outline_rounded,
                  color: Colors.grey,)),
              Positioned(bottom: 20,right: 20,

                  child: Icon(Icons.shopping_cart,
                    color: Colors.grey,)),
              Positioned(left: 0,right: 0,
                  bottom: 25,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
              children: [
                Text(shoesItem.model,
                style: TextStyle(
                  color: Colors.grey
                ),),
                const SizedBox(height: 10,),

                Text('\$${shoesItem.oldPrice.toInt().toString()}',
                  style: TextStyle(
                      color: Colors.red,
                    decoration: TextDecoration.lineThrough
                  ),),

                Text('\$${shoesItem.currentPrice.toInt().toString()}',
                  style: TextStyle(
                  fontWeight: FontWeight.bold,
                    fontSize: 18

                  ),),
              ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}

class ShakeTransition extends StatelessWidget {

  ShakeTransition({Key key,@required this.child,
    this.duration=const Duration(milliseconds: 900),
    this.axis=Axis.horizontal,
    this.offset = 140.0}):super(key:key);

  final Widget child;
  final Duration duration;
  final double offset;
  final Axis axis;


  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(child: child,
      duration: duration,
       curve: Curves.bounceOut,
       tween: Tween(begin: 1.0,end: 0.0),
       builder: (context,value,child){
       return Transform.translate(offset: axis == Axis.horizontal? Offset(value * offset,
       0.0):
       Offset( 0.0,
           value * offset,
          ),
       child: child,);
       },
    );
  }
}
