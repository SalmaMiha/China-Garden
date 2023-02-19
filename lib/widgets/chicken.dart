import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:china_garden/detail.dart';


class Chicken extends StatefulWidget {
  const Chicken({Key? key}) : super(key: key);

  @override
  _ChickenState createState() => _ChickenState();
}

class _ChickenState extends State<Chicken> {

  List _products = [];

  fetchProducts() async{
    var _firestoreInstance = FirebaseFirestore.instance;
    QuerySnapshot qn =
    await _firestoreInstance.collection("Chicken").get();
    setState(() {
      for(int i = 0; i<qn.docs.length; i++) {
        _products.add(
            {
              "name": qn.docs[i]["name"],
              "price": qn.docs[i]["price"],
              "image": qn.docs[i]["image"],
              //"details": qn.docs[i]["details"]
            }
        );
      }
    });
  }

  @override
  void initState() {
    fetchProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Container(
                child: Text(
                  'Chicken',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 5,),
            Expanded(
              child: GridView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _products.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1,childAspectRatio: 1),
                  itemBuilder: (_,index){
                    return GestureDetector(
                      onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (_)=>ProductDetails(_products[index]))),
                      child: Card(
                        elevation: 5,
                        child: Column(
                          children: [
                            AspectRatio(aspectRatio: 1.5,child: Image.network(_products[index]["image"])),
                            Text("${_products[index]["name"]}",style: TextStyle(fontSize: 18),),
                            Text("BDT ${_products[index]["price"].toString()}"),
                          ],
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}