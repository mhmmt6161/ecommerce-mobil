import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fryo/src/shared/Product.dart';
import 'package:fryo/src/shared/fryo_icons.dart';
import 'package:fryo/src/shared/product_create_item.dart';
import 'package:fryo/src/shared/shared_preferences_manager.dart';
import 'package:fryo/src/shared/styles.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'ProductPage.dart';
import 'product_categories.dart';
import 'product_header_creation.dart';

 // ignore: camel_case_types
 class Products_Screen_Cart extends StatefulWidget {
   @override
   _Products_Screen_Cart createState() => _Products_Screen_Cart();
 }
// ignore: camel_case_types
class _Products_Screen_Cart extends State<Products_Screen_Cart>{
  Future<List> myCartFuture;
  List<Product> _data = new List();

  @override
  void initState() {
    super.initState();
      myCartFuture = _loadData();
  }
  void refreshList() {
    // reload
    setState(() {
      myCartFuture = _loadData();
    });
  }
  Future<List> _loadData() async {
       return await SharedPreferencesHelper.LookCart();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title:
        Text('--SEPETİM--', style: logoWhiteStyle, textAlign: TextAlign.left),
        actions: <Widget>[
        ],),

          body: Container(
          child:  FutureBuilder<List>(
              future: myCartFuture,
              builder: (context, snapshot) {
            return snapshot.hasError
            ? Center(child: Text("SEPETİNİZDE ÜRÜN BULUNMAMAKTADIR"))
                : snapshot.hasData
            ? Container(
            child: ListView(children: <Widget>[ // bu şekilde yazınca (The getter 'length' was called on null. Receiver: null Tried calling: length) hatasını vermiyor
            for(int i=0;i<(snapshot.data.length);i++)
            products_cart(onViewMore: () {}, items: <Widget>[
            foodItemForCart(snapshot.data[i] , onTapped: () {
            Navigator.push(
            context,
            MaterialPageRoute(
            builder: (context) {
            return new ProductPage(
            productData: snapshot.data[i],
            );
            },
            ),
            );
            }, imgWidth: 250, onDelete: () {
              SharedPreferencesHelper.birKayitSil(snapshot.data[i].id.toString());
              refreshList();}
            )
            ])]))

                :Container( child: LinearProgressIndicator());
              },
          )));
  }}
