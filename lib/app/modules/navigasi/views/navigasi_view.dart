import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/navigasi_controller.dart';

class NavigasiView extends GetView<NavigasiController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NavigasiView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'NavigasiView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
