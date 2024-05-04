import 'package:climb_up/core/utils/app_styles.dart';
import 'package:climb_up/core/utils/constants.dart';
import 'package:climb_up/features/add_post/add_post_view.dart';
import 'package:climb_up/features/auth/presention/sign_up_view.dart';
import 'package:climb_up/features/cart/presention/cart_view.dart';
import 'package:climb_up/features/home/presention/home_view.dart';
import 'package:climb_up/features/profile/presentation/profile_view.dart';

import 'package:climb_up/icons.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _currentIndex = 0;
  final List<Widget> _widgetsOptions = [
    const HomeView(),
    const AddPostView(),
    const CartView(),
    const ProfileView(),    

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: _widgetsOptions.elementAt(_currentIndex), // Added line here
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 10, bottom: 17, left: 16, right: 16),
            child: FittedBox(
              child: GNav(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                activeColor: Colors.white,
                textStyle: AppStyles.poppinsStyleMedium12(context),
                gap: 6,
                tabBackgroundColor: AppColors.kPrimaryColor,
                onTabChange: _changePages,
                tabs: const [
                  GButton(
                    icon: MyFlutterApp.li_home,
                    text: 'Home',
                    iconColor: Colors.black,
                  ),
                  // GButton(
                  //   icon: FontAwesomeIcons.magnifyingGlass,
                  //   text: 'Search',
                  //   iconColor: Colors.black,
                  // ),
                  GButton(
                    icon: MyFlutterApp.simple_line_icons_plus,
                    text: 'Add Post',
                    iconColor: Colors.black,
                  ),
                  GButton(
                    icon: FontAwesomeIcons.cartShopping,
                    text: 'Cart',
                    iconColor: Colors.black,
                  ),
                  GButton(
                    icon: MyFlutterApp.li_user,
                    text: 'Profile',
                    iconColor: Colors.black,
                  ),
                ],
                selectedIndex: _currentIndex,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _changePages(int value) {
    setState(() {
      _currentIndex = value;
    });

 
  }
}
