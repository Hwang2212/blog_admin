import 'package:flutter/material.dart';
import 'package:arrivo_web/theme/theme.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
              decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12))),
              child: Text("Menu")),
          ListTile(
            // shape: RoundedRectangleBorder(),
            hoverColor: AppColors.primary,
            title: Text('Hello'),
          )
        ],
      ),
    );
  }
}
