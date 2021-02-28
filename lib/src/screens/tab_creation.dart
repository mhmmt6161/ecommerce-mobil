import 'package:flutter/material.dart';
import 'package:fryo/src/screens/tab_newProduct.dart';
import 'package:fryo/src/screens/tab_profile.dart';
import '../shared/styles.dart';
import '../shared/colors.dart';
import '../shared/fryo_icons.dart';
import '../screens/tab_store.dart';
import 'categories_cart.dart';
import 'fav_cart.dart';

class TabCreation extends StatefulWidget {
  final String pageTitle;

  TabCreation({Key key, this.pageTitle}) : super(key: key);

  @override
  _TabCreationState createState() => _TabCreationState();
}

class _TabCreationState extends State<TabCreation> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final _tabs = [
      Products_Screen(), //in tab_store
      Products_Screen_Cart(),
      EditProfilePage(),
      Products_Screen_Fav(),
      MyHomePage(), //in tab_profile

    ];

    return Scaffold(
        backgroundColor: bgColor,
        //extendBodyBehindAppBar: true, // app bar görünmezlik durumu- app barları tab classların içerisinde oluşturduğumuz için burada devre dışı
        body: _tabs[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Fryo.shop),
                title: Text(
                  'Mağaza',
                  style: tabLinkStyle,
                )),
            BottomNavigationBarItem(
                icon: Icon(Fryo.cart),
                title: Text(
                  'Sepetim',
                  style: tabLinkStyle,
                )),
            BottomNavigationBarItem(
                icon: Icon(Icons.add_comment_outlined, size:38),
                title: Text(
                  'ÜRÜN EKLE',
                  style: tabLinkStyle,
                )),
            BottomNavigationBarItem(
                icon: Icon(Fryo.heart_1),
                title: Text(
                  'Favorilerim',
                  style: tabLinkStyle,
                )),
            BottomNavigationBarItem(
                icon: Icon(Fryo.user_1),
                title: Text(
                  'Profilim',
                  style: tabLinkStyle,
                )),
          ],
          currentIndex: _selectedIndex,
          type: BottomNavigationBarType.fixed,
          backgroundColor: white,
          fixedColor: materialOrange.shade900,
          // seçili tab rengi
          onTap: _onItemTapped, // Hangi tab seçildi
        ));
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
