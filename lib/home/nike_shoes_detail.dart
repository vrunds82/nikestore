import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nikestore/home/home.dart';
import 'package:nikestore/home/nike_shoes.dart';
import 'package:nikestore/home/nike_shopping_cart.dart';

class NikeShoesDetail extends StatefulWidget {
final NikeShoes shoes;

 NikeShoesDetail({Key key,@required this.shoes}):super(key: key);

  @override
  _NikeShoesDetailState createState() => _NikeShoesDetailState();
}

class _NikeShoesDetailState extends State<NikeShoesDetail> {
  Future<void> _openShoppingCart(BuildContext context)



  async {
  notifierButtonsVisible.value=false;
  await Navigator.of(context).push(PageRouteBuilder(
      opaque: false,pageBuilder: (_, animation1, __)
  {
    return FadeTransition(

      opacity: animation1,
        child: NikeShoppingCart(shoes: widget.shoes,));
  }));
  notifierButtonsVisible.value=true;
}

  final ValueNotifier<bool> notifierButtonsVisible =  ValueNotifier(false);

  Widget _buildCarousel(BuildContext context){
    final size=MediaQuery.of(context).size;
    return   SizedBox(height: size.height*0.5,
      child: Stack(
        children: [
          Positioned.fill(
            child:   Hero(
              tag: 'background_${widget.shoes.model}',
              child: Container(

                color: Color(widget.shoes.color),

              ),
            ),
          ),
          Positioned(left: 70,
            right: 70,
            top: 10,
            child:Hero(tag: 'number_${widget.shoes.model}',
              child: ShakeTransition(
                axis: Axis.vertical,
                duration: const Duration(milliseconds: 1000),
              offset: 20,
                child: Material(
                  color: Colors.transparent,
                  child: FittedBox(
                    child:Text(widget.shoes.modelNumber.toString(),
                      style: TextStyle(
                          color: Colors.black12.withOpacity(0.05),
                          fontWeight: FontWeight.bold
                      ),),
                  ),
                ),
              ),
            ) ,
          ),

          PageView.builder(
              itemCount: widget.shoes.images.length,
              itemBuilder: (context,index){
                final tag = index==0?'image_${widget.shoes.model}':'image_${widget.shoes.model}_$index';
                return Container(
                  alignment: Alignment.center,
                  child: ShakeTransition(
                    axis: Axis.vertical,
                    duration: index==0?const Duration(milliseconds:900 ):Duration.zero,
                    offset: 10,
                    child: Hero(tag: tag,
                      child: Image.asset(widget.shoes.images[index],
                        height: 200,
                        width: 200,),
                    ),
                  ),
                );
              }),
        ],
      ),
    );
  }

bool _hasBeenPressed6 = true;
  bool _hasBeenPressed7 = true;
  bool _hasBeenPressed9 = true;
  bool _hasBeenPressed10 = true;
  bool _hasBeenPressed11 = true;

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
                ShakeTransition(

                  child: Padding(
                    padding: const EdgeInsets.only(left: 12,right: 12),
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(widget.shoes.model,
                          style: TextStyle(

                              fontWeight: FontWeight.w600,
                              fontSize: 18,

                          ),),
                        const Spacer(),
                        Expanded(
                          child: Column(mainAxisAlignment: MainAxisAlignment.end,
                           //crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text('\$${widget.shoes.oldPrice.toInt().toString()}',
                                style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 13,
                                    decoration: TextDecoration.lineThrough
                                ),),
                              Text('\$${widget.shoes.currentPrice.toInt().toString()}',
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
                  ),
                ),
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.only(right: 12,left: 12),
                  child: ShakeTransition(
                    duration: Duration(milliseconds: 1100),
                    child: Text("AVAILABLE SIZE ",
                    style: TextStyle(
                      fontSize: 13
                    ),),
                  ),
                ),
                SizedBox(height: 20,),
                ShakeTransition(
                  duration: Duration(milliseconds: 1100),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12,right: 12),
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: _hasBeenPressed6 ? Colors.transparent : Colors.black12,
                        ),
                            child: GestureDetector(onTap: (){
                              setState(() {
                                _hasBeenPressed6 = !_hasBeenPressed6;
                              });
                            },
                                child: Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: _ShoesSizeItem(text: '6',),
                                ))),

                        Container(decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: _hasBeenPressed7 ? Colors.transparent : Colors.black12,
                        ),
                            child: GestureDetector(onTap: (){
                              setState(() {
                                _hasBeenPressed7 = !_hasBeenPressed7;
                              });
                            },
                                child: Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: _ShoesSizeItem(text: '7',),
                                ))),

                        Container(decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: _hasBeenPressed10 ? Colors.transparent : Colors.black12,
                        ),
                            child: GestureDetector(onTap: (){
                              setState(() {
                                _hasBeenPressed10 = !_hasBeenPressed10;
                              });
                            },
                                child: Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: _ShoesSizeItem(text: '10',),
                                ))),


                        Container(decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: _hasBeenPressed9 ? Colors.transparent : Colors.black12,
                        ),
                            child: GestureDetector(onTap: (){
                              setState(() {
                                _hasBeenPressed9 = !_hasBeenPressed9;
                              });
                            },
                                child: Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: _ShoesSizeItem(text: '9',),
                                ))),


                        Container(decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: _hasBeenPressed11 ? Colors.transparent : Colors.black12,
                        ),
                            child: GestureDetector(onTap: (){
                              setState(() {
                                _hasBeenPressed11 = !_hasBeenPressed11;
                              });
                            },
                                child: Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: _ShoesSizeItem(text: '11'
                                      '',),
                                ))),
                        SizedBox(height: 20,),

                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                ShakeTransition(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 12,left: 12),
                    child: Text("DISCRIPTION",
                      style: TextStyle(
                          fontSize: 11
                      ),),
                  ),
                ),

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
                      onPressed: () {
                        _openShoppingCart(context);
                      })
                ],
              ),
            ),
            builder: (context, value,child) {
              return AnimatedPositioned(
                duration: Duration(milliseconds: 300),
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
