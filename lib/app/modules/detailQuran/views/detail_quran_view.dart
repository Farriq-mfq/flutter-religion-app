import 'package:alquranapp/app/controllers/base_controller_controller.dart';
import 'package:alquranapp/app/layout/base_layout.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:skeletons/skeletons.dart';

import '../controllers/detail_quran_controller.dart';

class DetailQuranView extends GetView<DetailQuranController> {
  const DetailQuranView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final base_controller = Get.put(BaseControllerController());
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 25, 192, 136),
      appBar: AppBar(
        toolbarHeight: 80,
        title: controller.obx(
            onLoading: Column(
              children: [
                Text("-"),
                SizedBox(
                  height: 10,
                ),
                Text("-"),
              ],
            ),
            onError: (error) => Text("Terjadi Kesalahan"),
            (state) => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(state!['name']['transliteration']['id']),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      state!['revelation']['id'],
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                )),
        centerTitle: true,
        actions: [
          InkWell(
            onTap: () {
              base_controller.setShowPanel();
              controller.setAyatIndex(-1);
            },
            child: Container(
              height: 50,
              width: 50,
              child: Icon(Iconsax.clipboard_text),
            ),
          )
        ],
      ),
      body: BaseLayout(
        panelContent: controller.obx(
            onLoading: SkeletonParagraph(
              style: SkeletonParagraphStyle(lines: 10),
            ),
            (state) => detailTafsir(controller.ayat_index.value, state)),
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
          onError: (error) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Terjadi Kesalahan"),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () async {
                  final param = Get.parameters;
                  await controller.getDetialSurah(param['surahID'] as String);
                },
                child: Icon(
                  Iconsax.refresh,
                  size: 40,
                ),
              )
            ],
          ),
          (state) => RefreshIndicator(
            color: Color.fromARGB(255, 25, 192, 136),
            onRefresh: () async {
              final param = Get.parameters;
              await controller.getDetialSurah(param['surahID'] as String);
            },
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => InkWell(
                onLongPress: () {
                  base_controller.setShowPanel();
                  controller.setAyatIndex(index);
                },
                child: Container(
                  color: Colors.grey.shade200,
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: state!['verses'][index]['text']['arab'],
                                style: TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 0.5,
                                    color: Colors.grey.shade800),
                              )
                            ],
                            text:
                                "${state!['verses'][index]['number']['inSurah']}  ",
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
                        alignment: Alignment.centerLeft,
                        child: Text(
                          state!['verses'][index]['translation']['id'],
                          style: TextStyle(
                            letterSpacing: 0.5,
                            color: Colors.grey.shade800,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              separatorBuilder: (context, index) => Divider(
                height: 40,
                color: Colors.grey.shade700,
              ),
              itemCount: state!['verses'].length,
            ),
          ),
        ),
      ),
    );
  }

  Widget detailTafsir(int index, dynamic data) {
    return index == -1
        ? SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                Text(
                  "Tafsir",
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(data['tafsir']['id']),
              ],
            ),
          )
        : SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                Text(
                  "Tafsir ayat ke ${data['verses'][index]['number']['inSurah']}",
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(data['verses'][index]['tafsir']['id']['long']),
              ],
            ),
          );
  }
}
