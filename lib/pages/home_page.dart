import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application/core/store.dart';
import 'package:flutter_application/models/cart.dart';
import 'dart:convert';
import 'package:flutter_application/models/catalog.dart';
import 'package:flutter_application/utlis/main.dart';
import 'package:flutter_application/widgets/home_widgets/catalog_header.dart';
import 'package:flutter_application/widgets/home_widgets/catalog_list.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final url = "https://api.jsonbin.io/b/617ed9fdaa02be1d446181bd";
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    // final catalogJson = await rootBundle.loadString("assets/files/catalog.json");
    final response = await http.get(Uri.parse(url));
    final catalogJson = response.body;
    final decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final _cart = (VxState.store as MyStore).cart;
    return Scaffold(
        backgroundColor: context.canvasColor,
        floatingActionButton: VxBuilder(
          mutations: {RemoveMutation, AddMutation},
          builder: (context, _, __) => FloatingActionButton(
            onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoute),
            child: Icon(
              CupertinoIcons.cart,
              color: Colors.white,
            ),
            backgroundColor: context.theme.buttonColor,
          ).badge(
              color: Vx.red500,
              size: 22,
              count: _cart.items.length,
              textStyle: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              )),
        ),
        body: SafeArea(
          child: Container(
            padding: Vx.m32,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CatalogHeader(),
                if (CatalogModel.items.isNotEmpty)
                  CatalogList().py16().expand()
                else
                  Center(child: CircularProgressIndicator()).expand()
              ],
            ),
          ),
        ));
  }
}
