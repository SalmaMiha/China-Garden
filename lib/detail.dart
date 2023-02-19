import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'cart.dart';

class ProductDetails extends StatefulWidget {
  var _product;

  ProductDetails(this._product);

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  Future addToCart() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    var currentUser = _auth.currentUser;
    CollectionReference _collectionRef =
    FirebaseFirestore.instance.collection("users-cart-items");
    return _collectionRef
        .doc(currentUser!.email)
        .collection("items")
        .doc()
        .set({
      "image": widget._product["image"],
      "name": widget._product["name"],
      "price": widget._product["price"],
    }).then((value) => print("Added to cart"));
  }

  Future addToFavourite() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    var currentUser = _auth.currentUser;
    CollectionReference _collectionRef =
    FirebaseFirestore.instance.collection("users-favourite-items");
    return _collectionRef
        .doc(currentUser!.email)
        .collection("items")
        .doc()
        .set({
      "image": widget._product["image"],
      "name": widget._product["name"],
      "price": widget._product["price"],
      "details": widget._product["details"],
    }).then((value) => print("Added to favourite"));
  }

  Future adminView() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    var currentUser = _auth.currentUser;
    CollectionReference _collectionRef =
    FirebaseFirestore.instance.collection("users-order");
    return _collectionRef
        .doc(currentUser!.email)
        .collection("items")
        .doc()
        .set({
      "image": widget._product["image"],
      "name": widget._product["name"],
      "price": widget._product["price"],
    }).then((value) => print("Added to cart"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFF4500),
        title: Text(
          'Detail',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        leading: StreamBuilder(
          stream: FirebaseFirestore.instance.collection("users-favourite-items").doc(FirebaseAuth.instance.currentUser!.email)
              .collection("items").where("name",isEqualTo: widget._product['name']).snapshots(),
          builder: (BuildContext context, AsyncSnapshot snapshot){
            if(snapshot.data==null){
              return Text("");
            }
            return Padding(
              padding: const EdgeInsets.only(right: 8),
              child: CircleAvatar(
                backgroundColor: Color(0xFFFF4500),
                child: IconButton(
                  onPressed: () => snapshot.data.docs.length==0?addToFavourite():print("Already Added"),
                  icon: snapshot.data.docs.length==0? Icon(
                    Icons.favorite_outline,
                    color: Colors.white,
                  ):Icon(
                    Icons.favorite,
                    color: Colors.white,
                  ),
                ),
              ),
            );
          },

        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: IconButton(
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Cart()));
              },
            ),
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 20,
                  ),
                  child: Container(
                    height: 300,
                    child: Image.network(widget._product['image']),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30,),
                  child: Text(
                    widget._product['name'],
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.grey.shade800,
                    ),
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.only(top: 20, left: 10),
                //   child: Text(
                //    "Ingredients: ${widget._product['details']}",
                //     style: TextStyle(
                //       fontSize: 20,
                //       color: Colors.grey.shade800,
                //     ),
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.only(top: 30,),
                  child: Text(
                    "BDT ${widget._product["price"].toString()}",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50,),
                  child: SizedBox(
                    width: 200,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: () {
                        addToCart();
                        adminView();
                      },
                      child: Text(
                        "Add To Cart",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFFFF4500),
                        elevation: 3,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}