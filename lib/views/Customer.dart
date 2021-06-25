import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_flutter/controllers/CustomerController.dart';
import 'package:pos_flutter/controllers/ProductController.dart';

class Customer extends StatelessWidget {
  Customer({Key? key}) : super(key: key);
  final CustomerController controller = Get.put(CustomerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => ListView.builder(
          itemCount: controller.list.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 2,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(controller.list[index].id.toString()),
                    Text(controller.list[index].name),
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              Get.toNamed('/customer/' +
                                  controller.list[index].id.toString());
                            },
                            icon: Icon(Icons.edit)),
                        IconButton(
                            onPressed: () {
                              controller.remove(controller.list[index].id);
                            },
                            icon: Icon(Icons.delete_forever))
                      ],
                    )
                  ],
                ),
              ),
            );
          })),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Get.toNamed('/customer/new');
        },
      ),
    );
  }
}
