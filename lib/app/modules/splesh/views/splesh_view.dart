import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/splesh_controller.dart';

class SpleshView extends GetView<SpleshController> {
  const SpleshView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SpleshView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'SpleshView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
