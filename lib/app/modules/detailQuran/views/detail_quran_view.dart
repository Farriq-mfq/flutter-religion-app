import 'package:alquranapp/app/layout/base_layout.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/detail_quran_controller.dart';

class DetailQuranView extends GetView<DetailQuranController> {
  const DetailQuranView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 25, 192, 136),
      appBar: AppBar(
        title: const Text('DetailQuranView'),
        centerTitle: true,
      ),
      body: BaseLayout(
        padding: const EdgeInsets.only(
          top: 40,
          bottom: 10,
          left: 7,
          right: 7,
        ),
        size: size,
        child: controller.obx(
          (state) => ListView.separated(
            itemBuilder: (context, index) => Container(
              color: Colors.red,
              height: 200,
              child: Text(state!['verses'][index]['text']['arab']),
            ),
            separatorBuilder: (context, index) => Divider(),
            itemCount: state!['verses'].length,
          ),
        ),
      ),
    );
  }
}
