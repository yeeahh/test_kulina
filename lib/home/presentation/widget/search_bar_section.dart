import 'package:flutter/material.dart';

class SearchBarSection extends StatelessWidget {
  const SearchBarSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 235,
      color: Colors.green,
      padding: EdgeInsets.all(15),
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: const [
                Text(
                  "FOOD.ID",
                  style: TextStyle(color: Colors.white, fontSize: 26),
                ),
                Icon(
                  Icons.chat_outlined,
                  color: Colors.white,
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    color: Colors.white,
                  ),
                  Text(
                    "Dikirim ke ",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  DropdownButton<String>(
                    value: "Jakarta Selatan",
                    icon: Icon(
                      Icons.arrow_downward,
                      color: Colors.white,
                    ),
                    elevation: 16,
                    style: TextStyle(color: Colors.white),
                    items: <String>['Jakarta Selatan', 'Mars', 'Bumi']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
            ),
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(26.0),
                  ),
                  filled: true,
                  hintStyle: TextStyle(color: Colors.grey[800]),
                  hintText: "Mau belanja makanan apa?",
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey[800],
                  ),
                  fillColor: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
