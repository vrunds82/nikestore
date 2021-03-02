
class NikeShoes{
  NikeShoes({this.model, this.oldPrice, this.currentPrice, this.images,
    this.modelNumber,this.color});
  final String model;
  final double oldPrice;
  final double currentPrice;
  final List<String> images;
  final int modelNumber;
  final int color;


}
final shoes = <NikeShoes>[
  NikeShoes(
    model: 'AIR MAX 90, EZ Black ',
    currentPrice: 149,
    oldPrice: 299,
    images: [
      'assets/images/shoes1_1.png',
      'assets/images/shoes1_2.png',
      'assets/images/shoes1_3.png',
    ],
    modelNumber: 90,
    color: 0xffF6F6F6

  ),

  NikeShoes(
    model: 'AIR MAX 95 Gold',
    currentPrice: 249,
    oldPrice: 399,
    images: [
      'assets/images/shoes2_1.png',
      'assets/images/shoes2_2.png',
      'assets/images/shoes2_3.png',
    ],
    modelNumber: 95,
    color: 0xffFCF5EB

  ),

  NikeShoes(
    model: 'AIR MAX 99 Red',
    currentPrice: 349,
    oldPrice: 399,
    images: [
      'assets/images/shoes3_1.png',
      'assets/images/shoes3_2.png',
      'assets/images/shoes3_3.png',
    ],
    modelNumber: 99,
    color: 0xffFEEFEF

  ),

  NikeShoes(
    model: 'AIR MAX 92 Blue',
    currentPrice: 449,
    oldPrice: 599,
    images: [
      'assets/images/shoes4_1.png',
      'assets/images/shoes4_2.png',
      'assets/images/shoes4_3.png',
    ],
    modelNumber: 92,
    color: 0xffEDFFE7

  )
];