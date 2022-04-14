// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, prefer_const_literals_to_create_immutables, unused_local_variable

import 'package:app/services/products_service.dart';
import 'package:app/ui/input_decorations.dart';
import 'package:app/widgets/product_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productServices = Provider.of<ProductService>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                ProductImage(
                  url: productServices.selectedProduct.picture,
                ),
                Positioned(
                  top: 60,
                  left: 30,
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      size: 40,
                      color: Colors.white,
                    ),
                  ),
                ),
                Positioned( 
                  top: 60,
                  right: 30,
                  child: IconButton(
                    onPressed: () {
                      // ignore: todo
                      //TODO: camara o galeria
                    },
                    icon: Icon(
                      Icons.camera_alt_outlined,
                      size: 40,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  height: 100,
                ),
              ],
            ),
            _FormProduct(),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.save_outlined),
      ),
    );
  }
}

class _FormProduct extends StatelessWidget {
  const _FormProduct({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        decoration: _BuildBoxDecoration(),
        child: Form(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              TextFormField(
                decoration: InputDecorations.loginFormInput(
                  labelText: 'Nombre :',
                  hintText: 'Nombre del producto',
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecorations.loginFormInput(
                  labelText: 'Precio :',
                  hintText: '\$150.0',
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SwitchListTile.adaptive(
                  value: true,
                  title: Text('Disponible'),
                  activeColor: Color.fromRGBO(64, 77, 213, 0.8),
                  onChanged: (value) {}),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }

  BoxDecoration _BuildBoxDecoration() => BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(45), bottomRight: Radius.circular(45)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 5,
            offset: Offset(0, 5), // changes position of shadow
          ),
        ],
      );
}
