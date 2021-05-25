import 'package:flutter/material.dart';
import 'package:flutter_netflix_app/screen/home_screen.dart';
import 'package:flutter_netflix_app/screen/profile_screen.dart';
import 'package:flutter_netflix_app/widget/footer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TabController controller;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Netflix',
        theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.black,
          accentColor: Colors.white,
        ),
        home: DefaultTabController(
            length: 4,
            child: Scaffold(
              body: TabBarView(
                physics: NeverScrollableScrollPhysics(),
                children: <Widget>[
                  HomeScreen(),
                  Container(
                    child: Center(
                      child: Text('검색'),
                    ),
                  ),
                  Container(
                    child: Center(
                      child: Text('저장한 컨텐츠'),
                    ),
                  ),
                  ProfileScreen(),
                ],
              ),
              bottomNavigationBar: Footer(),
            )));
  }
}
