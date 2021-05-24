import 'package:demo_ch_1/utils/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class MyDrawer extends StatelessWidget {
  final imageUrl =
      "https://www.universal-rights.org/wp-content/uploads/2019/09/30212411048_2a1d7200e2_z-1.jpg";

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: context.canvasColor,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.white30),
                margin: EdgeInsets.zero,
                accountName: Text(
                  "Mahesh Keshvala",
                  style: TextStyle(color: context.theme.buttonColor),
                ),
                accountEmail: Text(
                  "Technolag@gmail.com",
                  style: TextStyle(color: context.theme.buttonColor),
                ),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(imageUrl),
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.home,
                color: context.theme.buttonColor,
              ),
              title: Text(
                "Home",
                textScaleFactor: 1.2,
              ),
              trailing: Icon(
                CupertinoIcons.square_arrow_right,
                color: context.theme.buttonColor,
              ),
            ),
            Expanded(
              child: Divider(
                color: context.accentColor,
                height: 1,
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.profile_circled,
                color: context.theme.buttonColor,
              ),
              title: Text(
                "Profile",
                textScaleFactor: 1.2,
              ),
              trailing: Icon(
                CupertinoIcons.square_arrow_right,
                color: context.theme.buttonColor,
              ),
            ),
            Expanded(
              child: Divider(
                color: context.accentColor,
                height: 1,
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.mail,
                color: context.theme.buttonColor,
              ),
              title: Text(
                "Email",
                textScaleFactor: 1.2,
              ),
              trailing: Icon(
                CupertinoIcons.square_arrow_up_on_square,
                color: context.theme.buttonColor,
              ),
            ),
            Expanded(
              child: Divider(
                color: context.accentColor,
                height: 1,
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.square_arrow_left,
                color: context.theme.buttonColor,
              ),
              title: Text(
                "Logout",
                textScaleFactor: 1.2,
              ),
              onTap: () {
                Navigator.pushNamed(context, MyRoutes.loginRoute);
              },
            ),
            Expanded(
              child: Divider(
                color: context.accentColor,
                height: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
