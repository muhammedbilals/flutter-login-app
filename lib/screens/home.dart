import 'package:flutter/material.dart';
import 'package:flutter_login/screens/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScreenHome extends StatelessWidget {
  ScreenHome({super.key});

  List<String> product = [
    "I Phone 14 Pro",
    "I phone 13 PRO",
    "samsung S22 Ultra",
    "acernitro 5",
    "realme 9pro plus",
    "Google Pixel 7 Pro",
    "xiomi 11 pro",
    "I Phone 14 Pro",
    "I phone 13 PRO",
    "samsung S22 Ultra",
    "acernitro 5",
    "realme 9pro plus",
    "Google Pixel 7 Pro",
    "xiomi 11 pro",
    "I Phone 14 Pro",
    "I phone 13 PRO",
    "samsung S22 Ultra",
    "acernitro 5",
    "realme 9pro plus",
    "Google Pixel 7 Pro",
    "xiomi 11 pro",
    "I Phone 14 Pro",
    "I phone 13 PRO",
    "samsung S22 Ultra",
    "acernitro 5",
    "realme 9pro plus",
    "Google Pixel 7 Pro",
    "xiomi 11 pro",
  ];

  List<String> productdis = [
    "Pro. Beyond. Buy now. Meet the new face of iPhone. Dynamic Island",
    "Pro. Beyond. Buy now. Meet the new face of iPhone. Dynamic Island",
    "Pro. Beyond. Buy now. Meet the new face of iPhone. Dynamic Island",
    "Pro. Beyond. Buy now. Meet the new face of iPhone. Dynamic Island",
    "Pro. Beyond. Buy now. Meet the new face of iPhone. Dynamic Island",
    "Pro. Beyond. Buy now. Meet the new face of iPhone. Dynamic Island",
    "Pro. Beyond. Buy now. Meet the new face of iPhone. Dynamic Island",
    "Pro. Beyond. Buy now. Meet the new face of iPhone. Dynamic Island",
    "Pro. Beyond. Buy now. Meet the new face of iPhone. Dynamic Island",
    "Pro. Beyond. Buy now. Meet the new face of iPhone. Dynamic Island",
    "Pro. Beyond. Buy now. Meet the new face of iPhone. Dynamic Island",
    "Pro. Beyond. Buy now. Meet the new face of iPhone. Dynamic Island",
    "Pro. Beyond. Buy now. Meet the new face of iPhone. Dynamic Island",
    "Pro. Beyond. Buy now. Meet the new face of iPhone. Dynamic Island",
    "Pro. Beyond. Buy now. Meet the new face of iPhone. Dynamic Island",
    "Pro. Beyond. Buy now. Meet the new face of iPhone. Dynamic Island",
    "Pro. Beyond. Buy now. Meet the new face of iPhone. Dynamic Island",
    "Pro. Beyond. Buy now. Meet the new face of iPhone. Dynamic Island",
    "Pro. Beyond. Buy now. Meet the new face of iPhone. Dynamic Island",
    "Pro. Beyond. Buy now. Meet the new face of iPhone. Dynamic Island",
    "Pro. Beyond. Buy now. Meet the new face of iPhone. Dynamic Island",
    "Pro. Beyond. Buy now. Meet the new face of iPhone. Dynamic Island",
    "Pro. Beyond. Buy now. Meet the new face of iPhone. Dynamic Island",
    "Pro. Beyond. Buy now. Meet the new face of iPhone. Dynamic Island",
    "Pro. Beyond. Buy now. Meet the new face of iPhone. Dynamic Island",
    "Pro. Beyond. Buy now. Meet the new face of iPhone. Dynamic Island",
    "Pro. Beyond. Buy now. Meet the new face of iPhone. Dynamic Island",
    "Pro. Beyond. Buy now. Meet the new face of iPhone. Dynamic Island",
  ];

  List<String> productprice =['1000','2000','7000','8500','7400','4800','9600','1000','2000','7000','8500','7400','4800','9600','1000','2000','7000','8500','7400','4800','9600','1000','2000','7000','8500','7400','4800','9600'];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          IconButton(
              onPressed: () {
                signout(context);
              },
              icon: Icon(Icons.exit_to_app))
        ],
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: product.length,
          itemBuilder: ((context, index) {
            return ListTile(
              leading: pic(index),
              // leading: CircleAvatar(
              //   child: Text(product[index][0]),
              // ),
              title: Text(product[index]),
              subtitle: Text(
                productdis[index]),
              trailing: Text(productprice[index]),
            );
          }),
        ),
      ),
    );
  }

  signout(BuildContext ctx) async {
    final _sharedprefs = await SharedPreferences.getInstance();
    await _sharedprefs.clear();

    Navigator.of(ctx).pushAndRemoveUntil(
        MaterialPageRoute(builder: (ctx1) => ScreenLogin()), (route) => false);
  }
}

Widget pic(int index) {


  List<String> productimages = [
    'assets/images/iphone13.jpg',
    'assets/images/iphone13pro.jpg',
    'assets/images/macbookpro.jpeg',
    'assets/images/acernitro5.jpg',
    'assets/images/realme-9pro-plus-5g.jpg',
    'assets/images/Google-Pixel-7-Pro.jpg',
    'assets/images/xiomi 11 pro.jpg',
    'assets/images/iphone13.jpg',
    'assets/images/iphone13pro.jpg',
    'assets/images/macbookpro.jpeg',
    'assets/images/acernitro5.jpg',
    'assets/images/realme-9pro-plus-5g.jpg',
    'assets/images/Google-Pixel-7-Pro.jpg',
    'assets/images/xiomi 11 pro.jpg',
    'assets/images/iphone13.jpg',
    'assets/images/iphone13pro.jpg',
    'assets/images/macbookpro.jpeg',
    'assets/images/acernitro5.jpg',
    'assets/images/realme-9pro-plus-5g.jpg',
    'assets/images/Google-Pixel-7-Pro.jpg',
    'assets/images/xiomi 11 pro.jpg',
    'assets/images/iphone13.jpg',
    'assets/images/iphone13pro.jpg',
    'assets/images/macbookpro.jpeg',
    'assets/images/acernitro5.jpg',
    'assets/images/realme-9pro-plus-5g.jpg',
    'assets/images/Google-Pixel-7-Pro.jpg',
    'assets/images/xiomi 11 pro.jpg',
    ];


  if (index % 2 == 0) {
    return CircleAvatar(
      backgroundImage:AssetImage(productimages[index]),
      radius: 30,
      child: Text(''),
    );
  } else
    return new Container(
        width: 60,
        height: 65,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(productimages[index]),
            // fit: BoxFit.fitHeight,
          ),
        ));
}
