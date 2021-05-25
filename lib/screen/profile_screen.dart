import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 50),
              child: CircleAvatar(
                radius: 100,
                backgroundImage: AssetImage('images/logo.png'),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Text('ghdl023',
                  style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
            ),
            Container(
              width: 120,
              height: 5,
              color: Colors.red,
            ),
            Container(
                padding: EdgeInsets.only(top: 10),
                child: Linkify(
                  onOpen: (link) async {
                    if (await canLaunch(link.url)) {
                      await launch(link.url);
                    }
                  },
                  text: 'https://github.com/ghdl023',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  linkStyle: TextStyle(color: Colors.white),
                )),
            Container(
              padding: EdgeInsets.all(20),
              child: FlatButton(
                onPressed: () {},
                child: Container(
                  color: Colors.red,
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.edit,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text('프로필 수정하기', style: TextStyle(color: Colors.white))
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
