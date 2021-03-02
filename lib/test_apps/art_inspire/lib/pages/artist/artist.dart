import 'package:art_inspire/pages/artist/artist_ui/tab_bar/artist_tab_bar.dart';
import 'package:flutter/material.dart';

class Artist extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue,
        body: Stack(alignment: AlignmentDirectional.bottomCenter, children: [
          CustomScrollView(
            slivers: [
              SliverAppBar(
                expandedHeight: 200,
                backgroundColor: Colors.blue,
              ),
              SliverList(
                  delegate: SliverChildListDelegate([
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.only(topLeft: Radius.circular(30))),
                  child: Column(children: [
                    SizedBox(
                      height: 50,
                    ),
                    Container(
                      color: Colors.red,
                      height: 700,
                    )
                  ]),
                )
              ])),
              SliverFillRemaining(
                hasScrollBody: false,
                fillOverscroll: true,
                child: Container(color: Colors.white),
              )
            ],
          ),
          ArtistTabBar()
        ]));
  }
}
