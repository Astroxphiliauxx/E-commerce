import 'package:ecommerce/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class splashScreen extends StatefulWidget {
  const splashScreen({super.key});

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {

  changeScreen(){
    Future.delayed(Duration(seconds: 3),(){
      Get.to(()=>loginPage());

    });
  }
  @override
  void initState() {
    changeScreen();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(

              height: 700,
              width: 700,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(60)
              ),
              
              child: Image.asset("images/shop logo.jpg",
                               
              ),
              
            ),
           Text("Version 1.0.0",
           style: TextStyle(
             color: Colors.black,
             fontSize: 24,
             fontWeight: FontWeight.bold,
           ),)
          ],
        ),
      ),

    );
  }
}
