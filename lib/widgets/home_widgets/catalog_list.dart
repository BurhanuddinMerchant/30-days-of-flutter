import 'package:flutter/material.dart';
import 'package:flutter_application/models/catalog.dart';
import 'package:flutter_application/pages/home_detali_page.dart';
import 'package:velocity_x/velocity_x.dart';

import 'catalog_item.dart';

class CatalogList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return !context.isMobile
        ? GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 20),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final catalog = CatalogModel.items[index];
              return InkWell(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              HomeDetailPage(catalog: catalog))),
                  child: CatalogItem(catalog: catalog));
            },
            itemCount: CatalogModel.items.length)
        : ListView.builder(
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final catalog = CatalogModel.items[index];
              return InkWell(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              HomeDetailPage(catalog: catalog))),
                  child: CatalogItem(catalog: catalog));
            },
            itemCount: CatalogModel.items.length);
  }
}
