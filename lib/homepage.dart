import 'package:china_garden/about_us.dart';
import 'package:china_garden/food.dart';
import 'package:china_garden/widgets/appetizer.dart';
import 'package:china_garden/widgets/beef.dart';
import 'package:china_garden/widgets/beef_burger.dart';
import 'package:china_garden/widgets/chicken.dart';
import 'package:china_garden/widgets/chicken_burger.dart';
import 'package:china_garden/widgets/chowmein.dart';
import 'package:china_garden/widgets/fried_rice.dart';
import 'package:china_garden/widgets/khichuri_biriyani.dart';
import 'package:china_garden/widgets/pasta.dart';
import 'package:china_garden/widgets/pizza.dart';
import 'package:china_garden/widgets/prawn.dart';
import 'package:china_garden/widgets/salad.dart';
import 'package:china_garden/widgets/sandwich.dart';
import 'package:china_garden/widgets/set_menu.dart';
import 'package:china_garden/widgets/shawarma.dart';
import 'package:china_garden/widgets/sizzling.dart';
import 'package:china_garden/widgets/soup.dart';
import 'package:china_garden/widgets/vegetable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'phone_call.dart';
import 'search.dart';
import 'favourites.dart';
import 'bottom_bar.dart';
import 'cart.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFF4500),
        title: Text(
          'China Garden',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
            color: Colors.white,
          ),
        ),
        centerTitle: true,

        actions: [
          IconButton(
            icon: Icon(
              Icons.shopping_cart,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Cart()));
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 30,),

            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: TextFormField(
                readOnly: true,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      borderSide: BorderSide(
                        width: 2,
                        color: Colors.black,
                      )
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      borderSide: BorderSide(
                        width: 2,
                        color: Colors.black,
                      )
                  ),
                  hintText: 'Search products here',
                  hintStyle: TextStyle(fontSize: 15),
                ),
                onTap: () =>
                    Navigator.push(context,
                        CupertinoPageRoute(builder: (_) => Search_Screen())),
              ),
            ),

            Container(
              margin:
              const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
              height: 250.0,
              child: Burger(),
            ),

            Container(
              margin:
              const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
              height: 250.0,
              child: Chicken_Burger(),
            ),

            Container(
              margin:
              const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
              height: 250.0,
              child: Chicken(),
            ),

            Container(
              margin:
              const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
              height: 250.0,
              child: Chow_Mein(),
            ),

            Container(
              margin:
              const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
              height: 250.0,
              child: Fried_Rice(),
            ),

            Container(
              margin:
              const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
              height: 250.0,
              child: Khichuri_Biriyani(),
            ),

            Container(
              margin:
              const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
              height: 250.0,
              child: Pasta(),
            ),

            Container(
              margin:
              const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
              height: 250.0,
              child: Pizza(),
            ),

            Container(
              margin:
              const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
              height: 250.0,
              child: Prawn(),
            ),

            Container(
              margin:
              const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
              height: 250.0,
              child: Salad(),
            ),

            Container(
              margin:
              const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
              height: 250.0,
              child: Sandwich(),
            ),

            Container(
              margin:
              const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
              height: 250.0,
              child: Appetizer(),
            ),

            Container(
              margin:
              const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
              height: 250.0,
              child: Beef(),
            ),

            Container(
              margin:
              const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
              height: 250.0,
              child: Shawarma(),
            ),

            Container(
              margin:
              const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
              height: 250.0,
              child: Sizzling(),
            ),

            Container(
              margin:
              const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
              height: 250.0,
              child: Soup(),
            ),

            Container(
              margin:
              const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
              height: 250.0,
              child: Vegetable(),
            ),

            Container(
              margin:
              const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
              height: 250.0,
              child: Set_Menu(),
            ),



            SizedBox(height: 10,),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.black,
              ),
              child: Image(image: AssetImage('image/logo2.jpeg'),
                fit: BoxFit.fill,
              ),
            ),
            ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Help Center',
                    style: TextStyle(
                      color: Color(0xFFFF4500),
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(Icons.question_mark,
                    color: Color(0xFFFF4500),
                  )
                ],
              ),
              onTap: () {
                {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Phone_Call()));
                }
              },
            ),
            ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('About Us',
                  style: TextStyle(
                    color: Color(0xFFFF4500),
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                  ),
                  Icon(Icons.info,
                    color: Color(0xFFFF4500),
                  )
                ],
              ),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.push(context,
                  MaterialPageRoute(builder: (context)=> const AboutUs())
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}