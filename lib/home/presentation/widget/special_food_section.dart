import 'package:flutter/material.dart';
import 'package:test_kulina/home/presentation/bloc/home_cubit.dart';

class SpecialFoodSection extends StatelessWidget {
  final HomeCubit homeCubit;
  const SpecialFoodSection({Key? key, required this.homeCubit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      height: MediaQuery.of(context).size.height / 3,
      child: GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: homeCubit.dataBannerSpecial.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: Center(
                  child: Image.network(homeCubit.dataBannerSpecial[index].media,
                      fit: BoxFit.cover, width: 1000.0)),
            );
          }),
    );
  }
}
