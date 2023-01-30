import 'package:alquranapp/app/layout/base_layout.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:skeletons/skeletons.dart';

import '../controllers/jadwal_sholat_controller.dart';

class JadwalSholatView extends GetView<JadwalSholatController> {
  const JadwalSholatView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 25, 192, 136),
      appBar: AppBar(
        title: const Text('Jadwal Sholat'),
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
          onError: (error) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Terjadi Kesalahan"),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () async {
                  await controller.findJadwalSholat();
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
              await controller.findJadwalSholat();
            },
            child: ListView(
              children: [
                ListTile(
                  leading: Icon(Iconsax.clock),
                  title: Text("Ashar"),
                  subtitle: Text(state!.ashar),
                ),
                Divider(
                  color: Colors.grey.shade700,
                ),
                ListTile(
                  leading: Icon(Iconsax.clock),
                  title: Text("Dhuha"),
                  subtitle: Text(state!.dhuha),
                ),
                Divider(
                  color: Colors.grey.shade700,
                ),
                ListTile(
                  leading: Icon(Iconsax.clock),
                  title: Text("Dzuhur"),
                  subtitle: Text(state!.dzuhur),
                ),
                Divider(
                  color: Colors.grey.shade700,
                ),
                ListTile(
                  leading: Icon(Iconsax.clock),
                  title: Text("Imsak"),
                  subtitle: Text(state!.imsak),
                ),
                Divider(
                  color: Colors.grey.shade700,
                ),
                ListTile(
                  leading: Icon(Iconsax.clock),
                  title: Text("Isya"),
                  subtitle: Text(state!.isya),
                ),
                Divider(
                  color: Colors.grey.shade700,
                ),
                ListTile(
                  leading: Icon(Iconsax.clock),
                  title: Text("Maghrib"),
                  subtitle: Text(state!.maghrib),
                ),
                Divider(
                  color: Colors.grey.shade700,
                ),
                ListTile(
                  leading: Icon(Iconsax.clock),
                  title: Text("Subuh"),
                  subtitle: Text(state!.subuh),
                ),
                Divider(
                  color: Colors.grey.shade700,
                ),
                ListTile(
                  leading: Icon(Iconsax.clock),
                  title: Text("Tanggal"),
                  subtitle: Text(state!.tanggal),
                ),
                Divider(
                  color: Colors.grey.shade700,
                ),
                ListTile(
                  leading: Icon(Iconsax.clock),
                  title: Text("Terbit"),
                  subtitle: Text(state!.terbit),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
