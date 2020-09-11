import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'splash.dart';

class SplashDetails extends StatefulWidget {
  final Splash curSplash;

  SplashDetails({@required this.curSplash});

  @override
  _SplashDetailsState createState() => _SplashDetailsState();
}

class _SplashDetailsState extends State<SplashDetails> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      alignment: Alignment.center,
      child: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: CachedNetworkImage(
              imageUrl: widget.curSplash.full,
              placeholder: (context, url) => new Container(
                height: 250,
                width: 250,
                alignment: Alignment.center,
                child: CircularProgressIndicator(),
              ),
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 0,
            height: MediaQuery.of(context).size.height * 0.3,
            width: MediaQuery.of(context).size.width,
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
    // return Container(
    //   color: Colors.white,
    //   child: Container(
    //     alignment: Alignment.center,
    //     margin: EdgeInsets.all(10),
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.center,
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: [
    //         FadeInImage.assetNetwork(
    //           placeholder: "images/error.jpg",
    //           image: widget.curSplash.full,
    //         ),
    //         SizedBox(
    //           height: 30,
    //         ),
    //         OutlineButton(
    //           child: Icon(Icons.close),
    //           onPressed: () => Navigator.of(context).pop(),
    //         )
    //       ],
    //     ),
    //   ),
    // );
  }
}
