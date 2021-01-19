class Category {
  final String uid;
  final String title;
  final String image ;

  Category(this.uid, this.title, this.image);

  @override
  String toString() => '$uid, $title';
}
