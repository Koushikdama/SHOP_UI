import 'package:flutter/material.dart';
import 'package:third_app/cart_page.dart';
import 'package:third_app/menu.dart';
// ignore: unused_import
import 'package:third_app/product_card.dart';
//import 'package:third_app/product_details.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // final List<String> filters = const ['ALL', "Addidas", "Nike", "Bata"];
  // late String selectedfilter;

  int currentPage = 0;
  List<Widget> pages = const [MainMenu(), CartPage()];

  // @override
  // void initState() {
  //   super.initState();
  //   selectedfilter = filters[0];
  // }

  @override
  Widget build(BuildContext context) {
    //here the main page and cart page display
    return Scaffold(
      body: IndexedStack(
        // this will help to set the scrollable in if we go to another page
        index: currentPage,
        children: pages,
      ), //currentPage == 0 ? MainMenu() : CartPage(),
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 0,
        unselectedFontSize: 0,
        iconSize: 35,
        onTap: (value) => {
          setState(() {
            currentPage = value;
            //print(" home_page value $value");
          })
        },
        currentIndex: currentPage,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: "")
        ],
      ),
    );
  }
}
