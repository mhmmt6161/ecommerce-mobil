class Product
{ int id;
String name,
    image;
List img;
num  price;
bool userLiked;
int discount;

Product({
  this.id,
  this.name,
  this.img,
  this.price,
  this.discount,
  this.image,
  this.userLiked
});
factory Product.fromJson(Map<String, dynamic> json) => new Product (
    id: json['id'],
    name: json['name'],
    price: 10,
    img: json['avatars'],
    userLiked: true,
    discount: json['discount']
);
Map<String, dynamic> toJson() => {
  'id': id,
  'name': name,
  'price': price,
  'image': image,
  'userLiked': userLiked,
  'discount': discount,
};
}


class Comments{
  String comment;

  Comments({this.comment});

  factory Comments.fromJson(Map<String, dynamic> json) => new Comments (
      comment: json['comment']
  );
}

/*
class Product
{ int id;
String name,
    description,
    price,
    createdDate,
    leadtime,
    averageRate,
    comments,
    avatars,
    ratings,
    categories_id;*/
