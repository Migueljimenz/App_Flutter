// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:app/screen/loading_screen.dart';
import 'package:app/widgets/data_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/products_service.dart';

class Data extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productService = Provider.of<ProductService>(context);

    if (productService.isLoading) {
      return LoadingScreen();
    }

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Products')),
      ),
      body: ListView.builder(
        itemCount: productService.products.length,
        itemBuilder: (BuildContext context, int index) => GestureDetector(
            onTap: () {
              productService.selectedProduct =
                  productService.products[index].copy();
              Navigator.pushNamed(context, 'product');
            },
            child: DataCard(
              product: productService.products[index],
            )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}
