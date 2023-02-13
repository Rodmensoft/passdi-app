
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './controllers/score_controller.dart';

export './bindings/score_binding.dart';


class ScorePage extends StatelessWidget {
  const ScorePage ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ScoreController controller =  Get.find<ScoreController>();
    
    return Scaffold(
        body: SafeArea(
        child:  Column(
          children: const <Widget>[
            Text('Score Page'),
          ],
        ),
      ),
    );
  }
}
  