import 'dart:ui';

import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Image.asset(
              "images/login_img.png",
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Welcome",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: "Enter UserName", labelText: "UserName"),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                        hintText: "Enter Password", labelText: "Password"),
                  )
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                print("Hello button pressed");
              },
              child: Text("Login"),
              style: TextButton.styleFrom(),
            ),
          ],
        ),
      ),
    );
  }
}
