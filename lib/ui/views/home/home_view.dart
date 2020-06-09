import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tathastu/ui/views/widgets/carousel_slider_widget_view.dart';
import 'package:tathastu/ui/views/widgets/categories_widget_view.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          key: _scaffoldKey,
          appBar: AppBar(
            title: Text(
              'Tathastu',
              textAlign: TextAlign.center,
              style: GoogleFonts.nunito(
                textStyle: Theme.of(context).textTheme.headline5.copyWith(
                    color: Colors.blueGrey.shade900,
                    fontWeight: FontWeight.bold),
              ),
            ),
            centerTitle: true,
            automaticallyImplyLeading: false,
            backgroundColor: Colors.grey.shade50,
            elevation: 0.0,
          ),
          backgroundColor: Colors.grey.shade50,
          body: ListView(
            children: <Widget>[
              CarouselSliderWidget(),
              // SizedBox(height: 8.0,),
              // RepairServiceCardWidget(),
              // Divider(),

              // CategoriesCardWidget(),
              SizedBox(
                height: 16.0,
              ),
              CategoriesWidetView(),
              // InkWell(
              //   onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => ContactListPage(),
              //   ),
              // );
              //   },
              //   child: EmergencyServicesCardWidget(),
              // ),
            ],
          )),
    );
  }
}
