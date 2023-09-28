import 'dart:async';

import 'package:api_calling/api_helper.dart';
import 'package:api_calling/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeCOntroller controller = Get.put(HomeCOntroller());
    controller.getData();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('App bar'),
          actions: [
            IconButton(
              onPressed: () {
                showMenu(
                  context: context,
                  position: RelativeRect.fromLTRB(100, 100, 0, 50),
                  items: [
                    PopupMenuItem(
                      child: TextButton(
                          onPressed: () {
                            controller.filterBasedOnName();
                            Get.back();
                          },
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("A => Z"),
                            ],
                          )),
                    ),
                    PopupMenuItem(
                      child: TextButton(
                          onPressed: () {
                            controller.filterBasedOnPrice();
                            Get.back();
                          },
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("0 => 100"),
                            ],
                          )),
                    ),
                    PopupMenuItem(
                      child: TextButton(
                          onPressed: () {
                            controller.filterBasedOnRating();
                            Get.back();
                          },
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("0⭐ => 5⭐"),
                            ],
                          )),
                    ),
                  ],
                );
              },
              icon: const Icon(Icons.filter_alt),
            ),
          ],
        ),
        body: Obx(
          () => controller.displayData == false
              ? controller.displayProgressIndicator == false
                  ? Center(
                      child: LottieBuilder.asset(
                      "assets/animations/filtering data.json",
                    ))
                  : const Center(
                      child: CircularProgressIndicator(),
                    )
              : ListView.builder(
                  itemCount: controller.data.value.data![0].productData!.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                          "${controller.data.value.data![0].productData![index].userName}"),
                      subtitle: Text(
                          "price ${controller.data.value.data![0].productData![index].minPrice}"),
                      trailing: Text(
                          "ratings ${controller.data.value.data![0].productData![index].averageRating}"),
                    );
                  },
                ),
        ),
      ),
    );
  }
}
/*
        body:Container(
            height: 100.h,
            width: 100.w,
            alignment: Alignment.center,
            child: LottieBuilder.asset("assets/animations/filtering data.json")),

 */
