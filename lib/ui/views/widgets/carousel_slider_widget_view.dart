import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselSliderWidget extends StatefulWidget {
  @override
  _CarouselSliderWidgetState createState() => _CarouselSliderWidgetState();
}

class _CarouselSliderWidgetState extends State<CarouselSliderWidget> {
  List<String> sliderImages = [
    'https://media.istockphoto.com/photos/healthy-food-background-healthy-food-in-paper-bag-fruits-and-on-picture-id937808604?k=6&m=937808604&s=612x612&w=0&h=7mtlU1re2N71h6tZi7wFn3-OmJG5bIPwOY8yw8BIZPo=',
    'https://img.freepik.com/free-photo/ingredients-healthy-foods-selection_35641-2931.jpg?size=626&ext=jpg',
    'https://www.readersdigest.ca/wp-content/uploads/sites/14/2017/08/pick-best-fruit-vegetable.gif'
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      height: 216.0,
      items: sliderImages.map((image) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
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
              child: ClipRRect(
                borderRadius: new BorderRadius.circular(8.0),
                child: Image.network(
                  image,
                  fit: BoxFit.fill,
                  scale: 1.1,
                ),
              ),
            );
          },
        );
      }).toList(),
      // aspectRatio: 16 / 9,
      viewportFraction: 0.99,
      initialPage: 0,
      enableInfiniteScroll: true,
      reverse: false,
      autoPlay: true,
      autoPlayInterval: Duration(seconds: 3),
      autoPlayAnimationDuration: Duration(milliseconds: 800),
      autoPlayCurve: Curves.fastOutSlowIn,
      pauseAutoPlayOnTouch: Duration(seconds: 10),
      enlargeCenterPage: true,
      onPageChanged: null,
      scrollDirection: Axis.horizontal,
      scrollPhysics: NeverScrollableScrollPhysics(),
    );
  }
}
