import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:ui_app/constant/image_constant.dart';
import 'package:ui_app/features/welcome/welcomescreen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late PersistentTabController _controller;
  final ValueNotifier<bool> showBottomNavBar = ValueNotifier(true);
  List<Widget> _buildScreens = [];
  @override
  void initState() {
    super.initState();
    setState(() {
      _controller = PersistentTabController(initialIndex: 0);
    });
    _buildScreens = [
      Welcome(onWelcomeScreenExit: () => showBottomNavBar.value = false),
      Container(),
      Container(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: ValueListenableBuilder<bool>(
            valueListenable: showBottomNavBar,
            builder: (context, value, child) {
              return PersistentTabView(
                context,
                isVisible: value,
                controller: _controller,
                confineToSafeArea: true,
                navBarHeight: 90,
                screens: _buildScreens,
                backgroundColor: HexColor('#F1ECF4'),
                padding: const EdgeInsets.all(10),
                navBarStyle: NavBarStyle.simple,
                onItemSelected: (index) {
                  setState(() {
                    _controller.index = index;
                  });
                },
                items: [
                  PersistentBottomNavBarItem(
                    icon: CustomNavBarIcon(
                      icon: ImageConstant.home,
                      isActive: _controller.index == 0,
                    ),
                    title: "Home",
                    activeColorPrimary: Colors.black,
                    inactiveColorPrimary: HexColor('#48454E'),
                  ),
                  PersistentBottomNavBarItem(
                    icon: CustomNavBarIcon(
                      icon: ImageConstant.track,
                      isActive: _controller.index == 1,
                    ),
                    title: "Track Requests",
                    activeColorPrimary: Colors.black,
                    inactiveColorPrimary: HexColor('#48454E'),
                  ),
                  PersistentBottomNavBarItem(
                    icon: CustomNavBarIcon(
                      icon: ImageConstant.menu,
                      isActive: _controller.index == 2,
                    ),
                    title: "Menu",
                    activeColorPrimary: Colors.black,
                    inactiveColorPrimary: HexColor('#48454E'),
                  ),
                ],
              );
            }),
      ),
    );
  }
}

class CustomNavBarIcon extends StatelessWidget {
  final String icon;
  final bool isActive;

  const CustomNavBarIcon({
    Key? key,
    required this.icon,
    required this.isActive,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 64,
      height: 32,
      decoration: BoxDecoration(
          color: isActive ? HexColor('#F3E48A') : Colors.transparent,
          borderRadius: BorderRadius.circular(15)),
      child: Image.asset(icon, color: Colors.black),
    );
  }
}
