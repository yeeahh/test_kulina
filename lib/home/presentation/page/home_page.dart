import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_kulina/home/presentation/bloc/home_cubit.dart';
import 'package:test_kulina/home/presentation/bloc/home_state.dart';
import 'package:test_kulina/home/presentation/widget/carousel_section.dart';
import 'package:test_kulina/home/presentation/widget/inspiration_food_section.dart';
import 'package:test_kulina/home/presentation/widget/search_bar_section.dart';
import 'package:test_kulina/home/presentation/widget/special_food_section.dart';
import 'package:test_kulina/locator.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final HomeCubit _homeCubit;

  @override
  void initState() {
    _homeCubit = locator<HomeCubit>();
    _homeCubit.getBannerData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: _homeCubit,
      listener: (context, state) {},
      child: Scaffold(
        body: Container(
          color: Colors.white,
          child: SingleChildScrollView(
            child: BlocBuilder(
                bloc: _homeCubit,
                builder: (context, snapshot) {
                  if (snapshot is HomeSuccess) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SearchBarSection(),
                        CarouselSection(
                          homeCubit: _homeCubit,
                        ),
                        Container(
                            padding: EdgeInsets.all(15),
                            child: Text(
                              "Special di Food.id",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            )),
                        SpecialFoodSection(
                          homeCubit: _homeCubit,
                        ),
                        Container(
                            padding: EdgeInsets.all(15),
                            child: Text("Cari Inspirasi belanja",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20))),
                        InspirationFoodSection()
                      ],
                    );
                  }
                  return Center(child: CircularProgressIndicator());
                }),
          ),
        ),
      ),
    );
  }
}
