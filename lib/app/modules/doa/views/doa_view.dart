import 'package:alquranapp/app/layout/base_layout.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:skeletons/skeletons.dart';

import '../controllers/doa_controller.dart';

class DoaView extends GetView<DoaController> {
  const DoaView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 25, 192, 136),
      appBar: AppBar(
        title: const Text("Doa-Doa"),
        centerTitle: true,
      ),
      body: BaseLayout(
        padding: const EdgeInsets.only(
          top: 35,
          bottom: 10,
          left: 7,
          right: 7,
        ),
        size: size,
        child: controller.obx(
          onLoading: ListView.separated(
            physics: const BouncingScrollPhysics(),
            separatorBuilder: (context, index) => Divider(
              height: 40,
              color: Colors.grey.shade700,
            ),
            itemCount: 10,
            itemBuilder: (context, index) => Column(
              children: [
                Align(
                  child: SkeletonParagraph(),
                )
              ],
            ),
          ),
          onError: (error) => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Terjadi Kesalahan"),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () async {
                    await controller.findDoa();
                  },
                  child: Icon(
                    Iconsax.refresh,
                    size: 40,
                  ),
                )
              ],
            ),
          ),
          (state) => RefreshIndicator(
            color: Color.fromARGB(255, 25, 192, 136),
            onRefresh: () async {
              await controller.findDoa();
            },
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => Container(
                color: Colors.grey.shade200,
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: state![index].doa,
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 0.5,
                                  color: Colors.grey.shade800),
                            )
                          ],
                          text: "${state![index].id}. ",
                          style: TextStyle(
                            color: Color.fromARGB(255, 25, 192, 136),
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        state![index].ayat,
                        style: TextStyle(
                          letterSpacing: 0.5,
                          fontSize: 28,
                          color: Colors.grey.shade800,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        state![index].latin,
                        style: TextStyle(
                          letterSpacing: 0.5,
                          color: Colors.grey.shade800,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        state![index].artinya,
                        style: TextStyle(
                          letterSpacing: 0.5,
                          color: Colors.grey.shade800,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              separatorBuilder: (context, index) => Divider(
                height: 40,
                color: Colors.grey.shade700,
              ),
              itemCount: 12,
            ),
          ),
        ),
      ),
    );
  }
}
