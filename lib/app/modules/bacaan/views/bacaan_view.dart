import 'package:alquranapp/app/layout/base_layout.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../controllers/bacaan_controller.dart';

class BacaanView extends GetView<BacaanController> {
  const BacaanView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 25, 192, 136),
      appBar: AppBar(
        title: const Text('Kumpulan Bacaan'),
        centerTitle: true,
      ),
      body: BaseLayout(
        size: size,
        child: ListView(
          children: [
            Card(
              elevation: 1,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: ListTile(
                leading: Icon(Iconsax.book),
                contentPadding: const EdgeInsets.all(12),
                title: Text("Niat Sholat"),
                onTap: () {
                  Get.toNamed("/niat-sholat");
                },
              ),
            ),
            Card(
              elevation: 1,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: ListTile(
                leading: Icon(Iconsax.book),
                contentPadding: const EdgeInsets.all(10),
                title: Text("Doa Sholat"),
                onTap: () {
                  Get.toNamed("/doa-sholat");
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
