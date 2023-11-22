import 'package:ecommerce/screens/auth.dart';
import 'package:ecommerce/screens/hidden_drawer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:lottie/lottie.dart';
import 'login.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  final FirebaseAuthService _auth = FirebaseAuthService();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  @override

  void dispose(){
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.deepPurple.shade100,
      body:
      Center(
        child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 200,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        height: 200,
                        width: 300,
                        child: Padding(
                          padding: EdgeInsets.only(left: 100),
                          child: Lottie.asset("images/anima1.json"),
                        ),
                      ),

                    ],
                  ),
                ),

                Animate(
                  effects:
                  [FadeEffect(delay:800.ms),SlideEffect(duration: 1000.ms)],
                  child: Text("Welcome to the SignUp Page !",
                      style: TextStyle(fontSize: 20,
                      )
                  ) ,
                ),

                SizedBox(height: 80),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Form(

                    child: TextFormField(decoration: InputDecoration(
                      hintText: 'Gmail',
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Colors.grey),
                      ),
                      fillColor: Colors.white70,
                      filled: true,
                    ),
                      autocorrect: false,
                      textCapitalization: TextCapitalization.none,
                      keyboardType: TextInputType.emailAddress,
                      controller: _emailController,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty || !value.contains("@gmail.com")){
                          return 'Please enter a valid Gmail address';
                        }
                        return null;
                      },

                    ),
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextFormField(decoration: InputDecoration(
                    hintText: 'Password',

                    enabledBorder: OutlineInputBorder(
                      borderSide:
                      BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                      BorderSide(color: Colors.grey),
                    ),
                    fillColor: Colors.white70,
                    filled: true,
                  ),
                    obscureText: true,
                    controller: _passwordController,
                    validator: (value) {
                      if (value == null || value.length <6){
                        return 'Password should contain least 7 letters';
                      }
                      return null;
                    },


                  ),
                ),
                SizedBox(height: 40),
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Center(
                    child: TextButton(
                      child: Text( "Sign Up ",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                      onPressed: (){
                          _SignUp();
                      },
                      style: TextButton.styleFrom(
                        fixedSize: Size(450,  50),
                        backgroundColor: Colors.black54,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Center(
                    child: TextButton(
                      child: Text( "Already had an account" ,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                        // Within the `FirstRoute` widget
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => loginPage()),
                          );
                        }

                    ),
                  ),
                ),
              ],
            )
        ),
      ),
      // ),
    );
  }
  void _SignUp() async{
    showDialog(
        context: context,
        builder: (context){
      return Center(child: CircularProgressIndicator());
    });
    String email = _emailController.text;
    String password = _passwordController.text;
    Navigator.of(context).pop();

    User? user = await _auth.signUpWithEmailAndPassword(email, password);
    if (user != null){
      print('user is successfully created');
      Navigator.push(context, MaterialPageRoute(builder: (context) => HiddenDrawer()));
    }
    else {
      print('some error happened');
    }
  }
}


