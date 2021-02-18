import 'package:flutter/material.dart';

class ArtistView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Padding(
            padding: const EdgeInsets.only(left: 70),
            child: Text(
              'New artists',
              style: TextStyle(
                  fontFamily: 'Gilroy',
                  fontWeight: FontWeight.w900,
                  fontSize: 26),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: GestureDetector(
              onTap: () {},
              child: Text(
                'view all',
                style: TextStyle(
                    color: Colors.black12,
                    fontFamily: 'Gilroy',
                    fontWeight: FontWeight.w600,
                    fontSize: 16),
              ),
            ),
          ),
        ]),
        SizedBox(
          height: 20,
        ),
        Container(
          height: 200,
          child: ListView.builder(
              padding: const EdgeInsets.only(left: 50),
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, position) {
                return ArtistViewCell();
              }),
        ),
        SizedBox(height: 100)
      ],
    );
  }
}

class ArtistViewCell extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 25),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.orange,
      ),
      width: 135,
    );
  }
}
