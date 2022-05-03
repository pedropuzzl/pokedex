import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.network(
              'https://wallpaperaccess.com/full/45634.png',
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: Container(
              color: Colors.black12,
            ),
          ),
          Positioned.fill(
            child: Center(
              child: Image.network(
                'https://logodownload.org/wp-content/uploads/2017/08/pokemon-logo-8.png',
                width: 240,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
