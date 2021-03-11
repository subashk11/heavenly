import 'package:heavenly/models/destination_model.dart';
import 'package:flutter/material.dart';

class destinationScreen extends StatefulWidget {
  Destination destination;
  destinationScreen({this.destination});
  @override
  _destinationScreenState createState() => _destinationScreenState();
}

class _destinationScreenState extends State<destinationScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: 350,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0.0, 2.0),
                      blurRadius: 6.0,
                      color: Colors.black26,
                    ),
                  ]),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30.0),
                child: Image(
                  image: AssetImage(widget.destination.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
