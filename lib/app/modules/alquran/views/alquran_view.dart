import 'package:alquranapp/app/layout/base_layout.dart';
import 'package:alquranapp/models/surah.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:skeletons/skeletons.dart';

import '../controllers/alquran_controller.dart';

class AlquranView extends GetView<AlquranController> {
  const AlquranView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 25, 192, 136),
      appBar: AppBar(
        title: const Text('Alquran'),
        centerTitle: true,
        actions: [
          InkWell(
            child: Container(
              height: 60,
              width: 60,
              child: Icon(Icons.search),
            ),
          )
        ],
      ),
      body: BaseLayout(
        size: size,
        child: controller.obx(
          onError: (error) => Center(
            child: Text("Terjadi Kesalahan"),
          ),
          onLoading: ListView.separated(
              itemBuilder: (context, index) => Container(
                    padding: const EdgeInsets.all(25),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: SkeletonListTile(
                      leadingStyle: SkeletonAvatarStyle(
                        shape: BoxShape.circle,
                        height: 50,
                        width: 50,
                      ),
                      titleStyle: SkeletonLineStyle(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      hasSubtitle: true,
                      subtitleStyle: SkeletonLineStyle(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
              separatorBuilder: (context, index) => SizedBox(
                    height: 20,
                  ),
              itemCount: 8),
          (state) => ListView.separated(
            physics: const BouncingScrollPhysics(),
            separatorBuilder: (context, index) {
              return SizedBox(
                height: 20,
              );
            },
            itemCount: state!.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return listQuran(state[index]);
            },
          ),
        ),
      ),
    );
  }

  Widget listQuran(dynamic data) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 1,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: ListTile(
        onTap: () {
          Get.toNamed("/detail-quran/${data['number']}");
        },
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
             data['name']['transliteration']['id'],
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 5,
            )
          ],
        ),
        subtitle: Text(
          data['name']['translation']['id'],
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
        ),
        trailing: Text(
         data['revelation']['id'],
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
        ),
        leading: Container(
          height: 50,
          width: 50,
          alignment: Alignment.center,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 25, 192, 136).withOpacity(0.2),
            borderRadius: BorderRadius.circular(50),
          ),
          child: Text(
            "${data['numberOfVerses']}",
            maxLines: 1,
            style: TextStyle(
                color: Color.fromARGB(255, 25, 192, 136),
                fontWeight: FontWeight.bold,
                letterSpacing: 0.2),
          ),
        ),
        contentPadding: const EdgeInsets.all(20),
      ),
    );
  }
}
