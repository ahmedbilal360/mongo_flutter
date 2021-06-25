import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:pos_flutter/models/CustomerModel.dart';
//import 'package:path_provider/path_provider.dart';
import 'package:pos_flutter/models/ProductModel.dart';

class CustomerController extends GetxController {
  RxList<CustomerModel> list = <CustomerModel>[].obs;
  var databaseFactory;
  String host = Platform.environment['MONGO_DART_DRIVER_HOST'] ?? '127.0.0.1';
  String port = Platform.environment['MONGO_DART_DRIVER_PORT'] ?? '27017';
  late Db db;
  late DbCollection collection;

  CustomerController() {
    load();
  }

  load() async {
    await openDB();
    await getAll();
  }

  openDB() async {
    db = Db('mongodb://$host:$port/360db');
    await db.open();
    await db.drop();
    collection = db.collection('customers');
  }

  getAll() async {
    await openDB();
    list.removeRange(0, list.length);
    await collection.find(where.sortBy('name')).forEach((customer) {
      list.add(CustomerModel(
          id: customer["_id"].toString(), name: customer['name']));
    });
    await db.close();
  }

  void add(Map<String, dynamic> data) async {
    await openDB();
    collection.insertOne(data);
    await getAll();
  }

  edit(String id) async {
    await openDB();
    Map<String, dynamic>? data = await collection.findOne(where.eq("_id", id));
    await db.close();
  }

  void remove(String id) async {
    await openDB();
    collection.remove(where.eq("_id", id));
    await getAll();
  }
}
