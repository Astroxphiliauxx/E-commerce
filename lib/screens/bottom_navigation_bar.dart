

import 'package:ecommerce/screens/home_screen.dart';
import 'package:ecommerce/widgets/product_card.dart';
import 'package:flutter/material.dart';

class BottomNavigationBar1 extends StatefulWidget {
  const BottomNavigationBar1({super.key});

  @override
  State<BottomNavigationBar1> createState() => _BottomNavigationBar1State();
}

class _BottomNavigationBar1State extends State<BottomNavigationBar1> {
  int currentPageIndex = 0;
  List imgList = [
    "Warm Jacket",
    "Black T-shirt",
    "Black Pant",
    "Ladies Bag"
  ];


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          }
          );
        },
        indicatorColor: Colors.amber[800],
        selectedIndex: currentPageIndex,
        backgroundColor: Colors.deepPurple.shade300,
        elevation: 10,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),

          NavigationDestination(
            selectedIcon: Icon(Icons.shopping_cart),
            icon: Icon(Icons.shopping_cart_outlined),
            label: 'Cart',
          ),

          NavigationDestination(
            selectedIcon: Icon(Icons.favorite),
            icon: Icon(Icons.favorite_border_outlined),
            label: 'Liked',
          ),

          NavigationDestination(
            selectedIcon: Icon(Icons.person),
            icon: Icon(Icons.person_2_outlined),
            label: 'Account',
          ),
        ],
      ),
      body: <Widget>[

        HomeScreen(),
        Column(
          children: [
            Container(
              color: Colors.deepPurple.shade100,
              alignment: Alignment.center,
              child: Text('No Items In The Cart !!',
                style: TextStyle(
                  fontSize: 30,
                  fontStyle: FontStyle.italic,
                ),
              ),

            ),

            OutlinedButton(onPressed: (){}
                , child: Text('Add items',
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 24
                ),))
          ],
        ),


            Container(
              color: Colors.deepPurple.shade100,
              child: SizedBox(
                height: 1000,
                child: Column(
                  children: [
                    Center(
                      child: GridView.builder(

                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                               crossAxisCount: 2,

                               childAspectRatio: (MediaQuery.of(context).size.width - 30 -15)/(2*300),
                               mainAxisSpacing: 20,
                               crossAxisSpacing: 15,
                             ),
                          itemCount: imgList.length,
                          itemBuilder: (_,i) {
                             
                            return productCard(imgList[i]);
                          }
                      ),
                    ),
                  ],
                ),
              ),
            ),




        Container(
          color: Colors.deepPurple.shade100,
          alignment: Alignment.center,
          child: const Text('Page 4'),
        ),
      ][currentPageIndex],
    );
  }
}
