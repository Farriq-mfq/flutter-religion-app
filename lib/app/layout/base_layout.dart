import 'package:alquranapp/app/controllers/base_controller_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class BaseLayout extends StatelessWidget {
  final Size size;
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final Widget? panelContent;
  const BaseLayout(
      {super.key,
      required this.size,
      required this.child,
      this.padding,
      this.panelContent});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BaseControllerController());
    return Stack(
      children: [
        Container(
          width: size.width,
          height: size.height,
          margin: const EdgeInsets.only(top: 10),
          padding: padding == null
              ? const EdgeInsets.only(
                  top: 30,
                  bottom: 10,
                  left: 20,
                  right: 20,
                )
              : padding,
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            boxShadow: [
              BoxShadow(
                offset: Offset(0, -3),
                color: Colors.black.withOpacity(0.05),
                spreadRadius: 3,
                blurRadius: 7,
              )
            ],
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(60),
            ),
          ),
          child: child,
        ),
        Obx(
          () => controller.showPanel.value
              ? SlidingUpPanel(
                  backdropColor: Colors.black.withOpacity(0.1),
                  backdropEnabled: true,
                  isDraggable: true,
                  defaultPanelState: PanelState.OPEN,
                  backdropTapClosesPanel: true,
                  onPanelClosed: () {
                    controller.setShowPanel();
                  },
                  borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                  panel: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: panelContent!=null ? panelContent : SizedBox.shrink(),
                  ),
                )
              : SizedBox.shrink(),
        )
      ],
    );
  }
}
