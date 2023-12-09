import 'package:flutter/material.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Karna",
          style: TextStyle(
              color: Colors.black, fontSize: 32, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
