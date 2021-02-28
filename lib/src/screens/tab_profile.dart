import 'package:flutter/material.dart';
import '../model/constants.dart';
import '../prf/profile_list_item.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kAppPrimaryColor,

      body: Stack(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(5),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 20),
                ),
                AvatarImage(),
                SizedBox(
                  height: 10,
                ),
                SocialIcons(),
                SizedBox(height: 10),
                Text(
                  'Muhammet TÜTÜNCÜ',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Poppins"
                  ),
                ),
                Text(
                  'bilgi',
                  style: TextStyle(fontWeight: FontWeight.w300),
                ),
                SizedBox(height: 15),
                ProfileListItems(),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class AppBarButton extends StatelessWidget {
  final IconData icon;

  const AppBarButton({this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 55,
      height: 55,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: kAppPrimaryColor,
          boxShadow: [
            BoxShadow(
              color: kLightBlack,
              offset: Offset(1, 1),
              blurRadius: 10,
            ),
            BoxShadow(
              color: kWhite,
              offset: Offset(-1, -1),
              blurRadius: 10,
            ),
          ]),
      child: Icon(
        icon,
        color: fCL,
      ),
    );
  }
}

class AvatarImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      padding: EdgeInsets.all(8),
      decoration: avatarDecoration,
      child: Container(
        decoration: avatarDecoration,
        padding: EdgeInsets.all(3),
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage('images/1.png'),
            ),
          ),
        ),
      ),
    );
  }
}

class SocialIcons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SocialIcon(
          color: Color(0xFF102397),
          iconData: LineAwesomeIcons.facebook,
          //iconData: facebook,

          onPressed: () {},
        ),
        SocialIcon(
          color: Color(0xFFff4f38),
          iconData: LineAwesomeIcons.google_plus,
          onPressed: () {},
        ),
        SocialIcon(
          color: Color(0xFF38A1F3),
          iconData: LineAwesomeIcons.twitter,
          onPressed: () {},
        ),
        SocialIcon(
          color: Color(0xFF2867B2),
          iconData: LineAwesomeIcons.linkedin,
          onPressed: () {},
        )
      ],
    );
  }
}

class SocialIcon extends StatelessWidget {
  final Color color;
  final IconData iconData;
  final Function onPressed;

  SocialIcon({this.color, this.iconData, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: EdgeInsets.only(left: 20.0),
      child: Container(
        width: 45.0,
        height: 45.0,
        decoration: BoxDecoration(shape: BoxShape.circle, color: color),
        child: RawMaterialButton(
          shape: CircleBorder(),
          onPressed: onPressed,
          child: Icon(iconData, color: Colors.white),
        ),
      ),
    );
  }
}

class ProfileListItems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: <Widget>[
          ProfileListItem(
            icon: LineAwesomeIcons.user_shield,
            text: 'Ürünlerim',
          ),
          ProfileListItem(
            icon: LineAwesomeIcons.history,
            text: 'Satın Aldıklarım',
          ),
          ProfileListItem(
            icon: LineAwesomeIcons.question_circle,
            text: 'Adres Bilgilerim',
          ),
          ProfileListItem(
            icon: LineAwesomeIcons.cog,
            text: 'Malum İşler',
          ),
          ProfileListItem(
            icon: LineAwesomeIcons.user_plus,
            text: 'Habu Akan Dereler',
          ),
          ProfileListItem(
            icon: LineAwesomeIcons.alternate_sign_out,
            text: 'Ayarlar Gari',
            hasNavigation: false,
          ),
        ],
      ),
    );
  }
}
