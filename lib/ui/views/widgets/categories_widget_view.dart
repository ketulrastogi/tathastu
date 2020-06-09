import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoriesWidetView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 156.0,
      padding: EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            child: Text(
              'DAILY FRESH',
              style: GoogleFonts.nunito(
                textStyle: Theme.of(context).textTheme.subtitle1.copyWith(
                    color: Colors.blueGrey.shade900,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Container(
            // padding: EdgeInsets.all(8.0),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemCount: 5,
              shrinkWrap: true,
              primary: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
                  // height: 100.0,
                  // width: 100.0,
                  margin: EdgeInsets.all(4.0),
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade100,
                          blurRadius: 2.0,
                          spreadRadius: 2.0,
                        ),
                      ]),
                  child: Column(
                    children: <Widget>[
                      Image.asset('assets/images/Vegetables.png'),
                      Text(
                        'Vegetables',
                        style: GoogleFonts.nunito(
                          textStyle:
                              Theme.of(context).textTheme.subtitle2.copyWith(
                                    color: Colors.blueGrey.shade900,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class CategoriesWidetViewOld extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 156.0,
      padding: EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            child: Text(
              'DAILY FRESH',
              style: GoogleFonts.nunito(
                textStyle: Theme.of(context).textTheme.subtitle1.copyWith(
                    color: Colors.blueGrey.shade900,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Flexible(
                  flex: 1,
                  child: Container(
                    // height: 100.0,
                    // width: 100.0,
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade100,
                            blurRadius: 4.0,
                            spreadRadius: 4.0,
                          ),
                        ]),
                    child: Column(
                      children: <Widget>[
                        Image.asset('assets/images/Vegetables.png'),
                        Text(
                          'Vegetables',
                          style: GoogleFonts.nunito(
                            textStyle:
                                Theme.of(context).textTheme.subtitle2.copyWith(
                                      color: Colors.blueGrey.shade900,
                                      fontWeight: FontWeight.bold,
                                    ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 8.0,
                ),
                Flexible(
                  flex: 1,
                  child: Container(
                    // height: 100.0,
                    // width: 100.0,
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade100,
                            blurRadius: 4.0,
                            spreadRadius: 4.0,
                          ),
                        ]),
                    child: Column(
                      children: <Widget>[
                        Image.asset('assets/images/Fruits.png'),
                        Text(
                          'Fruits',
                          style: GoogleFonts.nunito(
                            textStyle:
                                Theme.of(context).textTheme.subtitle2.copyWith(
                                      color: Colors.blueGrey.shade900,
                                      fontWeight: FontWeight.bold,
                                    ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 8.0,
                ),
                Flexible(
                  flex: 1,
                  child: Container(
                    // height: 100.0,
                    // width: 100.0,
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade100,
                            blurRadius: 4.0,
                            spreadRadius: 4.0,
                          ),
                        ]),
                    child: Column(
                      children: <Widget>[
                        Image.asset('assets/images/Fruits.png'),
                        Text(
                          'Flowers',
                          style: GoogleFonts.nunito(
                            textStyle:
                                Theme.of(context).textTheme.subtitle2.copyWith(
                                      color: Colors.blueGrey.shade900,
                                      fontWeight: FontWeight.bold,
                                    ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
