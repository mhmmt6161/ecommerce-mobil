import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import '../shared/Product.dart';
import '../shared/styles.dart';
import '../shared/colors.dart';
import '../shared/product_create_item.dart';
import '../shared/buttons.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../shared/shared_preferences_manager.dart';
import 'categories_cart.dart';
class ProductPage extends StatefulWidget {
  final String pageTitle;
  final Product productData;
  static var jsonString = '{ "name" : "Dane", "alias" : "FilledStacks"  }';
  ProductPage({Key key, this.pageTitle, this.productData}) : super(key: key);

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {

  double _rating = 4;
  int _quantity = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: bgColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: bgColor,
          centerTitle: true,
          leading: BackButton(
            color: darkText,
          ),
          title: Text(widget.productData.name, style: h4),
        ),
        body: ListView(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Center(
                child: Stack(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                      margin: EdgeInsets.only(top: 50, bottom: 100),
                      padding: EdgeInsets.only(top: 100, bottom: 50),
                      width: MediaQuery.of(context).size.width * 0.85,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(widget.productData.name, style: h5),
                          Text(widget.productData.price.toString(), style: h3),
                          Container(
                            margin: EdgeInsets.only(top: 5, bottom: 20),
                            child: SmoothStarRating(
                              allowHalfRating: false,
                              onRatingChanged: (v) {
                                setState(() {
                                  _rating = v;
                                });
                              },
                              starCount: 5,
                              rating: _rating,
                              size: 35.0,
                              color: Colors.orange,
                              borderColor: Colors.orange,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 5, bottom: 25),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  child: Text('Miktar', style: h6),
                                  margin: EdgeInsets.only(bottom: 15),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                      width: 65,
                                      height: 65,
                                      child: OutlineButton(
                                        onPressed: () {
                                          setState(() {
                                            _quantity += 1;
                                          });
                                        },
                                        child: Icon(Icons.add),
                                      ),
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.only(left: 20, right: 20),
                                      child: Text(_quantity.toString(), style: h3),
                                    ),
                                    Container(
                                      width: 65,
                                      height: 65,
                                      child: OutlineButton(
                                        onPressed: () {
                                          setState(() {
                                           if(_quantity == 1) return;
                                             _quantity -= 1; 
                                          });
                                        },
                                        child: Icon(Icons.remove),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          Container(
                            width: 250,
                            height: 50,
                            child: froyoOutlineBtn('Şimdi Al', () {
                               navigateTo_categories_cart(context);
                            //  await null;
                             // List<Product> yiyecek = [];
                           //   yiyecek= await SharedPreferencesHelper.kayitGetirProduct();
                            }),
                          ),
                          Container(
                            margin:
                            EdgeInsets.only(top: 20),
                            width: 250,
                            height: 50,
                            child: froyoFlatBtn('Sepete Ekle', ()  async{
                              String user = jsonEncode(widget.productData);
                              await  SharedPreferencesHelper.AddCartProduct(widget.productData.id, user);
                              Alert(
                                context: context,
                                type: AlertType.success,
                                title: "SEPETE EKLENDİ",

                                //desc: "sepete git veya alışverişe devam et",
                                buttons: [
                                  DialogButton(
                                    child: Text(
                                      "Kapat",
                                      style: TextStyle(color: Colors.white, fontSize: 20),
                                    ),
                                    onPressed: () =>  _goTurnBackScreen(context),

                                    color: Color.fromRGBO(255, 179, 134, 1.0),
                                  ),
                                  DialogButton(
                                    child: Text(
                                      "Sepete Git",
                                      style: TextStyle(color: Colors.white, fontSize: 20),
                                    ),
                                    onPressed: () =>  navigateTo_categories_cart(context),
                                    color: Color.fromRGBO(52, 138, 199, 1.0),
                                  ),

                                ],
                              ).show();
                             /* await null;
                              String user = jsonEncode(widget.productData);
                            await  SharedPreferencesHelper.kayitGirProduct(widget.productData.id, user);
                           // Product a= await SharedPreferencesHelper.kayitGetirProduct(widget.productData.id);
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context){
                                    return AlertDialog(
                                      title: Text("Alert Dialog"),
                                      //content: Text(a.name+ "sepete eklendi"),
                                    );
                                  }
                              );*/
                            }),
                          )

                        ],
                      ),
                      decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 15,
                                spreadRadius: 15,
                                color: Color.fromRGBO(0, 0, 0, .05))
                          ]),
                    ),
                    ),
                    Align(
                        alignment: Alignment.center,
                      child: SizedBox(
                        width: 160,
                        height: 160,
                        child: foodItem(widget.productData,
                            isProductPage: true,
                            onTapped: () {},
                            imgWidth: 250,
                            onLike: () {}),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ));
  }

  void _goTurnBackScreen(BuildContext context) {
    Navigator.pop(context);
  }

  // ignore: non_constant_identifier_names
  void navigateTo_categories_cart(BuildContext context) {
    Navigator.pop(context);//alert ekranını kapatır.
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => Products_Screen_Cart()));// sepet ürünleri sayfasını açar
  }

}
