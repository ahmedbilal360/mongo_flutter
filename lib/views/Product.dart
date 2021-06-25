import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_flutter/controllers/ProductController.dart';

class Product extends StatelessWidget {
  Product({Key? key}) : super(key: key);
  final ProductController controller = Get.put(ProductController());

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
                        IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
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
          controller.add("new Produtct");
        },
      ),
    );
  }
}
