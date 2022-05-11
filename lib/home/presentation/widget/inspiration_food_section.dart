import 'package:flutter/material.dart';

class InspirationFoodSection extends StatelessWidget {
  const InspirationFoodSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Column(
            children: [
              Container(
                height: 150,
                width: MediaQuery.of(context).size.width / 2,
                child: Card(
                  color: Colors.amber,
                  child: Center(child: Text('image')),
                ),
              ),
              Container(
                height: 150,
                width: MediaQuery.of(context).size.width / 2,
                child: Card(
                  color: Colors.redAccent,
                  child: Center(child: Text('image')),
                ),
              )
            ],
          ),
          Container(
            height: 300,
            width: MediaQuery.of(context).size.width / 2,
            child: Card(
              color: Colors.blue,
              child: Center(child: Text('image')),
            ),
          )
        ],
      ),
    );
  }
}
