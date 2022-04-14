// ignore_for_file: unnecessary_this

import 'dart:convert';

import 'package:app/models/products.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProductService extends ChangeNotifier {
  final String _baseUrl = 'app-flutter-5ea57-default-rtdb.firebaseio.com';

  final List<Product> products = [];

  late Product selectedProduct;

  bool isLoading = true;

  ProductService() {
    this.loadProducts();
  }

  Future loadProducts() async {
    this.isLoading = true;
    notifyListeners();

    final url = Uri.https(_baseUrl, 'products.json');
    final response = await http.get(url);

    final Map<String, dynamic> productsData = json.decode(response.body);

    productsData.forEach((key, value) {
      final temproduct = Product.fromMap(value);
      temproduct.id = key;
      this.products.add(temproduct);
    });

    this.isLoading = false;
    notifyListeners();
  }
}
