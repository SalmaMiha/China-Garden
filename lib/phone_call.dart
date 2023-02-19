import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:url_launcher/url_launcher.dart';

class Phone_Call extends StatefulWidget {
  const Phone_Call({Key? key}) : super(key: key);

  @override
  _Phone_CallState createState() => _Phone_CallState();
}

class _Phone_CallState extends State<Phone_Call> {
  final number1 = '01793594055';
  final number2 = '01937153621';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFF4500),
        title: Text(
          "Help Center",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.all(5.0),
          child: IconButton(
            color: Colors.white,
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.arrow_back),
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50, left: 10, right: 10),
            child: Material(
              color: Colors.black38,
              elevation: 10,
              borderRadius: BorderRadius.circular(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 80,
                    child: Center(
                      child: Text(
                        '    Help_Center1',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 180,
                  ),
                  IconButton(
                    color: Colors.green.shade400,
                    onPressed: () async {
                      launch('tel://$number1');
                      await FlutterPhoneDirectCaller.callNumber(number1);
                    },
                    icon: Icon(Icons.call),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 60,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Material(
              elevation: 10,
              color: Colors.black38,
              borderRadius: BorderRadius.circular(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 80,
                    child: Center(
                      child: Text(
                        '    Help_Center2',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 180,
                  ),
                  IconButton(
                    color: Colors.green.shade400,
                    onPressed: () async {
                      launch('tel://$number2');
                      await FlutterPhoneDirectCaller.callNumber(number2);
                    },
                    icon: Icon(Icons.call),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
