import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'checkout.dart';
import 'detail.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  double total = 0;

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFF4500),
        title: Text(
          "Cart",
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
        // actions: [
        //   IconButton(icon: Icon(Icons.done,color: Colors.black,),
        //     onPressed: (){
        //       Navigator.push(
        //           context, MaterialPageRoute(builder: (context) => const CheckOut()));
        //     },
        //   )
        // ],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 8,
            child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("users-cart-items")
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

                      return Card(
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
                                  .collection("users-cart-items")
                                  .doc(FirebaseAuth
                                  .instance.currentUser!.email)
                                  .collection("items")
                                  .doc(_documentSnapshot.id)
                                  .delete();
                              FirebaseFirestore.instance
                                  .collection("users-order")
                                  .doc(FirebaseAuth
                                  .instance.currentUser!.email)
                                  .collection("items")
                                  .doc(_documentSnapshot.id)
                                  .delete();
                            },
                          ),
                        ),
                      );
                    });
              },
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Container(
                width: 270,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Total Price - BDT ',
                      style: TextStyle(
                        fontSize: 22,
                      ),
                    ),
                    Container(
                      child: StreamBuilder(
                        stream: FirebaseFirestore.instance
                            .collection("users-cart-items")
                            .doc(FirebaseAuth.instance.currentUser!.email)
                            .collection("items")
                            .snapshots(),
                        builder:(BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                          if(snapshot.connectionState == ConnectionState.waiting) {
                            return CircularProgressIndicator();
                          } else {
                            total = 0;
                            snapshot.data!.docs.forEach((result) {
                              total += result["price"];
                            });
                            return Text(total.toString(),
                              style: TextStyle(
                                fontSize: 23,
                                fontWeight: FontWeight.bold,
                              ),);
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            width: 180,
            child: RawMaterialButton(
              fillColor: Color(0xFFFF4500),
              elevation: 5.0,
              padding: EdgeInsets.symmetric(vertical: 12.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0)
              ),
              onPressed: () {
                if(total!=0)
                  {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const CheckOut()));
                  }
                else{
                  showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: const Text('Oops! No Item in Cart'),
                      content: const Text('Add Items to Proceed'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () => Navigator.pop(context, 'OK'),
                          child: const Text('OK',
                          style: TextStyle(
                            color: Color(0xFFFF4500)
                          )),
                        ),
                      ],
                    ),
                  );
                }

                },
              child: Text("Checkout",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(height: 15,)
        ],
      ),);
  }

}
