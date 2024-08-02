import 'package:flutter/material.dart';
import 'package:dijitalimyemek/constanst.dart';
import 'package:iconsax/iconsax.dart';
import 'package:dijitalimyemek/screens/home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentTab = 0;
  List screens = const [
    HomeScreen(),
    Scaffold(),
    // Scaffold(), // Öğün Planla kısmını yorum satırına aldık
    Scaffold(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () => setState(() {
                currentTab = 0;
              }),
              child: Column(
                children: [
                  Icon(
                    currentTab == 0 ? Iconsax.home5 : Iconsax.home,
                    color: currentTab == 0 ? kbackgroundColor : Colors.black,
                  ),
                  Text(
                    "Anasayfa",
                    style: TextStyle(
                      fontSize: 14,
                      color: currentTab == 0 ? kbackgroundColor : Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () => setState(() {
                currentTab = 1;
              }),
              child: Column(
                children: [
                  Icon(
                    currentTab == 1 ? Iconsax.heart5 : Iconsax.heart,
                    color: currentTab == 1 ? kbackgroundColor : Colors.black,
                  ),
                  Text(
                    "Favoriler",
                    style: TextStyle(
                      fontSize: 14,
                      color: currentTab == 1 ? kbackgroundColor : Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            // GestureDetector(
            //   onTap: () => setState(() {
            //     currentTab = 2;
            //   }),
            //   child: Column(
            //     children: [
            //       Icon(
            //         currentTab == 2 ? Iconsax.calendar_25 : Iconsax.calendar_2,
            //         color: currentTab == 2 ? kbackgroundColor : Colors.black,
            //       ),
            //       Text(
            //         "Öğün Planla",
            //         style: TextStyle(
            //           fontSize: 14,
            //           color: currentTab == 2 ? kbackgroundColor : Colors.black,
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            GestureDetector(
              onTap: () => setState(() {
                currentTab = 3;
              }),
              child: Column(
                children: [
                  Icon(
                    currentTab == 3 ? Iconsax.setting5 : Iconsax.setting,
                    color: currentTab == 3 ? kbackgroundColor : Colors.black,
                  ),
                  Text(
                    "Ayarlar",
                    style: TextStyle(
                      fontSize: 14,
                      color: currentTab == 3 ? kbackgroundColor : Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: screens[currentTab],
    );
  }
}
