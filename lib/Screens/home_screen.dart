import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies/utitities/app_colors.dart';
import 'package:movies/utitities/conext_extentions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  BottomNavigationBarItem BuildBottomNavBarItem({required IconData iconName,required int index}) {
        return BottomNavigationBarItem(
                label: "",
                icon : selectedIndex == index ? 
                      Icon(iconName, color: AppColors.yellow,size: 24,) 
                      : Icon(iconName, color: AppColors.white,size: 24,)
        );
  }
  int selectedIndex=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold( 
        bottomNavigationBar: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: context.w * 0.04,
                vertical: context.h * 0.02,
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.grey,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: BottomNavigationBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  currentIndex: selectedIndex,
                  type: BottomNavigationBarType.fixed,
                  showSelectedLabels: false,
                  showUnselectedLabels: false,
                  onTap: (value) {
                    setState(() {
                      selectedIndex = value;
                    });
                  },
                  items: [
                    BuildBottomNavBarItem(iconName: Icons.home_rounded, index: 0),
                    BuildBottomNavBarItem(iconName: Icons.search_rounded, index: 1),
                    BuildBottomNavBarItem(iconName: CupertinoIcons.compass, index: 2),
                    BuildBottomNavBarItem(iconName: Icons.person, index: 3),
                  ],
                ),
              ),
            ),
    );
    
  }
     
}