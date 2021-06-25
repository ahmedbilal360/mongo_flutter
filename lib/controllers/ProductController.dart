import 'dart:io';

import 'package:get/get.dart';
//import 'package:path_provider/path_provider.dart';
import 'package:pos_flutter/models/ProductModel.dart';


class ProductController extends GetxController {
  RxList<ProductModel> list = <ProductModel>[].obs;
  var databaseFactory;
  //late Database db;
  ProductController() {
    load();
  }
  load() async {
    list.add(ProductModel(id: "1", name: "test product"));
   // databaseFactory = databaseFactoryFfi;
    await openDB();
    await getAll();
  }

  openDB() async {
    // db = await databaseFactory.openDatabase("c:/pos/pos.db");
    // await db.execute('''
    // CREATE TABLE IF NOT EXISTS Product (
    //     id INTEGER PRIMARY KEY,
    //     name TEXT
    // )
    // ''');
  }

  getAll() async {
    // var result = await db.query('Product');
    // list.removeRange(0, list.length);
    // for (Map m in result) {
    //   list.add(ProductModel(id: m['id'].toString(), name: m['name']));
    // }
    // list.refresh();
    // db.close();
    // print(result);
  }

  void add(String name) async {
    list.add(ProductModel(id: "2", name: "TEST CUSTOMER"));
    // await openDB();
    // await db.insert('Product', <String, Object>{'name': name});
    // await getAll();
  }

  void remove(String id) async {
    // await openDB();
    // await db.execute("delete from product where id='" + id + "'");
    // await getAll();
  }
}
