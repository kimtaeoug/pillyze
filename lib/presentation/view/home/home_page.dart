import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pillyze/app/config/colors.dart';
import 'package:pillyze/presentation/controllers/data_controller.dart';
import 'package:pillyze/presentation/view/home/widgets/home_graph.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  DataController controller = Get.find();

  @override
  void initState() {
    controller.requestData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PColors.white,
      body: Center(
        child: Obx(() {
          if (controller.loading) {
            return const CircularProgressIndicator();
          } else {
            return SizedBox(
              width: Get.width,
              height: 377 * Get.width / 375,
              child: Padding(
                padding: const EdgeInsets.only(right: 20),
                child: HomeGraph(
                  minTarget: 90,
                  maxTarget: 140,
                  minValueY: controller.minValueY,
                  maxValueY: controller.maxValueY,
                  data: controller.data,
                ),
              ),
            );
          }
        }),
      ),
    );
  }
}
