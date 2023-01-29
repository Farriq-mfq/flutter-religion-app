import 'package:alquranapp/app/layout/base_layout.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

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
      body: BaseLayout(
        size: size,
        child: Center(
          child: GestureDetector(
            onTap: () {
              controller.increment();
            },
            child: Obx(
              () => Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Terulang",style: TextStyle(fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                    SizedBox(height: 20,),
                    Text("${controller.tasbih_terulang}",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),textAlign: TextAlign.center),
                    SizedBox(height: 20,),
                    SfRadialGauge(
                      axes: <RadialAxis>[
                        RadialAxis(
                          annotations: <GaugeAnnotation>[
                            GaugeAnnotation(
                              widget: Container(
                                child: Text(
                                  "${controller.count.value}/33",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1,
                                    fontSize: 30,
                                  ),
                                ),
                              ),
                              positionFactor: 1,
                              angle: 90,
                            )
                          ],
                          maximum: 33,
                          minimum: 1,
                          showLabels: false,
                          axisLineStyle: AxisLineStyle(thickness: 20),
                          showTicks: false,
                          interval: 1,
                          pointers: <GaugePointer>[
                            NeedlePointer(value: controller.count.value.toDouble()),
                            RangePointer(
                              value: controller.count.value.toDouble(), // chane
                              width: 20,
                              enableAnimation: true,
                              color: Color.fromARGB(255, 25, 192, 136),
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

//  Text(
//                   "${controller.count.value}",
//                   style: TextStyle(fontSize: 70, fontWeight: FontWeight.bold),
//                 )
