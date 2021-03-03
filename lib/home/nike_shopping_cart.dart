


import 'package:flutter/material.dart';

import 'nike_shoes.dart';
const _buttonSizeWidth = 160.0;
const _buttonSizeHeight= 60.0;
const _buttonCircularSize = 60.0;

class NikeShoppingCart extends StatefulWidget {

  final NikeShoes shoes;


  NikeShoppingCart({ Key key, @required this.shoes}):super(key:key);

  @override
  _NikeShoppingCartState createState() => _NikeShoppingCartState();
}

class _NikeShoppingCartState extends State<NikeShoppingCart> with SingleTickerProviderStateMixin{

  AnimationController _controller;
  Animation animationResize;
        @override
        void initState(){
          _controller =AnimationController(vsync: this,
          duration:const Duration(milliseconds: 3000));
          animationResize = Tween(begin: 1.0,end: 0.2).animate(
              CurvedAnimation(
                parent: _controller,
                  curve: Interval(0.0,1.0)
              ));
        super.initState();
}
void dispose(){
          _controller.dispose();
super.dispose();
}

  Widget _buildpanel(){
    final size = MediaQuery.of(context).size;
    return  TweenAnimationBuilder<double>(
  duration: const Duration(milliseconds: 400),
  curve: Curves.easeIn,
  tween: Tween(end: 0.0,begin: 1.0),
  builder: (context,value,child){

    return Transform.translate(offset: Offset(0.0,value * size.height *0.6,),
      child: child,
    );

  },
  child: Container(
    height: (size.height *0.6 *animationResize.value).clamp(_buttonCircularSize, size.height *0.6),
    width:( size.width * animationResize.value).clamp(_buttonCircularSize, size.width),

    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30)
        )
    ),
    child: Column(crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Row(mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Image.asset(widget.shoes.images.first,
                height: 120,),
              Spacer(),
              if(animationResize.value == 1)
              ...[
              const SizedBox(width: 20,),
              Column(
                children: [
                  Text(widget.shoes.model,style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 10
                  )),
                  Text('\$${widget.shoes.currentPrice.toInt().toString()}',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14
                    ),),

                ],
              ),
        ]
            ],
          ),
        ),

      ],

    ),
  ),
);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return  Material(
        color: Colors.transparent,
        child:
        AnimatedBuilder(

        animation:_controller,

          builder: (context, child) {
            final buttonSizeWidth =(_buttonSizeWidth * animationResize.value).clamp(_buttonCircularSize, _buttonSizeWidth);
            final penalSizeWidth = (size.width * animationResize.value).clamp(_buttonCircularSize, size.width);
            return Stack(fit: StackFit.expand,
              children: [
                Positioned.fill(
                    child: GestureDetector(onTap: (){

                      Navigator.of(context).pop();

                    },
                      child: Container(
                        color: Colors.black87,

                      ),
                    )),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 00,
                  
                  child: Positioned.fill(
                    child: Stack(
                      children: [
                        Positioned(
                          top:size.height * 0.2,
                            width: penalSizeWidth,
                            left: size.width /2 - penalSizeWidth / 2,
                            child: _buildpanel()),
                        Positioned
                          (bottom: 40,

                        left: size.width /2 - buttonSizeWidth /2 ,

                          child: StreamBuilder<Object>(
                            stream: null,
                            builder: (context, snapshot) {
                              return TweenAnimationBuilder(
                                duration: const Duration(milliseconds: 400),
                                curve: Curves.easeIn,
                                tween: Tween(end: 0.0,begin: 1.0),
                                builder: (context,value,child){

                                  return Transform.translate(offset: Offset(0.0,value * size.height *0.6,),
                                    child: child,
                                  );

                                },
                                child: InkWell(onTap: (){

                                  _controller.forward();
                                },
                                  child: Container(width: buttonSizeWidth,
                                     height: (_buttonSizeHeight * animationResize.value).clamp(_buttonCircularSize, _buttonSizeWidth),
                                    decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.all(Radius.circular(30)),

                                  ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 12),
                                      child: Row(mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Expanded(child: Icon(Icons.shopping_cart,color: Colors.white,)),
                                          if(animationResize.value == 1)
                                          ...[
                                          const SizedBox(width: 5,),
                                          Expanded(flex: 2,
                                            child: Text("ADD TO CART",style: TextStyle(
                                              color: Colors.white
                                            ),),
                                          ),]
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            );
          }
        )
    );
  }
}

