import 'package:flutter/material.dart';

class PageUnknown extends StatelessWidget {
  const PageUnknown({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: const BoxConstraints.expand(),
        child: const Center(
          child: Text(
            "404 NOT FOUND"
          ),
        ),
      ),
    );
  }
}
