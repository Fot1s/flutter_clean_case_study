import 'dart:ui';

class Product {
  final String uid;
  final String title;
  final String description;

  final int price ; //cents
  final int size  ;
  final Color color ;

  Product(this.uid, this.title, this.description, this.price, this.size, this.color);

  // @override
  // String toString() => '$uid, $title, $description, ';
}
