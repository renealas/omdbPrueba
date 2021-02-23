import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Variable del Año para Footer en apps.
    var now = new DateTime.now();
    var formatter = new DateFormat('yyyy');
    String formattedDate = formatter.format(now);
    //--------------
    //Esto es para poner el footer en las apps.
    return Container(
      color: Colors.white,
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RaisedButton(
            onPressed: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Icon(Icons.home),
              ],
            ),
          ),
          SizedBox(
            width: 10,
          ),
          RaisedButton(
            onPressed: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Icon(Icons.search),
              ],
            ),
          ),
          SizedBox(
            width: 10,
          ),
          RaisedButton(
            onPressed: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Icon(Icons.notifications),
              ],
            ),
          ),
          SizedBox(
            width: 10,
          ),
          RaisedButton(
            onPressed: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Icon(Icons.person),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
