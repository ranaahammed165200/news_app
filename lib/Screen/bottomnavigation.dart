import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:news_app/AppTheme/ThemeColors.dart';
import 'package:news_app/Screen/Homepage.dart';
import 'package:news_app/Screen/category.dart';
import 'package:news_app/Screen/profile.dart';

class MainHomePage extends StatefulWidget {
  const MainHomePage({super.key});

  @override
  State<MainHomePage> createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {
  int selectIndex = 0;
  List bottom = [
    const Homepage(),
    const Category(),
    const Profile(),
    const Profile(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bottom[selectIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectIndex,
          onTap: (value) {
            selectIndex = value;
            setState(() {});
          },
          selectedItemColor: ThemeColors().purplePrimary,
          unselectedItemColor: ThemeColors().greyLight,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: ''),
            BottomNavigationBarItem(
              icon: Icon(IconlyLight.category),
              label: '',
            ),
            BottomNavigationBarItem(
                icon: Icon(IconlyLight.bookmark), label: ''),
            BottomNavigationBarItem(icon: Icon(IconlyLight.profile), label: '')
          ]),
    );
  }
}
