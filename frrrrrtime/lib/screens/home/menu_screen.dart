import 'package:flutter/material.dart';
import 'package:frrrrrtime/configs/themes/app_colors.dart';
import 'package:frrrrrtime/configs/themes/ui_parameters.dart';
import 'package:frrrrrtime/controllers/zoom_drawer_controller.dart';
import 'package:get/get.dart';

import '../../services/auth_service.dart';

class MenuScreen extends GetView<MyZoomDrawerController> {
  const MenuScreen({Key? key});
  static const String routeName = "/task";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: mainGradient(),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: kToolbarHeight,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () {
                      controller.toogleDraw();
                    },
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                "Navigation Bar",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              DrawerButton(
                icon: Icons.home,
                label: "Home",
                onPressed: () => Get.toNamed("/course"),
              ),
              DrawerButton(
                icon: Icons.quiz,
                label: "Quiz",
                onPressed: () => Get.toNamed("/home"),
              ),
              DrawerButton(
                icon: Icons.chat,
                label: "Messages",
                onPressed: () => Get.toNamed("/chat"),
              ),
              DrawerButton(
                icon: Icons.book_sharp,
                label: "Library",
                onPressed: () => Get.toNamed("/library"),
              ),
              DrawerButton(
                icon: Icons.group_add,
                label: "Clubs",
                onPressed: () => Get.toNamed("/club"),
              ),
              const Spacer(),
              DrawerButton(
                icon: Icons.logout,
                label: "Logout",
                onPressed: () =>AuthService().signOut(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DrawerButton extends StatelessWidget {
  const DrawerButton({
    required this.icon,
    required this.label,
    this.onPressed,
  });
  final IconData icon;
  final String label;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onPressed,
      icon: Icon(
        icon,
        size: 18,
        color: Colors.white,
      ),
      label: Text(
        label,
        style: TextStyle(color: Colors.white,
        fontSize: 17,
        fontWeight: FontWeight.bold),
      ),
    );
  }
}
