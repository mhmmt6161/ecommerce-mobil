import 'dart:convert';

import 'package:fryo/src/shared/Product.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {


//Kayıt Okumak, Getters;

// tüm key leri döndürür.
  static Future<Set<String>> tumKeyleriGetir() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getKeys();
  }

  // böyle bir key mevcut ise true döndürür.
  static Future<bool> keyVarmi(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.containsKey(key);
  }


// verilen key'in  atanmış olan değeri dynamic tipindedir, her tipte değer döndürebilir.
  static Future<dynamic> kayitOkuDynamic(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.get(key) ?? 'degeryok';
  }

// verilen key'in  atanmış olan değeri bool'dur bu  bool değeri döndürür.
  static Future<bool> kayitOkuBool(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getBool(key) ?? false;
  }

// verilen key'in  atanmış olan değeri int'dur bu  int değeri döndürür.
  static Future<int> kayitOkuInt(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getInt(key) ?? 0;
  }

// verilen key'in  atanmış olan değeri Double'dur bu  Double değeri döndürür.
  static Future<double> kayitOkuDouble(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getDouble(key) ?? 0;
  }

// verilen key'in  atanmış olan değeri string'tir bu  string değeri döndürür.
  static Future<String> kayitOkuString(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString(key) ?? 'degeryok';
  }

//String array(list<String>) kaydı döndürür.
  static Future<List<String> > kayitOkuStringList(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getStringList(key) ?? 'degeryok';
  }



//Kayıt Girmek, Setters;

//Tüm setterler bool döndürür.
//Tüm setterler için null değerleri remove olarak değerlendirilir. Yani anahtar ve değer silinir.

//İlişkili anahtara bool değer kaydeder. Başarılı ise true döndürür
  static Future<bool> kayitGirBool(String key, bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.setBool( key,  value);
  }
  static Future<bool> AddCartProduct(int key, String jsonString) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
  Map json = jsonDecode(jsonString);
  String user = jsonEncode(Product.fromJson(json));
  return pref.setString(key.toString(), user);
  }
  static Future<List> LookCart() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var key=pref.getKeys();
   // List<Product> yiyecek;
    List<Product> yiyecek = [];

    for(int i=0;i<(key.length);i=i+1)
      if(int.parse(key.elementAt(i))<100)
      { Map json = jsonDecode(pref.getString(key.elementAt(i)));
        yiyecek.add(Product.fromJson(json));
        print(yiyecek);
      }
    return yiyecek;
  }
  static Future<bool> AddFavProduct(int key, String jsonString) async {
    SharedPreferences prefFav = await SharedPreferences.getInstance();
    Map json = jsonDecode(jsonString);
    String user = jsonEncode(Product.fromJson(json));
    return prefFav.setString(key.toString(), user);
  }
  static Future<List> LookFav() async {
    SharedPreferences prefFav = await SharedPreferences.getInstance();
    var key=prefFav.getKeys();
    List<Product> yiyecek = [];

    for(int i=0;i<(key.length);i=i+1)
     if(int.parse(key.elementAt(i))>100)
    {  Map json = jsonDecode(prefFav.getString(key.elementAt(i)));
    yiyecek.add(Product.fromJson(json));
    print(yiyecek);
    }
    return yiyecek;
  }
//İlişkili anahtara int değer kaydeder. Başarılı ise true döndürür
  static Future<bool> kayitGirInt(String key, int value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.setInt( key,  value);
  }

//İlişkili anahtara Double değer kaydeder. Başarılı ise true döndürür
  static Future<bool> kayitGirDouble(String key, double value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.setDouble( key,  value);
  }

//İlişkili anahtara String değer kaydeder. Başarılı ise true döndürür
  static Future<bool> kayitGirString(String key, String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.setString( key,  value);
  }

//İlişkili anahtara StringList değer kaydeder. Başarılı ise true döndürür
  static Future<bool> kayitGirStringList(String key, List<String> value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.setStringList( key, value);
  }



//Kayıt Silmek;

// Bir anahtarı kalıcı bellekten kaldırır ve true döndürür. Tüm setterler için null değerleri remove olarak değerlendirilir. Yani anahtar ve değer silinir.
  static Future<bool> birKayitSil(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.remove(key);
  }

// kullanıcı verilerinin tüm anahtar değer  çiftlerini siler ve true döndürür
  static Future<bool> tumKayitSil() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.clear();
  }


} 