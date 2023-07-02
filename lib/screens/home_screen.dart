import 'package:flutter/material.dart';
import 'package:learning_bloc/screens/product_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen"),
      ),
      body: Center(
        child: TextButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return ProductScreen();
            }));
          },
          child: Text(
            "Get Products",
            style: TextStyle(fontSize: 22),
          ),
        ),
      ),
    );
  }
}