import 'package:alquranapp/app/layout/base_layout.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../controllers/tasbih_controller.dart';

class TasbihView extends GetView<TasbihController> {
  const TasbihView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 25, 192, 136),
      appBar: AppBar(
        title: const Text(
          'Tasbih',
          style: TextStyle(fontSize: 20, letterSpacing: 1),
        ),
        centerTitle: true,
      ),
      floatingActionButton: InkWell(
        onTap: () {
          controller.increment();
        },
        child: Container(
          height: 60,
          width: 60,
          child: Icon(
            Iconsax.add4,
            size: 30,
            color: Colors.white,
          ),
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 25, 192, 136),
              borderRadius: BorderRadius.circular(20)),
        ),
      ),
      body: BaseLayout(
          size: size,
          child: SizedBox(
            height: size.height,
            child: Center(
              child: Obx(
                () => Text(
                  "${controller.count.value}",
                  style: TextStyle(fontSize: 70, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          )),
    );
  }
}
