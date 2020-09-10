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

  // gridview(AsyncSnapshot<List<Splash>> snapshot) {
  //   return Padding(
  //     padding: EdgeInsets.all(5),
  //     child: GridView.count(
  //       crossAxisCount: 2,
  //       childAspectRatio: 0.75,
  //       mainAxisSpacing: 4,
  //       crossAxisSpacing: 4,
  //       children: snapshot.data.map(
  //         (splash) {
  //           return GridTile(
  //             child: SplashCell(splash),
  //           );
  //         },
  //       ).toList(),
  //     ),
  //   );
  // }

  // Container splashGrid() {
  //   return Container(
  //     child: Column(
  //       mainAxisAlignment: MainAxisAlignment.start,
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       mainAxisSize: MainAxisSize.min,
  //       children: [
  //         Flexible(
  //           child: FutureBuilder<List<Splash>>(
  //             future: Services.getPhotos(),
  //             builder: (context, snapshot) {
  //               // error
  //               if (snapshot.hasError) {
  //                 return Text('Error ${snapshot.error}');
  //               }
  //               // gridView
  //               if (snapshot.hasData) {
  //                 // todo: gridView
  //                 return gridview(snapshot);
  //               }

  //               return Center(
  //                 child: CircularProgressIndicator(),
  //               );
  //             },
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
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
      mainAxisSpacing: 10,
      physics: const AlwaysScrollableScrollPhysics(),
      children: imageList.map((splash) {
        return Container(
          alignment: Alignment.center,
          height: MediaQuery.of(context).size.height * 0.2,
          margin: EdgeInsets.only(left: 10, right: 10),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.red),
          ),
          child: GridTile(
            child: SplashCell(splash),
          ),
        );
      }).toList(),
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
    imgResponse response = imgResponse(
      splash: await Services.getPhotos(page: pageCount),
    );
    imageList.add(response.splash);
    isLoading = false;
  }
}

class imgResponse {
  List<Splash> splash;
  imgResponse({this.splash});
}
