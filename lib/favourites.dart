import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'detail.dart';

class Favourite extends StatefulWidget {
  const Favourite({Key? key}) : super(key: key);

  @override
  _FavouriteState createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {

  double total = 0;

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFF4500),
        title: Text(
          "Favourites",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 8,
            child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("users-favourite-items")
                  .doc(FirebaseAuth.instance.currentUser!.email)
                  .collection("items")
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text("Something is wrong"),
                  );
                }
                return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (_, index) {
                      DocumentSnapshot _documentSnapshot =
                      snapshot.data!.docs[index];

                      return GestureDetector(
                        child: Card(
                          elevation: 3,
                          child: ListTile(
                            leading: Image.network(
                              _documentSnapshot["image"],
                            ),
                            title: Center(
                                child: Text(
                                  _documentSnapshot["name"],
                                  style: TextStyle(fontSize: 22),
                                )),
                            subtitle: Center(
                              child: Text(
                                "BDT  ${_documentSnapshot["price"]}",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey,
                                    fontSize: 18),
                              ),
                            ),
                            trailing: GestureDetector(
                              child: Icon(
                                Icons.remove_circle,
                                color: Colors.black,
                              ),
                              onTap: () {
                                FirebaseFirestore.instance
                                    .collection("users-favourite-items")
                                    .doc(FirebaseAuth
                                    .instance.currentUser!.email)
                                    .collection("items")
                                    .doc(_documentSnapshot.id)
                                    .delete();
                              },
                            ),
                          ),
                        ),
                        onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (_)=>ProductDetails(_documentSnapshot)))
                      );
                    });
              },
            ),
          ),
          SizedBox(height: 15,)
        ],
      ),);
  }
}
