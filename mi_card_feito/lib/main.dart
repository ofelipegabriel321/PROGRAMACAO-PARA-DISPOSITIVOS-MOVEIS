import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue,
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  radius: 80,
                  backgroundImage: AssetImage('images/felipe-gabriel.jpg'),
                ),
                Text(
                  'Felipe Gabriel',
                  style: TextStyle(
                      fontFamily: 'Cookie',
                      color: Colors.white,
                      fontSize: 76,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  'FLUTTER DEVELOPER',
                  style: TextStyle(
                      color: Colors.teal.shade100,
                      fontSize: 20,
                      letterSpacing: 2.5,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20.0,
                  width: 150.0,
                  child: Divider(
                    color: Colors.teal.shade100,
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      buildContactButton('phone', '+55 86 97777 7777',
                          Icons.phone, Colors.teal),
                      buildContactButton('whatsapp', '+55 86 98888 8888',
                          MdiIcons.whatsapp, Colors.green),
                      buildContactButton('instagram', 'ofelipe_gabriel',
                          MdiIcons.instagram, Colors.pink),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      buildContactButton('facebook', 'ofelipegabriel321',
                          MdiIcons.facebook, Colors.indigo),
                      buildContactButton('email', 'ofelipegabriel321@gmail.com',
                          Icons.email, Colors.purple),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.0,
                  width: 150.0,
                  child: Divider(
                    color: Colors.teal.shade100,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 30, left: 30),
                  child: Text(
                    'I am always ready to provide mobile development services in Flutter!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.teal.shade100,
                        fontSize: 20,
                        letterSpacing: 2.5,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

Padding buildContactButton(
    String contactType, String contactData, IconData icon, Color color) {
  var contactTypeToContactText = {
    'phone': 'phone contact',
    'whatsapp': 'whatsapp contact',
    'instagram': 'instagram username',
    'facebook': 'facebook username',
    'email': 'email adress',
  };
  return Padding(
      padding: EdgeInsets.all(4),
      child: RawMaterialButton(
        onPressed: () {
          Clipboard.setData(ClipboardData(text: contactData));
          Fluttertoast.showToast(
              msg:
                  "The ${contactTypeToContactText[contactType]} $contactData has been copied to the clipboard",
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              textColor: Colors.white,
              fontSize: 20.0);
        },
        fillColor: Colors.white,
        child: Icon(
          icon,
          size: 40.0,
          color: color,
        ),
        padding: EdgeInsets.all(15.0),
        shape: CircleBorder(),
      ));
}
