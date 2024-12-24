import 'package:ecommerce/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class signOut extends StatefulWidget {
  const signOut({Key? key}) : super(key: key);

  @override
  State<signOut> createState() => _signOutState();
}

class _signOutState extends State<signOut> {
  late User? _user;

  @override
  void initState() {
    super.initState();
    _getUser();
  }

  Future<void> _getUser() async {
    User? user = FirebaseAuth.instance.currentUser;
    setState(() {
      _user = user;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.deepPurple.shade100,
      body: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30),
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_user != null)
              Text(
                'Current User: ${_user!.email}',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.black
                ),
              ),
            SizedBox(height: 30),
            Center(
              child: TextButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => loginPage()),
                  );
                },
                child: Text(
                  'Sign Out',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Colors.black54,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
