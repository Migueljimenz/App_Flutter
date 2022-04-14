// prefer_const_constructors, non_constant_identifier_names

// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, non_constant_identifier_names, unnecessary_this

import 'package:flutter/material.dart';

class ProductImage extends StatelessWidget {
  final String? url;

  const ProductImage({Key? key, this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
      child: Container(
        width: double.infinity,
        height: 400,
        decoration: _BuilBoxDecoration(),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(45),
            topRight: Radius.circular(45),
          ),
          child: this.url == null
              ? Image(
                  image: AssetImage('assets/no-image.png'), fit: BoxFit.fill)
              : FadeInImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(url!),
                  placeholder: AssetImage('assets/jar-loading.gif'),
                ),
        ),
      ),
    );
  }

  BoxDecoration _BuilBoxDecoration() => BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(45), topRight: Radius.circular(45)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 5,
            offset: Offset(0, 5), // changes position of shadow
          ),
        ],
      );
}
