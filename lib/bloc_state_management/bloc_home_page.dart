import 'package:flutter/material.dart';
import 'package:statemgmt_demo_2/bloc_state_management/Widgets/exam_widget.dart';
import 'package:statemgmt_demo_2/bloc_state_management/Widgets/submit_widget.dart';
import 'package:statemgmt_demo_2/bloc_state_management/Widgets/type_widget.dart';

import 'Widgets/status_widget.dart';

class BlocHomepage extends StatelessWidget {
  const BlocHomepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(title: const Text('Assignments')),
      body: SingleChildScrollView(
          child: Column(
        children: <Widget>[
          Container(
            width: width,
            height: height * 0.05,
            color: Colors.black12,
            child: const Text(
              'Status',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const StatusWidget(),
          Container(
            width: width,
            height: height * 0.05,
            color: Colors.black12,
            child: const Text(
              'Types',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const TypeWidget(),
          Container(
            width: width,
            height: height * 0.05,
            color: Colors.black12,
            child: const Text(
              'Exam',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const ExamWidget(),
        ],
      )),
      // bottomNavigationBar: const SubmitWidget(),
      floatingActionButton: const SubmitWidget(),
    );
  }
}
