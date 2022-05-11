import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_kulina/home/presentation/bloc/home_cubit.dart';
import 'package:test_kulina/home/presentation/widget/carousel_section.dart';
import 'package:test_kulina/home/presentation/widget/inspiration_food_section.dart';
import 'package:test_kulina/home/presentation/widget/search_bar_section.dart';
import 'package:test_kulina/home/presentation/widget/special_food_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeCubit _homeCubit = HomeCubit();

  @override
  void initState() {
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
                  return Column(
                    children: [
                      SearchBarSection(),
                      CarouselSection(
                        homeCubit: _homeCubit,
                      ),
                      Text("Special di Food.id"),
                      SpecialFoodSection(
                        homeCubit: _homeCubit,
                      ),
                      Text("Cari Inspirasi belanja"),
                      InspirationFoodSection()
                    ],
                  );
                }),
          ),
        ),
      ),
    );
  }
}
