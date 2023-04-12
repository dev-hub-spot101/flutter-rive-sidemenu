import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:riveanimation/models/riveassets.dart';
import 'package:riveanimation/utils/riveutils.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  RiveAsset selectedMenu = sideMenus.first;
  @override
  Widget build(BuildContext context) {
    StateMachineController controller;
    return Scaffold(
      body: Container(
        width: 288,
        height: double.infinity,
        color: Color(0xff17203a),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                leading: const CircleAvatar(
                  backgroundColor: Colors.white24,
                  child: Icon(Icons.person, color: Colors.white),
                ),
                title: Text("DevHubSpot", style: TextStyle(color: Colors.white)),
                subtitle: Text("Blogger", style: TextStyle(color: Colors.white),),
              ),

              Padding(
                padding: EdgeInsets.only(left: 22, top:30, bottom: 14),
                child: Text("Browser", style: TextStyle(color: Colors.white),),
              ),

              ...sideMenus.map(
                (menu) => Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 22),
                      child: Divider(
                        color: Colors.white24,
                        height: 1,
                      ),
                    ),

                    Stack(
                      children: [
                        AnimatedPositioned(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.fastOutSlowIn,
                          height: 56,
                          width: selectedMenu == menu ? 288:0,
                          left: 0,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xff6792ff),
                              borderRadius: BorderRadius.all(Radius.circular(10))
                            ),
                          ),
                        ),
                        ListTile(
                          onTap: () {
                            print(menu);
                            menu.input?.change(true);
                            setState(() {
                              selectedMenu = menu;
                            });
                            Future.delayed(const Duration(seconds: 1), () {
                             menu.input?.change(false);
                            });
                           
                          },
                          leading: SizedBox(
                            height: 35, width: 35,
                            child: RiveAnimation.asset(
                              menu.src,
                              artboard: menu.artboard,
                              onInit: (artboard) {
                                StateMachineController controller = RiveUtils.getRiveController(artboard, stateMachineName: menu.stateMachineName);
                                menu.input = controller.findSMI("active") as SMIBool;
                              },
                            ),
                          ),
                          title : Text(menu.title, style: TextStyle(color: Colors.white),)
                        )
                      ],
                    )
                  ],
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}