import 'dart:math';

import 'package:flutter/material.dart';
import 'package:riveanimation/screens/home.dart';
import 'package:riveanimation/sidemenu/sidemenu.dart';
import 'package:rive/rive.dart';
import 'package:riveanimation/utils/riveutils.dart';

class NavigationPoint extends StatefulWidget {
  const NavigationPoint({super.key});

  @override
  State<NavigationPoint> createState() => _NavigationPointState();
}

class _NavigationPointState extends State<NavigationPoint> with SingleTickerProviderStateMixin{

  late AnimationController _animationController;
  late Animation<double> animation;
  late Animation<double> scalAnimation;

  late SMIBool isSideBarClosed;
  bool isSideMenuClosed = true;


  @override
  void initState() {
    // TODO: implement initState

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    )..addListener(() {
        setState(() {});
    });

    animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _animationController
      , curve: Curves.fastOutSlowIn),
    );

   scalAnimation = Tween<double>(begin: 1, end: 0.8).animate(
      CurvedAnimation(parent: _animationController
      , curve: Curves.fastOutSlowIn),
    );

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
       body: Stack(
        // It's time to add the SideMenu
        children: [
          // It shows nothing
          // because now it's under the HomeScreen
          AnimatedPositioned(
            duration: const Duration(milliseconds: 200),
            curve: Curves.fastOutSlowIn,
            width: 288,
            left: isSideMenuClosed ? -288 : 0,
            height: MediaQuery.of(context).size.height,
            child: const SideMenu(),
          ),
          Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateY(animation.value - 40 * animation.value * pi / 180),
            child: Transform.translate(
              offset: Offset(animation.value * 265, 0),
              child: Transform.scale(
                scale: scalAnimation.value,
                child: const ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(24)),
                  child: Home(),
                ),
              ),
            ),
          ),
          // As you can see it's an ANimated button
          AnimatedPositioned(
            duration: Duration(milliseconds: 200),
            curve: Curves.fastOutSlowIn,
            left: isSideMenuClosed ? 0 : 220,
            top: 16,
            child: SafeArea(
              child: GestureDetector(
                onTap: (){
                  isSideBarClosed.value = !isSideBarClosed.value;
                if (isSideMenuClosed) {
                  _animationController.forward();
                } else {
                  _animationController.reverse();
                }
                setState(() {
                  isSideMenuClosed = isSideBarClosed.value;
                });
                },
                child: Container(
                  margin: const EdgeInsets.only(left: 16),
                  height: 40,
                  width: 40,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        offset: Offset(0, 3),
                        blurRadius: 8,
                      )
                    ],
                  ),
                  child: RiveAnimation.asset(
                        "assets/RiveAssets/menu_button.riv",
                        onInit:  (artboard) {
                    StateMachineController controller = RiveUtils.getRiveController(
                        artboard,
                        stateMachineName: "State Machine");
                    isSideBarClosed = controller.findSMI("isOpen") as SMIBool;
                    // Now it's easy to understand
                    isSideBarClosed.value = true;
                  },
                  ),
                ),
              ),
            )
          ),
        ],
      ),
    );
  }
}