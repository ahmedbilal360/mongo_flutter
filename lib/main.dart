import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:pos_flutter/views/Customer.dart';
import 'package:pos_flutter/views/Product.dart';
import 'package:pos_flutter/views/customer_edit.dart';

import 'views/dashboard.dart';

Future main() async {
  if (GetPlatform.isWindows) {
    // Initialize FFI

    // Change the default factory
  }
  runApp(MyApp());
}

// void main() {
//
// }

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter POS',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/home',
      getPages: [
        GetPage(
            name: '/:page_name',
            page: () => MasterPage(),
            transition: Transition.noTransition),
        GetPage(
            name: '/:page_name/:id',
            page: () => MasterPage(),
            transition: Transition.noTransition),
      ],
    );
  }
}

class MasterPage extends StatelessWidget {
  late Widget? InnerView;
  MasterPage() {
    Map<String, Widget> InnterRoutes = {
      'home': Dashboard(),
      'product': Product(),
      'customer': Customer()
    };

    if (Get.parameters['id'] == null) {
      InnerView = InnterRoutes[Get.parameters['page_name']];
    } else {
      Map<String, Widget> editroutes = {
        'customer': CustomerEdit(Get.parameters['id'].toString())
      };
      InnerView = editroutes[Get.parameters['page_name']];
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Row(
          children: [
            Expanded(
                child: Container(
              color: Color(0xFF1d4c94),
              child: Column(
                children: [
                  Container(
                    width: double.maxFinite,
                    child: DrawerHeader(
                      child: CircleAvatar(
                        child: Icon(
                          CupertinoIcons.profile_circled,
                          size: 60,
                        ),
                      ),
                    ),
                  ),
                  ListTile(
                    tileColor: Colors.black12,
                    hoverColor: Colors.black12,
                    leading: Icon(Icons.menu),
                    title: Text("Dashboard"),
                    onTap: () {
                      Get.toNamed("/home");
                    },
                  ),
                  SizedBox(height: 2),
                  ListTile(
                    tileColor: Colors.black12,
                    hoverColor: Colors.black12,
                    leading: Icon(CupertinoIcons.square_favorites_alt),
                    title: Text("Products"),
                    onTap: () {
                      Get.toNamed("/product");
                    },
                  ),
                  SizedBox(height: 2),
                  ListTile(
                    tileColor: Colors.black12,
                    hoverColor: Colors.black12,
                    leading: Icon(CupertinoIcons.square_favorites_alt),
                    title: Text("Customers"),
                    onTap: () {
                      Get.toNamed("/customer");
                    },
                  )
                ],
              ),
            )),
            Expanded(
                flex: 5,
                child: Container(
                  color: Colors.white,
                  child: InnerView,
                ))
          ],
        ),
      ),
    );
  }
}
