import 'package:flutter/material.dart';
import 'package:statemgmt_demo_2/bloc_state_management/Widgets/exam_widget.dart';
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
          const ExamWidget()
        ],
      )),
    );
  }

  // Widget buildExamList(BuildContext context) {
  //   FiltersBloc bloc = BlocProvider.of<FiltersBloc>(context);
  //   return ListView(
  //     shrinkWrap: true,
  //     children: [
  //       buildExamCheckboxAll(bloc.getAllExamData),
  //       ...bloc.getExamData.map(buildSingleCheckbox).toList()
  //     ],
  //   );
  // }

  // Widget buildSingleCheckbox(ExamContents checkboxContents) {
  //   return CheckboxListTile(
  //     value: checkboxContents.value,
  //     controlAffinity: ListTileControlAffinity.leading,
  //     title: Text(checkboxContents.listName),
  //     onChanged: (value) {
  //       checkboxContents.value = value!;
  //       // examContentsAll.value =
  //       //     examContents.every((examContent) => examContent.value);
  //       // tempExamData.add(checkboxContents.listName);
  //       // setState(() {
  //       //   checkboxContents.value = value!;
  //       //   examContentsAll.value =
  //       //       examContents.every((examContent) => examContent.value);
  //       //   if (checkboxContents.value == true) {
  //       //     if (selectedExam.contains(checkboxContents.listName)) {
  //       //       return;
  //       //     } else {
  //       //       selectedExam.add(checkboxContents.listName);
  //       //     }
  //       //   } else if (checkboxContents.value == false) {
  //       //     selectedExam.remove(checkboxContents.listName);
  //       //   }
  //       //   // print(examContentsAll.value);
  //       //   // print(selectedExam);
  //       // });
  //     },
  //   );
  // }

  // Widget buildExamCheckboxAll(ExamContents checkboxContents) {
  //   return CheckboxListTile(
  //     value: checkboxContents.value,
  //     controlAffinity: ListTileControlAffinity.leading,
  //     title: Text(checkboxContents.listName),
  //     onChanged: toggleCheckbox,
  //   );
  // }

  // void toggleCheckbox(bool? value) {
  //   if (value == null) return;

  //   // setState(() {
  //   // examContentsAll.value = value;
  //   // selectedExam.clear();
  //   // for (var examContent in examContents) {
  //   //   examContent.value = value;
  //   //   selectedExam.add(examContent.listName);
  //   // }
  //   // if (examContentsAll.value == false) {
  //   //   selectedExam.clear();
  //   // }
  //   // });
  // }
}
