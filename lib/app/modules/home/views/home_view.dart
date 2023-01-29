import 'package:alquranapp/app/widget/KategoriWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controllers/home_controller.dart';
import 'dart:ui' as ui;

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    // int endTime = DateTime.now().millisecondsSinceEpoch + ;
    return Scaffold(
      floatingActionButton: ElevatedButton(
        child: Text("test"),
        onPressed: () => controller.findJadwalSholat(),
      ),
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
                          bottom: 40,
                          left: 0,
                          right: 0,
                          child: Image.asset(
                            "assets/images/mosque.png",
                            fit: BoxFit.cover,
                            color: Color.fromARGB(255, 25, 192, 136),
                          ),
                        ),
                        Positioned(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    "ISHA",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 28,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 1),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    "Current Prayer",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        letterSpacing: 1),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Card(
                                    color: Colors.transparent,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    elevation: 1,
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 15, horizontal: 35),
                                      decoration: BoxDecoration(
                                        color: Colors.white.withOpacity(0.1),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Column(
                                        children: [
                                          Text(
                                            "Start",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500,
                                                letterSpacing: 1),
                                          ),
                                          SizedBox(
                                            height: 8,
                                          ),
                                          // CountdownTimer(
                                          //   endTime: endTime,
                                            
                                          // ),
                                          Text(
                                            "07:50",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                letterSpacing: 1),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Card(
                                    color: Colors.transparent,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    elevation: 1,
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 15, horizontal: 35),
                                      decoration: BoxDecoration(
                                        color: Colors.white.withOpacity(0.1),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Column(
                                        children: [
                                          Text(
                                            "End",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500,
                                                letterSpacing: 1),
                                          ),
                                          SizedBox(
                                            height: 8,
                                          ),
                                          Text(
                                            "07:50",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                letterSpacing: 1),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          top: 0,
                          bottom: 60,
                          left: 0,
                          right: 0,
                        ),
                        Positioned(
                          child: controller.obx(
                            (state) => Row(
                              children: [
                                Text(
                                  "ds Muharam 1444",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                  ),
                                )
                              ],
                            ),
                          ),
                          left: 10,
                          right: 10,
                          top: 10,
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
              transform: Matrix4.translationValues(0.0, -90.0, 0.0),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(35),
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
                    title: "Doa & Wirid",
                    link: "/tasbih",
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
                    title: "Bacaan Sholat",
                    link: "/tasbih",
                  ),
                  KategoriWidget(
                    icon_path: "assets/icons/asmaul_husna.svg",
                    title: "Asmaul Husna",
                    link: "/tasbih",
                  ),
                ],
              ),
            ),
            Text("Versi Aplikasi 1.0.0")
          ],
        ),
      )),
    );
  }
}
