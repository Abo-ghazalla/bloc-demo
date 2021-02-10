import 'package:flutter/material.dart';

class TheImage extends StatelessWidget {
  final String image;

  const TheImage({this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipRRect(
        child:
            // Image.asset(
            Image.network(
          image,
          width: double.infinity,
          height: 165,
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
