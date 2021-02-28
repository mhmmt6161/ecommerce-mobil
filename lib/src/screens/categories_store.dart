import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fryo/src/shared/Product.dart';
import 'package:fryo/src/shared/fryo_icons.dart';
import 'package:fryo/src/shared/product_create_item.dart';
import 'package:fryo/src/shared/shared_preferences_manager.dart';
import 'package:fryo/src/shared/styles.dart';
import 'ProductPage.dart';
import 'product_header_creation.dart';
import 'package:http/http.dart' as http;
// ignore: camel_case_types
class Products_Screen_Categories extends StatefulWidget {
  @override
  _Products_Screen_Categories createState() => _Products_Screen_Categories();
}
// ignore: camel_case_types
class _Products_Screen_Categories extends State<Products_Screen_Categories>{
  //Your code here
  Future myProductFuture;
  String url = 'http://localhost:8080/api/products';
  @override
  void initState() {
    super.initState();
    myProductFuture = getPost();
  }
  void refreshList() {
    // reload
    setState(() {
      myProductFuture = _loadData();
    });
  }
  Future<List> _loadData() async {
    await Future.delayed(Duration(seconds: 1));
    String jsonString = await rootBundle.loadString('assets/products.json');
    List jsonresponse = json.decode(jsonString).toList();
    return jsonresponse.map((v) => Product.fromJson(v)).toList(); //?? 'default'; eklemeli
  }
  Future<List> getPost() async{
    await Future.delayed(Duration(seconds: 1));
    final response = await http.get('http://192.168.1.39:8080/api/products/');
    print(response.body);
    print("sadasdasdasdas"); print(response.statusCode);
    print("sadasdasdasdas");
  //  final jsonData = json.decode(response.body);
    List jsonresponse = json.decode(response.body).toList();
    return jsonresponse.map((v) => Product.fromJson(v)).toList(); //?? 'default'; eklemeli

  }

  final List<String> list = List.generate(10, (index) => "Text $index");
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
        body: Container(
           child:  FutureBuilder<List<dynamic>>(
              future: myProductFuture,
              builder: (context, snapshot) {
                 return snapshot.hasError
              ? Center(child: Text("BU KATEGORİDE ÜRÜN BULUNMAMAKTADIR"))
                : snapshot.hasData
              ?  Container(
                child: ListView(children: <Widget>[
                for(int i=0;i<(snapshot.data.length);i=i+2)
                    products_category(onViewMore: () {}, items: <Widget>[
                      foodItemForCategori(snapshot.data[i], onTapped: () {
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
                  }, onLike: () async{
                     String user = jsonEncode(snapshot.data[i]);
                      await  SharedPreferencesHelper.AddFavProduct(snapshot.data[i].id+101, user);}),

                  if(!((snapshot.data.length)%2==1 && (snapshot.data.length)==(i+1)))
                  foodItemForCategori(snapshot.data[i+1], onTapped: () {
                  Navigator.push(
                  context,
                  MaterialPageRoute(
                  builder: (context) {
                  return new ProductPage(
                  productData: snapshot.data[i+1],
                  );
                  },
                  ),
                  );
                  }, imgWidth: 250, onLike: () async{
                String user = jsonEncode(snapshot.data[i+1]);
                await  SharedPreferencesHelper.AddFavProduct(snapshot.data[i+1].id+101, user);}
                  ),

                ])]))

                  :Container( child: Center(child: CircularProgressIndicator()));
    },
    )));
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
