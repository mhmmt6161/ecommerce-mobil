import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fryo/src/shared/colors.dart';
import 'package:fryo/src/shared/fryo_icons.dart';
import 'package:fryo/src/shared/styles.dart';

import 'categories_store.dart';

Widget headerTopCategories(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      //sectionHeaderRow('Kategoriler', onViewMore: () {}),
      SizedBox(
        height: 120,
        child: ListView(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          padding: EdgeInsets.only(top: 10),
          children: <Widget>[
            headerCategoryItem('Yiyecek', Fryo.dinner, onPressed: () {
              navigateTo_categories_store(context);
            }),
            headerCategoryItem('Yağlar', Fryo.food, onPressed: () {
              navigateTo_categories_store(context);
            }),
            headerCategoryItem('Tohum', Fryo.poop, onPressed: () {
              navigateTo_categories_store(context);
            }),
            headerCategoryItem('Kitaplar', Fryo.coffee_cup, onPressed: () {
              navigateTo_categories_store(context);
            }),
            headerCategoryItem('İkinci El', Fryo.leaf, onPressed: () {
              navigateTo_categories_store(context);
            }),
          ],
        ),
      )
    ],
  );
}

// ignore: non_constant_identifier_names
void navigateTo_categories_store(BuildContext context) {
  /*Navigator.of(context).push(CupertinoPageRoute(
      builder: (BuildContext context) => Products_Screen_Categories()));*/
 Navigator.push(context,
      MaterialPageRoute(builder: (context) => Products_Screen_Categories()));
}

Widget headerCategoryItem(String categori_name, IconData icon, {onPressed}) {
  return Container(
    margin: EdgeInsets.only(left: 15),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
            margin: EdgeInsets.only(bottom: 5),
            width: 70,
            height: 70,
            child: FloatingActionButton(
              shape: CircleBorder(),
              heroTag: categori_name,
              onPressed: onPressed,
              backgroundColor: white,
              child: Icon(icon, size: 45, color: Colors.black87),
            )),
        Text(categori_name + ' ›', style: categoryText)
      ],
    ),
  );
}
