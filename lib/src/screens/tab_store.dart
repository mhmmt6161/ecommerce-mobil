import 'package:flutter/material.dart';
import 'package:fryo/src/shared/Product.dart';
import 'package:fryo/src/shared/fryo_icons.dart';
import 'package:fryo/src/shared/product_create_item.dart';
import 'package:fryo/src/shared/styles.dart';
import 'ProductPage.dart';
import 'product_categories.dart';
import 'product_header_creation.dart';

class Products_Screen extends StatelessWidget {
  final List<String> list = List.generate(10, (index) => "Text $index");
  List<Product> foods = [
    Product(
        id: 1,
        name: "Hamburger",
        image: "images/3.png",
        price: 150.00,
        userLiked: true,
        discount: 10),
    Product(
        id:2,
        name: "Hamburger",
        image: "images/5.png",
        price: 150.00,
        userLiked: false,
        discount: 7),
    Product(
      id:3,
      name: "Akara",
      image: 'images/2.png',
      price: 10.99,
      userLiked: false,
    ),
    Product(
        id:4,
        name: "Strawberry",
        image: "images/1.png",
        price: 50.00,
        userLiked: true,
        discount: 14)
  ];

  List<Product> drinks = [
    Product(
        id:5,
        name: "Coca-Cola",
        image: "images/6.png",
        price: 45,
        userLiked: false,
        discount: 2),
    Product(
        id:6,
        name: "Lemonade",
        image: "images/7.png",
        price: 28,
        userLiked: false,
        discount: 5),
    Product(
        id:7,
        name: "Vodka",
        image: "images/8.png",
        price: 78,
        userLiked: false),
    Product(
        id:8,
        name: "Tequila",
        image: "images/9.png",
        price: 168.99,
        userLiked: true,
        discount: 3)
  ];
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title:
        Text('HobiWay', style: logoWhiteStyle, textAlign: TextAlign.left),
        actions: <Widget>[
          IconButton(
            padding: EdgeInsets.all(0),
            onPressed: () { showSearch(context: context, delegate: Search(list));
              },
            iconSize: 21,
            icon: Icon(Fryo.magnifier),
          ),
          IconButton(
            padding: EdgeInsets.all(0),
            onPressed: () {},
            iconSize: 21,
            icon: Icon(Fryo.cart),
          )
        ],
      ),
      body: ListView(children: <Widget>[
      headerTopCategories(context), // Üst kısımda bulunan kategoriler

      products_deals('YİYECEKLER', onViewMore: () {}, items: <Widget>[
        foodItem(foods[0], onTapped: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return new ProductPage(
                  productData: foods[0],
                );
              },
            ),
          );
        }, onLike: () {}),
        foodItem(foods[1], onTapped: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return new ProductPage(
                  productData: foods[1],
                );
              },
            ),
          );
        }, imgWidth: 250, onLike: () {

        }),
        foodItem(foods[2], onTapped: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return new ProductPage(
                  productData: foods[2],
                );
              },
            ),
          );
        }, imgWidth: 200, onLike: () {

        }),
        foodItem(foods[3], onTapped: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return new ProductPage(
                  productData: foods[3],
                );
              },
            ),
          );
        }, onLike: () {

        }),
      ]),

      products_deals('YAĞLAR', onViewMore: () {}, items: <Widget>[
        foodItem(drinks[0], onTapped: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return new ProductPage(
                  productData: drinks[0],
                );
              },
            ),
          );
        }, onLike: () {}, imgWidth: 60),
        foodItem(drinks[1], onTapped: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return new ProductPage(
                  productData: drinks[1],
                );
              },
            ),
          );
        }, onLike: () {}, imgWidth: 75),
        foodItem(drinks[2], onTapped: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return new ProductPage(
                  productData: drinks[2],
                );
              },
            ),
          );
        }, imgWidth: 110, onLike: () {}),
        foodItem(drinks[3], onTapped: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return new ProductPage(
                  productData: drinks[3],
                );
              },
            ),
          );
        }, onLike: () {}),
      ])
    ]),
      );
  }}

class Search extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      IconButton(
        icon: Icon(Icons.close),
        onPressed: () {
          query = "";
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  String selectedResult = "";

  @override
  Widget buildResults(BuildContext context) {
    return Container(
      child: Center(
        child: Text(selectedResult),
      ),
    );
  }

  final List<String> listExample;
  Search(this.listExample);

  List<String> recentList = ["Text 4", "Text 3"];

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestionList = [];
    query.isEmpty
        ? suggestionList = recentList //In the true case
        : suggestionList.addAll(listExample.where(
      // In the false case
          (element) => element.contains(query),
    ));

    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(
            suggestionList[index],
          ),
          leading: query.isEmpty ? Icon(Icons.access_time) : SizedBox(),
          onTap: (){
            selectedResult = suggestionList[index];
            showResults(context);
          },
        );
      },
    );
  }
}
