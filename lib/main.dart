import 'package:first_app/pages/about.dart';
import 'package:first_app/pages/sign-in.dart';
import 'package:first_app/widgets/feed-list.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

/// This Widget is the main application widget.
class MyApp extends StatelessWidget {
  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      theme: ThemeData(primaryColor: Colors.white),
      home: MyStatelessWidget(),
      routes: <String, WidgetBuilder>{
        'about': (BuildContext context) => AboutPage(),
        'sign-in': (BuildContext context) => SignInPage(),
        'feed': (BuildContext context) => FeedList()
      },
    );
  }
}

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

/// This is the stateless widget that the main application instantiates.
class MyStatelessWidget extends StatelessWidget {
  MyStatelessWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Главная'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add_alert),
            tooltip: 'Show Snackbar',
            onPressed: () {},
          ),
          Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openEndDrawer();
                },
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              );
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
      endDrawer: Drawer(
          child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text('ABOBA HEADER'),
            decoration: BoxDecoration(color: Colors.lightBlueAccent),
          ),
          ListTile(
            title: Text('Главная'),
            onTap: () {
              Navigator.pushNamed(context, 'feed');
            },
          ),
          ListTile(
            title: Text('О проекте'),
            onTap: () {
              Navigator.pushNamed(context, 'about');
            },
          ),
          ListTile(
              title: Text('Войти'),
              onTap: () {
                Navigator.pushNamed(context, 'sign-in');
              }),
        ],
      )),
    );
  }
}
