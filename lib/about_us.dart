import 'package:flutter/material.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Us'),
        centerTitle: true,
        backgroundColor: Color(0xFFFF4500),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20,),
            Container(
              height: 300,
              width: 300,
              child: Image(
                image: AssetImage('image/logo.jpg'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 20),
              child: Text(
                'Here at the China Garden Restaurant '
                'we welcome you and invite you to experience a taste at the orient.'
                ' We offer you the opportunity to relax in authentic surroundings '
                'where our team of staff are happy to present to you a delectable '
                'feast of the finest cuisine made from recipes collected from around '
                'the major provinces of China and brought to you under one roof. '
                'Whether it be an old favourite or a new taste experience, we '
                'invite you to choose from our extensive menu. Cooked by our '
                'selection of the finest chefs, using only the finest ingredients '
                'you can be guaranteed a veritable feast, delicious to eat and '
                'pleasing to the eye. Be it an intimate evening for two or a larger '
                'party, we can cater to your every need.',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
