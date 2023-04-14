import 'package:flutter/material.dart';
class Card_custom extends StatefulWidget {
  const Card_custom({Key? key}) : super(key: key);

  @override
  State<Card_custom> createState() => _Card_customState();
}

class _Card_customState extends State<Card_custom> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Container(
        width: 300,
        decoration: BoxDecoration(color: Colors.blue,
            borderRadius: BorderRadius.circular(16)),
        child: Column(
          children: [

          ],
        ),
      ),
    );;
  }
}
