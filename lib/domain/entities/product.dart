import 'dart:ui';

class Product {
  final String uid;
  final String superTitle;
  final String title;
  final String description;

  final int price ; //cents
  final int size  ;
  final Color color ;

  final String image ;

  Product(this.uid, this.superTitle, this.title, this.description, this.price, this.size, this.color, this.image);

  // @override
  // String toString() => '$uid, $title, $description, ';
}
