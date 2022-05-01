import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.network(
              'https://wallpaperaccess.com/full/20993.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: Container(
              color: Colors.black38,
            ),
          ),
          Positioned.fill(
            child: Center(
              child: Image.network(
                'https://logodownload.org/wp-content/uploads/2017/08/pokemon-logo-8.png',
                width: 200,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
