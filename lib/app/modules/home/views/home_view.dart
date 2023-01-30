import 'package:alquranapp/app/widget/KategoriWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:skeletons/skeletons.dart';

import '../controllers/home_controller.dart';
import 'dart:ui' as ui;

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    // int endTime = DateTime.now().millisecondsSinceEpoch + ;
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            ClipPath(
              clipper: OvalBottomBorderClipper(),
              child: Stack(
                children: [
                  Container(
                    height: size.height * 0.5,
                    color: Color(0xff0CB47C),
                    child: Stack(
                      children: [
                        Positioned(
                          bottom: 100,
                          left: 0,
                          right: 0,
                          child: Image.asset(
                            "assets/images/mosque.png",
                            fit: BoxFit.cover,
                            color: Color.fromARGB(255, 25, 192, 136),
                          ),
                        ),
                        Positioned(
                          child: controller.obx(
                            onLoading: Text("-"),
                            onError: (error) => Text("-"),
                            (state) => Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "${state['tanggal_hijriyah']} ${state['bulan_hijriyah']} ${state['tahun_hijriyah']} ",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 22,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 0.5),
                                ),
                              ],
                            ),
                          ),
                          left: 0,
                          right: 0,
                          top: 30,
                          bottom: 0,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // menu di sini
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              transform: Matrix4.translationValues(0.0, -120.0, 0.0),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: GridView.count(
                crossAxisCount: 3,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                shrinkWrap: true,
                primary: false,
                children: [
                  KategoriWidget(
                    icon_path: "assets/icons/quran.svg",
                    title: "Al-quran",
                    link: "/alquran",
                  ),
                  KategoriWidget(
                    icon_path: "assets/icons/pray.svg",
                    title: "Do'a - Do'a",
                    link: "/doa",
                  ),
                  KategoriWidget(
                    icon_path: "assets/icons/tasbih.svg",
                    title: "Tasbih",
                    link: "/tasbih",
                  ),
                  KategoriWidget(
                    icon_path: "assets/icons/tahlil.svg",
                    title: "Tahlil",
                    link: "/tahlil",
                  ),
                  KategoriWidget(
                    icon_path: "assets/icons/tata_cara.svg",
                    title: "Kumpulan Bacaan",
                    link: "/bacaan",
                  ),
                  KategoriWidget(
                    icon_path: "assets/icons/asmaul_husna.svg",
                    title: "Asmaul Husna",
                    link: "/asmaul-husna",
                  ),
                  KategoriWidget(
                    icon_path: "assets/icons/jadwal.svg",
                    title: "Jadwal Sholat",
                    link: "/jadwal-sholat",
                  ),
                ],
              ),
            ),
            Container(
              transform: Matrix4.translationValues(0.0, -60.0, 0.0),
              child: Text("Versi Aplikasi 1.0.0"),
            ),
          ],
        ),
      )),
    );
  }
}
