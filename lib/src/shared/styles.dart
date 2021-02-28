import 'package:flutter/material.dart';
import './colors.dart';

/////////////////////////////////
///   TEXT STYLES
////////////////////////////////

const logoStyle = TextStyle(
    fontFamily: 'Pacifico',
    fontSize: 30,
    color: Colors.black54,
    letterSpacing: 2);

const logoWhiteStyle = TextStyle(
    fontFamily: 'Pacifico',
    fontSize: 21,
    letterSpacing: 2,
    color: Colors.white);
const whiteText = TextStyle(color: Colors.white, fontFamily: 'Poppins');
const disabledText = TextStyle(color: Colors.grey, fontFamily: 'Poppins');
const contrastText = TextStyle(color: primaryColor, fontFamily: 'Poppins');
const contrastTextAll = TextStyle(color: primaryColor, fontFamily: 'Poppins', letterSpacing: 1, fontSize: 16);
const contrastTextBold = TextStyle(
    color: primaryColor, fontFamily: 'Poppins', fontWeight: FontWeight.w600);

const h3 = TextStyle(
    color: Colors.black,
    fontSize: 24,
    fontWeight: FontWeight.w800,
    fontFamily: 'Poppins');

const h4 = TextStyle(
    color: Colors.black,
    fontSize: 18,
    fontWeight: FontWeight.w700,
    fontFamily: 'Poppins');
    
const h5 = TextStyle(
    color: Colors.black,
    fontSize: 18,
    fontWeight: FontWeight.w500,
    fontFamily: 'Poppins');

    const h6 = TextStyle(
    color: Colors.black,
    fontSize: 16,
    fontWeight: FontWeight.w500,
    fontFamily: 'Poppins');


const priceText = TextStyle(
    color: Colors.green,
    fontSize: 17,
    fontWeight: FontWeight.w600,
    fontFamily: 'Poppins');

const foodNameText = TextStyle(
    color: Colors.black,
    fontSize: 17,
    fontWeight: FontWeight.w600,
    fontFamily: 'Poppins');

const tabLinkStyle =
    TextStyle(fontWeight: FontWeight.w500, fontSize: 14);

const taglineText = TextStyle(color: Colors.grey, fontFamily: 'Poppins');
const categoryText = TextStyle(
    color: Color(0xff444444),
    fontWeight: FontWeight.w700,
    fontFamily: 'Poppins');

const inputFieldTextStyle =
    TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.w500);

const inputFieldHintTextStyle =
    TextStyle(fontFamily: 'Poppins', color: Color(0xff444444));

const inputFieldPasswordTextStyle = TextStyle(
    fontFamily: 'Poppins', fontWeight: FontWeight.w500, letterSpacing: 3);

const inputFieldHintPaswordTextStyle = TextStyle(
    fontFamily: 'Poppins', color: Color(0xff444444), letterSpacing: 2);

///////////////////////////////////
/// BOX DECORATION STYLES
//////////////////////////////////

const authPlateDecoration = BoxDecoration(
    color: white,
    boxShadow: [
      BoxShadow(
          color: Color.fromRGBO(0, 0, 0, .1),
          blurRadius: 10,
          spreadRadius: 5,
          offset: Offset(0, 1))
    ],
    borderRadius: BorderRadiusDirectional.only(
        bottomEnd: Radius.circular(20), bottomStart: Radius.circular(20)));

/////////////////////////////////////
/// INPUT FIELD DECORATION STYLES
////////////////////////////////////

const inputFieldFocusedBorderStyle = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(6)),
    borderSide: BorderSide(
      color: primaryColor,
    ));

const inputFieldDefaultBorderStyle = OutlineInputBorder(
    gapPadding: 0, borderRadius: BorderRadius.all(Radius.circular(6)));
MaterialColor materialOrange = MaterialColor(
  0xFFF57C00, // this is the primary color, it is set to the value of orange[800]
  <int, Color>{
    50: Color(0xFFFFF3E0),
    100: Color(0xFFFFE0B2),
    200: Color(0xFFFFCC80),
    300: Color(0xFFFFB74D),
    400: Color(0xFFFFA726),
    500: Color(0xFFF57C00),
    600: Color(0xFFF57C00),
    700: Color(0xFFF57C00),
    800: Color(0xFFEF6C00),
    900: Color(0xFFE65100),
  },
);