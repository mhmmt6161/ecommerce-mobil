import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fryo/src/shared/styles.dart';

Widget products_deals(String dealTitle, {onViewMore, List<Widget> items}) { //ana sayfadaki ürünleri oluşturur
  return Container(
    margin: EdgeInsets.only(top: 1), // deals kategorilere ne kadar uzak olsun
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        sectionHeaderRow(dealTitle, onViewMore: onViewMore),
        SizedBox(
          //kutuları oluşturur
          height: 180, // deals bölümünün uzunluğu
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: (items != null)
                ? items
                : <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 15),
                      child: Text('Herhangi bir ürün yok', style: taglineText),
                    )
                  ],
          ),
        )
      ],
    ),
  );
}

Widget products_category({onViewMore, List<Widget> items}) {// kategori sayfalarındaki ürünleri oluşturur
  return Container(
    margin: EdgeInsets.only(top: 2, left: 5),
    // deals kategorilere ne kadar uzak olsun

    child: Column(
      children: <Widget>[
        SizedBox(
          //kutuları oluşturur
          height: 200, // deals bölümünün uzunluğu
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: (items != null)
                ? items
                : <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 15),
                      child: Text('Herhangi bir ürün yok', style: taglineText),
                    )
                  ],
          ),
        ),
      ],
    ),
  );
}
// ignore: non_constant_identifier_names
Widget products_cart({onViewMore, List<Widget> items}) {// kategori sayfalarındaki ürünleri oluşturur
  return
    Container(
    margin: EdgeInsets.only(top: 10, left: 30),
    // deals kategorilere ne kadar uzak olsun
    child: new Column(
      children: <Widget>[
        SizedBox(
          //kutuları oluşturur
          height: 200, // deals bölümünün uzunluğu
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: (items != null)
                ? items
                : <Widget>[
              Container(
                margin: EdgeInsets.only(left: 15),
                child: Text('Herhangi bir ürün yok', style: taglineText),
              )
            ],
          ),
        ),
      ],
    ),
  );
}
Widget sectionHeaderRow(String headerTitle, {onViewMore}) {
  // bölüm başlarındaki isimlendirme ve Tümü butonu
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Container(
        margin: EdgeInsets.only(left: 20, top: 1),
        child: Text(headerTitle, style: h4),
      ),
      Container(
        margin: EdgeInsets.only(left: 15, top: 0),
        /*child: FlatButton(
          onPressed: onViewMore,
          child: Text('Tümü ›', style: contrastTextAll),
        ),*/
      )
    ],
  );
}
