import 'package:demo_ch_1/pages/cart_page.dart';
import 'package:demo_ch_1/pages/home_detail.dart';
import 'package:demo_ch_1/pages/home_page.dart';
import 'package:demo_ch_1/pages/login_page.dart';
import 'package:demo_ch_1/store/store.dart';
import 'package:demo_ch_1/utils/routes.dart';
import 'package:demo_ch_1/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  setPathUrlStrategy();
  runApp(VxState(
    child: MyApp(),
    store: MyStore(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      themeMode: ThemeMode.system,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      routeInformationParser: VxInformationParser(),
      routerDelegate: VxNavigator(routes: {
        "/": (_, __) => MaterialPage(child: HomePage()),
        MyRoutes.homeRoute: (_, __) => MaterialPage(child: HomePage()),
        MyRoutes.homeDetails: (uri, _) {
          final item = (VxState.store as MyStore)
              .appdataModel
              .getItemById(int.parse(uri.queryParameters["id"]));
          return MaterialPage(
            child: HomeDetails(
              item: item,
            ),
          );
        },
        MyRoutes.loginRoute: (_, __) => MaterialPage(child: LoginPage()),
        MyRoutes.cartRoute: (_, __) => MaterialPage(child: CartPage())
      }),
      /* initialRoute: MyRoutes.loginRoute,
      routes: {
        "/": (context) => LoginPage(),
        MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.loginRoute: (context) => LoginPage(),
        MyRoutes.cartRoute: (context) => CartPage()
      } */
    );
  }
}
