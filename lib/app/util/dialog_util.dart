import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pillyze/app/config/colors.dart';
import 'package:pillyze/app/config/text_style.dart';
import 'package:pillyze/app/routes/routes.dart';

class DialogUtil{
  static void show(){
    Get.dialog(
      AlertDialog(
        contentPadding: const EdgeInsets.only(left: 24),
        actionsAlignment: MainAxisAlignment.spaceBetween,
        title: Text('Error', style: Styler.style(fontSize: 16,color: PColors.skin),),
        content: Text('에러가 발생했습니다.', style: Styler.style(color: PColors.black, fontSize: 14),),
        actions: [
          InkWell(
            onTap: () => Get.back(),
            child: Text('취소', style: Styler.style(color: PColors.black),),
          ),
          InkWell(
            onTap: (){
              Get.offNamed(Routes.LOADING);
            },
            child: Text('재시도하기', style: Styler.style(color: PColors.black),),
          ),
        ],
      )
    );
  }
}