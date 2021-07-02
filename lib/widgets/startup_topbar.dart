
import 'package:flutter/material.dart';
import 'package:sample_app/extras/constance.dart';

class StartUpTopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SafeArea(
          child: Container(
            width: double.infinity,
            child: Column(
              children: [
                (mediaQueryHeight(context) * 0.04).addHSpace(),
                Image.asset(
                  'asset/logo.png',
                  fit: BoxFit.cover,
                  width: mediaQueryWidth(context) * 0.45,
                ),
                (mediaQueryHeight(context) * 0.04).addHSpace(),
              ],
            ),
          ),
        ),
        Image.asset(
          'asset/buid.png',
          height: mediaQueryHeight(context) * 0.2,
        ),
      ],
    );
  }
}