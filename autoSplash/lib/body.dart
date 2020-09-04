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
          splashGrid(),
        ],
      ),
    );
  }

  Container headerWithSearch(Size size) {
    return Container(
      margin: EdgeInsets.only(bottom: 26),
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

  gridview(AsyncSnapshot<List<Splash>> snapshot) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 1,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        children: snapshot.data.map(
          (splash) {
            return GridTile(
              child: SplashCell(splash),
            );
          },
        ).toList(),
      ),
    );
  }

  Container splashGrid() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: FutureBuilder<List<Splash>>(
              future: Services.getPhotos(),
              builder: (context, snapshot) {
                // error
                if (snapshot.hasError) {
                  return Text('Error ${snapshot.error}');
                }
                // gridView
                if (snapshot.hasData) {
                  // todo: gridView
                  return gridview(snapshot);
                }

                return Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
