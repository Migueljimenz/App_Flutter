// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:app/models/models.dart';
import 'package:flutter/material.dart';

class DataCard extends StatelessWidget {
  const DataCard({Key? key, required this.product}) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {

    

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        margin: EdgeInsets.only(top: 20, bottom: 30),
        width: double.infinity,
        height: 400,
        decoration: _BoxBorder(),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            _BackGroundImage(product.picture),
            _DataDetails(
              title: product.name,
              id: product.id!,
            ),
            Positioned(
              top: 0,
              right: 0,
              child: _PriceTang(
                price: product.price,
              ),
            ),

            // ignore: todo
            //TODO: mostrar de manera condicional
            if (!product.available)
              Positioned(
                top: 0,
                left: 0,
                child: _NotAvailable(),
              ),
          ],
        ),
      ),
    );
  }

  BoxDecoration _BoxBorder() => BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                color: Colors.black, blurRadius: 10, offset: Offset(0, 10))
          ]);
}

class _NotAvailable extends StatelessWidget {
  const _NotAvailable({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FittedBox(
        fit: BoxFit.contain,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Text('Not Available',
              style: TextStyle(fontSize: 20, color: Colors.white)),
        ),
      ),
      width: 100,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.yellow[800],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
    );
  }
}

class _PriceTang extends StatelessWidget {
  const _PriceTang({
    Key? key,
    required this.price,
  }) : super(key: key);

  final double price;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FittedBox(
        fit: BoxFit.fitWidth,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Text('\$$price',
              style: TextStyle(fontSize: 20, color: Colors.white)),
        ),
      ),
      width: 80,
      height: 50,
      decoration: BoxDecoration(
        color: Color.fromRGBO(64, 77, 213, 0.8),
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          bottomLeft: Radius.circular(20),
        ),
      ),
    );
  }
}

class _DataDetails extends StatelessWidget {
  final String title;
  final String id;

  const _DataDetails({
    Key? key,
    this.title = '',
    this.id = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 50),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        width: double.infinity,
        height: 70,
        decoration: _BuildBoxDecoration(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              id,
              style: TextStyle(
                fontSize: 15,
                color: Colors.white,
              ),
              maxLines: 1,
            ),
          ],
        ),
      ),
    );
  }

  BoxDecoration _BuildBoxDecoration() => BoxDecoration(
        color: Color.fromRGBO(64, 77, 213, 0.8),
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          bottomLeft: Radius.circular(20),
        ),
      );
}

class _BackGroundImage extends StatelessWidget {
  final String? url;
  const _BackGroundImage(this.url);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: double.infinity,
        height: 400,
        child: url == null
            ? Image.asset('assets/no-image.png', fit: BoxFit.cover)
            : FadeInImage(
                fit: BoxFit.fill,
                placeholder: AssetImage('assets/jar-loading.gif'),
                image: NetworkImage(url!),
              ),
      ),
    );
  }
}
