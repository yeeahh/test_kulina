import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:test_kulina/home/presentation/bloc/home_cubit.dart';

class CarouselSection extends StatelessWidget {
  final HomeCubit homeCubit;
  const CarouselSection({Key? key, required this.homeCubit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CarouselSlider(
        options: CarouselOptions(
          autoPlay: true,
          aspectRatio: 2.0,
          enlargeCenterPage: true,
        ),
        items: homeCubit.dataBannerCarousel!
            .map((item) => Container(
                  child: Container(
                    margin: EdgeInsets.all(5.0),
                    child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        child: Stack(
                          children: <Widget>[
                            Image.network(item.media,
                                fit: BoxFit.cover, width: 1000.0),
                            Positioned(
                              bottom: 0.0,
                              left: 0.0,
                              right: 0.0,
                              child: Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Color.fromARGB(200, 0, 0, 0),
                                      Color.fromARGB(0, 0, 0, 0)
                                    ],
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                  ),
                                ),
                                padding: EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 20.0),
                              ),
                            ),
                          ],
                        )),
                  ),
                ))
            .toList(),
      ),
    );
  }
}
