// Flutter code sample for AppBar

// This sample shows an [AppBar] with two simple actions. The first action
// opens a [SnackBar], while the second action navigates to a new page.

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() => runApp(MyApp());

/// This Widget is the main application widget.
class MyApp extends StatelessWidget {
  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: MyStatelessWidget(),
    );
  }
}

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
final SnackBar snackBar = const SnackBar(content: Text('Showing Snackbar'));

final List<String> imgList = [
  'https://sun1-21.userapi.com/cPaSLP4xKybNNqwy2Elbni61NXeBj3dfH6131g/8LkcYHEPUik.jpg',
  'https://sun1-93.userapi.com/SZJOT-nxlvP6Vp27AaCdActkAewg4b2LBYa8pQ/yyaSDiigwLA.jpg',
  'https://sun1-92.userapi.com/dq61SwP0HHNtBIrpaX0eUkKc8CPBAWcbAwrLkg/CcLJWv7mxmA.jpg',
  'https://sun9-73.userapi.com/c206828/v206828309/169781/iiiafsESCDQ.jpg',
  'https://sun1-95.userapi.com/yecCstOP5OEz6VVnJju41mAruSioked1oAn1ag/XqZzLZ-mwNA.jpg',
  'https://sun1-96.userapi.com/THf4V-POziALd8H6KZnAu6PLYE32sLsbqJVOgw/3qYJHHFPyEg.jpg',
  'https://sun1-93.userapi.com/4v_2k-cIDrTVGeXaJ9LhcnR7lVW3kxNPvAzXcw/0sYz5_SclXM.jpg'
  ];

void openPage(BuildContext context) {
  Navigator.push(context, MaterialPageRoute(
    builder: (BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Next page'),
        ),
        body: Center(
        child: Container(
            margin: EdgeInsets.all(5.0),
          child: CarouselSlider(
            options: CarouselOptions(
              aspectRatio: 1.0,
              enlargeCenterPage: true,
              enableInfiniteScroll: false,
            ),
            items: imgList.map((item) => Container(
              child: Center(
                  child: Image.network(item, fit: BoxFit.cover, width: 1000)
              ),
            )).toList(),
          )
        ),
        ),
      );
    },
  ));
}

/// This is the stateless widget that the main application instantiates.
class MyStatelessWidget extends StatelessWidget {
  MyStatelessWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text('Demo'),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {Scaffold.of(context).openDrawer(); },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add_alert),
            tooltip: 'Show Snackbar',
            onPressed: () {
              scaffoldKey.currentState.showSnackBar(snackBar);
            },
          ),
          IconButton(
            icon: const Icon(Icons.navigate_next),
            tooltip: 'Next page',
            onPressed: () {
              openPage(context);
            },
          ),
        ],
      ),
      body: const Center(
        child: Text(
          'This is the home page',
          style: TextStyle(fontSize: 24),
        ),
      ),
      drawer: Drawer(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('This is the Drawer'),
              RaisedButton(
                onPressed: () {Navigator.of(context).pop();},
                child: const Text('Close Drawer'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
