import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:rive_animation/model/rive_model.dart';
import 'package:rive_animation/screens/entryPoint/components/info_card.dart';
import 'package:rive_animation/screens/entryPoint/components/side_menu_tile.dart';
import 'package:rive_animation/utils/rive_utils.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  RiveAsset selectedMenu = sideMenus[0];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 288,
        height: double.infinity,
        color: const Color(0xFF17203A),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const InfoCard(
                name: "John Doe",
                profession: "UI/UX Designer",
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24, top: 32, bottom: 16),
                child: Text(
                  "Browse".toUpperCase(),
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Colors.white70),
                ),
              ),
              ...sideMenus.map(
                (menu) => SideMenuTile(
                  menu: menu,
                  riveonInit: (artboard) {
                    //버튼을 클릭하면 애니메이션을 실행한다.
                    StateMachineController controller =
                        RiveUtils.getRiveController(artboard,
                            stateMachineName: menu.stateMachineName);
                    menu.status = controller.findSMI("active") as SMIBool;
                  },
                  press: () {
                    menu.status!.change(true);
                    Future.delayed(const Duration(milliseconds: 900), () {
                      menu.status!.change(false);
                    });
                    setState(() {
                      selectedMenu = menu;
                    });
                  },
                  isActive: selectedMenu == menu,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24, top: 32, bottom: 16),
                child: Text(
                  "History".toUpperCase(),
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Colors.white70),
                ),
              ),
              ...sideMenu2.map(
                (e) => SideMenuTile(
                  menu: e,
                  riveonInit: (artboard) {
                    StateMachineController controller =
                        RiveUtils.getRiveController(artboard,
                            stateMachineName: e.stateMachineName);
                    e.status = controller.findSMI("active") as SMIBool;
                  },
                  press: () {
                    e.status!.change(true);
                    Future.delayed(const Duration(milliseconds: 900), () {
                      e.status!.change(false);
                    });
                    setState(() {
                      selectedMenu = e;
                    });
                  },
                  isActive: selectedMenu == e,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
