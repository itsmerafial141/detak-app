// ignore_for_file: avoid_print, unrelated_type_equality_checks, unnecessary_null_comparison

import 'dart:async';
import 'dart:developer';

import 'package:detakapp/app/modules/kusioner/models/kuisoner_model.dart';
import 'package:detakapp/app/modules/kusioner/providers/kuisoner_provider.dart';
import 'package:detakapp/app/modules/kusioner/views/hasil_view.dart';
import 'package:detakapp/app/modules/profile/providers/hasil_test_provider.dart';
import 'package:detakapp/app/widgets/custom_divider_widget.dart';
import 'package:detakapp/app/widgets/custom_loading_dialog_widget.dart';
import 'package:detakapp/app/widgets/custom_text_widget.dart';
import 'package:detakapp/core/theme/colors.dart';
import 'package:detakapp/core/theme/fonts.dart';
import 'package:detakapp/core/utils/extensions/custom_exstension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../models/answer_model.dart';

class KusionerController extends GetxController with StateMixin {
  var hasilTestProvider = Get.put(HasilTestProvider());
  var kuisonerProvider = Get.put(KuisonerProvider());
  late KuisonerModel kuisonerModel;
  late AnswerModel answerModel;
  late List<String> listAnswer;
  var indexKusioner = 0.obs;

  var umur = 0.obs;

  late Timer? timer;
  late TextEditingController umurController;

  @override
  void onInit() {
    super.onInit();
    listAnswer = [];
    umurController = TextEditingController();
    umurController.text = "0";
    _initializeKusionerListData();
  }

  @override
  void dispose() {
    super.dispose();
    listAnswer.clear();
    umurController.dispose();
  }

  void increment() {
    if (umur < 150) {
      umur++;
      umurController.text = umur.value.toString();
      change(null, status: RxStatus.success());
    }
  }

  void autoIncrement() {
    timer = Timer.periodic(
      const Duration(milliseconds: 100),
      (t) {
        if (umur < 150) {
          umur++;
          umurController.text = umur.value.toString();
          change(null, status: RxStatus.success());
        }
      },
    );
  }

  void autoDecrement() {
    timer = Timer.periodic(
      const Duration(milliseconds: 100),
      (t) {
        if (umur > 0) {
          umur--;
          umurController.text = umur.value.toString();
          change(null, status: RxStatus.success());
        }
      },
    );
  }

  void onTapOut() {
    timer!.cancel();
    change(null, status: RxStatus.success());
  }

  void decrement() {
    if (umur > 0) {
      umur--;
      umurController.text = umur.value.toString();
      change(null, status: RxStatus.success());
    }
  }

  void _initializeKusionerListData() {
    try {
      kuisonerProvider.getKuisonerList().then((value) {
        kuisonerModel = KuisonerModel(
          status: value.status,
          data: value.data,
        );
        log("Get Kusioner success!");
        change(null, status: RxStatus.success());
      }).onError((error, stackTrace) {
        log("Get Kusioner onError!");
        change(null, status: RxStatus.error(error.toString()));
      }).whenComplete(() {
        log("Get Kusioner onError!");
      });
    } catch (err) {
      err.printError();
    }
  }

  void previousPageKusioner() {
    if (indexKusioner != 0) {
      indexKusioner -= 1;
      print(indexKusioner);
    } else {
      Get.back();
    }
    update();
  }

  void nextPageKusioner(BuildContext context) {
    if (indexKusioner < kuisonerModel.data.length - 1) {
      if (listAnswer.length < indexKusioner.value + 1) {
        _showDialogDataNotNull(context);
      } else {
        indexKusioner += 1;
        update();
      }
    }
  }

  void submitUmur(String umur, BuildContext context) {
    if (umur != null && umur.isNotEmpty && umur != "" && umur != "0") {
      indexKusioner += 1;
      if (listAnswer.isNotEmpty) {
        listAnswer.removeAt(0);
      }
      listAnswer.insert(0, umur);
      update();
    } else {
      _showDialogDataNotNull(context);
    }
  }

  void _showDialogDataNotNull(BuildContext context) {
    Get.dialog(
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Wrap(
            children: [
              Material(
                  child: Column(
                children: [
                  CustomText(
                    "Data harus diisi!",
                    style: CustomFonts.montserratBold16,
                  ),
                  CustomDivider(
                    height: MediaQuery.of(context).size.height * .04,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .5,
                    height: MediaQuery.of(context).size.height * .05,
                    child: Align(
                      alignment: Alignment.center,
                      child: CustomText(
                        "OK",
                        style: CustomFonts.montserratBold16,
                        color: CustomColors.white,
                      ),
                    ),
                  ).borderRadius(all: 10).button(
                      onPressed: () {
                        Get.back();
                      },
                      size: Size(MediaQuery.of(context).size.width * .5,
                          MediaQuery.of(context).size.height * .01),
                      backgroundColor: CustomColors.primaryColor)
                ],
              ).margin(all: MediaQuery.of(context).size.height * .04)),
            ],
          ).borderRadius(all: 10)
        ],
      ),
    );
  }

  void submitAnswer({
    required String answer,
    required int index,
    required BuildContext context,
  }) {
    if (indexKusioner < kuisonerModel.data.length - 1) {
      indexKusioner += 1;
      if (listAnswer.length == kuisonerModel.data.length) {
        listAnswer.removeAt(index);
      }
      listAnswer.insert(index, answer);
      update();
    } else {
      if (listAnswer.length == kuisonerModel.data.length) {
        listAnswer.removeAt(index);
      }
      listAnswer.insert(index, answer);
      print(listAnswer);
      Get.dialog(
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Wrap(
              children: [
                Material(
                    child: Column(
                  children: [
                    CustomText(
                      "Apakah anda sudah yakin dengan jawabannya?",
                      style: CustomFonts.montserratBold16,
                    ),
                    CustomDivider(
                      height: MediaQuery.of(context).size.height * .04,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * .3,
                          height: MediaQuery.of(context).size.height * .07,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              width: 1,
                              color: CustomColors.primaryColor,
                            ),
                          ),
                          child: CustomText(
                            "Belum",
                            style: CustomFonts.montserratBold16,
                            color: CustomColors.primaryColor,
                          ),
                        ).borderRadius(all: 10).button(
                            onPressed: () {
                              Get.back();
                            },
                            size: Size(MediaQuery.of(context).size.width * .3,
                                MediaQuery.of(context).size.height * .01),
                            backgroundColor: Colors.white),
                        CustomDivider(
                          width: MediaQuery.of(context).size.height * .02,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * .3,
                          height: MediaQuery.of(context).size.height * .07,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                width: 1,
                                color: CustomColors.primaryColor,
                              ),
                              color: CustomColors.primaryColor),
                          child: CustomText(
                            "Yakin",
                            style: CustomFonts.montserratBold16,
                            color: CustomColors.white,
                          ),
                        ).borderRadius(all: 10).button(
                            onPressed: () {
                              _postAnswer(context);
                            },
                            size: Size(MediaQuery.of(context).size.width * .3,
                                MediaQuery.of(context).size.height * .01),
                            backgroundColor: CustomColors.white),
                      ],
                    ),
                  ],
                ).margin(all: MediaQuery.of(context).size.height * .04)),
              ],
            ).borderRadius(all: 10),
          ],
        ).margin(horizontal: MediaQuery.of(context).size.height * .03),
      );
    }
  }

  void _postAnswer(BuildContext context) {
    CustomLoadingDialog.customLoadingDialog(context);
    try {
      kuisonerProvider
          .answer(
        answer: listAnswer,
        email: GetStorage().read("dataUser")["EMAIL"],
      )
          .then((value) {
        log("Post Answer Success!");
        answerModel = AnswerModel(
          status: value.status,
          data: value.data,
        );
        Get.back();
        Get.off(HasilView());
      }).onError((error, stackTrace) {
        log("Post Answer onError!");
        print(error);
      }).whenComplete(() {
        log("Post Answer Complete");
      });
    } catch (err) {
      err.printError();
    }
  }
}
