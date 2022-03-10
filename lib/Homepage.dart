import 'package:flutter/material.dart';
import 'package:statemgmt_demo_2/Model/ExamContents.dart';
import 'package:statemgmt_demo_2/Model/StatusContents.dart';
import 'package:statemgmt_demo_2/Model/TypeContents.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int val = -1;
  // bool ischecked = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _isChecked = List<bool>.filled(examContents.length, false);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Assignment'),
        backgroundColor: Colors.green,
      ),
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
            buildStatusList(),
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
            buildTypeList(),
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
            // buildExamListAll(),
            buildExamList(),
          ],
        ),
      ),
    );
  }

  Widget buildStatusList() {
    return ListView.builder(
      itemCount: statusContents.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      // scrollDirection: Axis.vertical,
      itemBuilder: (context, index) => ListTile(
        title: Text(statusContents[index].listName),
        leading: Radio(
          value: index + 1,
          groupValue: val,
          onChanged: (value) {
            setState(() {
              // print(index + 1);
              val = index + 1;
            });
          },
          activeColor: Colors.green,
        ),
      ),
    );
  }

  Widget buildTypeList() {
    return ListView.builder(
      itemCount: typeContents.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      // scrollDirection: Axis.vertical,
      itemBuilder: (context, index) => ListTile(
        title: Text(typeContents[index].listName),
        leading: Radio(
          value: index + 1,
          groupValue: val,
          onChanged: (value) {
            setState(() {
              // print(index + 1);
              val = index + 1;
            });
          },
          activeColor: Colors.green,
        ),
      ),
    );
  }

  Widget buildExamList() {
    return ListView(
      shrinkWrap: true,
      children: [
        buildExamCheckboxAll(examContentsAll),
        ...examContents.map(buildSingleCheckbox).toList()
      ],
    );
  }

  Widget buildSingleCheckbox(ExamContents examContents) {
    return CheckboxListTile(
      value: examContents.value,
      controlAffinity: ListTileControlAffinity.leading,
      title: Text(examContents.listName),
      onChanged: (value) {
        setState(() {
          examContents.value = value!;
          if (!value) {
            examContentsAll.value = false;
          } else {
            examContentsAll.value =
                examContents.every((examContent) => examContent.value);
          }
          // examContentsAll.value =
          //     examContents.every((examContent) => examContent.value);
        });
      },
    );
  }

  Widget buildExamCheckboxAll(ExamContents examContentsAll) {
    return CheckboxListTile(
      value: examContentsAll.value,
      controlAffinity: ListTileControlAffinity.leading,
      title: Text(examContentsAll.listName),
      onChanged: toggleCheckbox,
    );
  }

  void toggleCheckbox(bool? value) {
    if (value == null) return;

    setState(() {
      examContentsAll.value = value;
      examContents.forEach((examContent) => examContent.value = value);
    });
  }
}
