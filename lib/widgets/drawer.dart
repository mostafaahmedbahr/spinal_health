 import 'package:flutter/material.dart';


class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return   const SafeArea(
      child: Drawer(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // BuildDrawerHeaderWidget(),
              // BuildDrawerMenuItemsWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
