//Packages
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CarouselSliderWidget extends StatelessWidget {
  final String imageUrl;
  final List videoGames;

  const CarouselSliderWidget({Key key, this.imageUrl, this.videoGames}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: CarouselSlider(
          options: CarouselOptions(enlargeCenterPage: false, aspectRatio: 2.5, autoPlay: false, reverse: false),
          items: [
            ClipRRect(
                child: Image.network(
              this.videoGames[0]['background_image'],
              fit: BoxFit.cover,
            )),
            ClipRRect(
                child: Image.network(
              this.videoGames[1]['background_image'],
              fit: BoxFit.cover,
            )),
            ClipRRect(
                child: Image.network(
              this.videoGames[2]['background_image'],
              fit: BoxFit.cover,
            )),
          ],
        ),
      ),
    );
  }
}
