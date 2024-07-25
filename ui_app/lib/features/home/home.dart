import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
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
                navBarHeight: 80,
                screens: _buildScreens,
                backgroundColor: HexColor('#f8ecf4'),
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
                      icon: Icons.home_outlined,
                      isActive: _controller.index == 0,
                    ),
                    title: "Home",
                    activeColorPrimary: Colors.black,
                    inactiveColorPrimary: Colors.grey,
                  ),
                  PersistentBottomNavBarItem(
                    icon: CustomNavBarIcon(
                      icon: Icons.track_changes_rounded,
                      isActive: _controller.index == 1,
                    ),
                    title: "Track Requests",
                    activeColorPrimary: Colors.black,
                    inactiveColorPrimary: Colors.grey,
                  ),
                  PersistentBottomNavBarItem(
                    icon: CustomNavBarIcon(
                      icon: Icons.menu,
                      isActive: _controller.index == 2,
                    ),
                    title: "Menu",
                    activeColorPrimary: Colors.black,
                    inactiveColorPrimary: Colors.grey,
                  ),
                ],
              );
            }),
      ),
    );
  }
}

class CustomNavBarIcon extends StatelessWidget {
  final IconData icon;
  final bool isActive;

  const CustomNavBarIcon({
    Key? key,
    required this.icon,
    required this.isActive,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      decoration: BoxDecoration(
          color: isActive ? Colors.yellow.withOpacity(0.8) : Colors.transparent,
          borderRadius: BorderRadius.circular(10)),
      child: Icon(
        icon,
        color: isActive ? Colors.black : Colors.grey,
      ),
    );
  }
}
