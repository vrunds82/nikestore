import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nikestore/home/nike_shoes.dart';

class NikeShoesDetail extends StatelessWidget {
final NikeShoes shoes;

 NikeShoesDetail({Key key,@required this.shoes}):super(key: key);

  final ValueNotifier<bool> notifierButtonsVisible =  ValueNotifier(false);

  Widget _buildCarousel(BuildContext context){
    final size=MediaQuery.of(context).size;
    return   SizedBox(height: size.height*0.5,
      child: Stack(
        children: [
          Positioned.fill(
            child:   Hero(
              tag: 'background_${shoes.model}',
              child: Container(

                color: Color(shoes.color),

              ),
            ),
          ),
          Positioned(left: 70,
            right: 70,
            top: 10,
            child:Hero(tag: 'model_${shoes.model}',
              child: FittedBox(
                child:Text(shoes.modelNumber.toString(),
                  style: TextStyle(
                      color: Colors.black12.withOpacity(0.05),
                      fontWeight: FontWeight.bold
                  ),),
              ),
            ) ,
          ),

          PageView.builder(
              itemCount: shoes.images.length,
              itemBuilder: (context,index){
                final tag = index==0?'image_${shoes.model}':'image_${shoes.model}_$index';
                return Container(
                  alignment: Alignment.center,
                  child: Hero(tag: tag,
                    child: Image.asset(shoes.images[index],
                      height: 200,
                      width: 200,),
                  ),
                );
              }),
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {

      notifierButtonsVisible.value =true;

    });

    return Scaffold(
      appBar: AppBar(elevation: 0,
        backgroundColor: Colors.white,
      centerTitle: true,
      title:  Image.asset('assets/images/nike_logo.png',height: 40,
      ),
      leading:BackButton(color: Colors.black,),),


      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned.fill(
            child: Column(crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
              _buildCarousel(context),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20,
                  vertical: 20),
                  child: Column(
                    children: [],
                  ),
                ),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(shoes.model,
                      style: TextStyle(

                          fontWeight: FontWeight.w600,
                          fontSize: 18,

                      ),),
                    const Spacer(),
                    Expanded(
                      child: Column(mainAxisAlignment: MainAxisAlignment.end,
                       //crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text('\$${shoes.oldPrice.toInt().toString()}',
                            style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.w600,
                                fontSize: 13,
                                decoration: TextDecoration.lineThrough
                            ),),
                          Text('\$${shoes.currentPrice.toInt().toString()}',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20
                            ),),

                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                Text("AVAILABLE SIZE ",
                style: TextStyle(
                  fontSize: 11
                ),),

                Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _ShoesSizeItem(text: '6',),
                    _ShoesSizeItem(text: '7',),
                    _ShoesSizeItem(text: '9',),
                    _ShoesSizeItem(text: '10',),
                    _ShoesSizeItem(text: '11',),
                    SizedBox(height: 20,),

                  ],
                ),
                Text("DISCRIPTION",
                  style: TextStyle(
                      fontSize: 11
                  ),),

              ],
            ),
          ),
          ValueListenableBuilder<bool>(
          valueListenable: notifierButtonsVisible,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: <Widget>[
                  FloatingActionButton(
                      heroTag: 'fav_1',
                      backgroundColor: Colors.white,
                      child: Icon(Icons.favorite,color: Colors.black,),
                      onPressed: () {}),
                  Spacer(),
                  FloatingActionButton(
                      heroTag: 'fav_2',
                      backgroundColor: Colors.black,
                      child: Icon(Icons.shopping_cart),
                      onPressed: () {})
                ],
              ),
            ),
            builder: (context, value,child) {
              return AnimatedPositioned(
                duration: Duration(milliseconds: 200),
                  right: 0,
                  left: 0,
                  bottom: value ?0.0:-kToolbarHeight,
                  child: child);
            }
          )
        ],
      ),
    );
  }
}
class _ShoesSizeItem extends StatelessWidget {

  final String text;

 const _ShoesSizeItem({Key key,this.text}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5),
      child:Text('US $text',
      style: TextStyle(
        fontWeight:FontWeight.bold,
         fontSize: 11
      ),),
    );
  }
}
