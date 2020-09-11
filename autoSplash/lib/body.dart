import 'package:autoSplash/details.dart';
import 'package:autoSplash/gridcell.dart';
import 'package:autoSplash/services.dart';
import 'package:autoSplash/splash.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          headerWithSearch(size),
          Container(
            height: size.height,
            child: SplashGrid(),
          ),
        ],
      ),
    );
  }

  Container headerWithSearch(Size size) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      height: size.height * 0.2,
      child: Stack(
        children: [
          Container(
              padding: EdgeInsets.only(
                left: size.width * 0.275,
                bottom: 50,
              ),
              height: size.height * 0.2 - 27,
              decoration: BoxDecoration(
                color: Color(0xFF189AB4),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(36),
                    bottomRight: Radius.circular(36)),
              ),
              child: Row(
                children: [
                  Text(
                    'AutoSplash',
                    style: TextStyle(
                      fontFamily: 'poppins',
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              )),
          Positioned(
            bottom: 0,
            left: 10,
            right: 10,
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.fromLTRB(10, 3, 0, 0),
              margin: EdgeInsets.symmetric(horizontal: 20),
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 5),
                      blurRadius: 20,
                      color: Colors.black.withOpacity(0.23))
                ],
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search for something',
                  hintStyle: TextStyle(
                    color: Colors.black.withOpacity(0.5),
                  ),
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  prefixIcon: IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {},
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class SplashGrid extends StatefulWidget {
  @override
  _SplashGridState createState() => _SplashGridState();
}

class _SplashGridState extends State<SplashGrid> {
  List imageList = new List<Splash>();
  bool isLoading = false;
  int pageCount = 1;
  ScrollController _scrollController;

  @override
  void initState() {
    super.initState();

    addImage(1);

    _scrollController = new ScrollController(initialScrollOffset: 5)
      ..addListener(_scrollListener);
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      controller: _scrollController,
      scrollDirection: Axis.vertical,
      crossAxisCount: 2,
      childAspectRatio: 0.75,
      mainAxisSpacing: 2,
      crossAxisSpacing: 2,
      padding: EdgeInsets.all(5),
      physics: const AlwaysScrollableScrollPhysics(),
      children: imageList.map((splash) {
        return GestureDetector(
          child: Container(
            alignment: Alignment.center,
            child: GridTile(
              child: SplashCell(splash),
            ),
          ),
          onTap: () => detailsPage(context, splash),
        );
      }).toList(),
    );
  }

  detailsPage(BuildContext context, Splash splash) {
    Navigator.push(
      context,
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (BuildContext context) => SplashDetails(
          curSplash: splash,
        ),
      ),
    );
  }

  _scrollListener() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      setState(() {
        isLoading = true;
        if (isLoading) {
          print("loading more...");
          pageCount += 1;
          addImage(pageCount);
        }
      });
    }
  }

  void addImage(int pageCount) async {
    ImgResponse response = ImgResponse(
      splash: await Services.getPhotos(page: pageCount),
    );
    imageList.addAll(response.splash);

    isLoading = false;
  }
}

class ImgResponse {
  List<Splash> splash;
  ImgResponse({this.splash});
}
