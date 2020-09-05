import 'package:flutter/material.dart';
import 'splash.dart';

class SplashCell extends StatelessWidget {
  const SplashCell(this.splash);
  @required
  final Splash splash;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
      ),
      color: Colors.red,
      child: Padding(
        padding: EdgeInsets.all(0),
        child: Container(
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              // mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: FadeInImage.assetNetwork(
                      placeholder: "images/error.jpg",
                      image: splash.thumb,
                      fit: BoxFit.none,
                      width: splash.width.toDouble(),
                      height: splash.height.toDouble(),
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
