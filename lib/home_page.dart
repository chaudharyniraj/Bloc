import 'package:flutter/material.dart';
import 'package:statemgmt_demo_2/Model/exam_contents.dart';
import 'package:statemgmt_demo_2/Model/status_contents.dart';
import 'package:statemgmt_demo_2/Model/type_contents.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int val = 1;

  String selectedStatus = 'All';
  String selectedType = 'All';
  List selectedExam = [];

  @override
  void initState() {
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
            buildExamList(),
            // buildExamLists(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Text('Submit'),
        onPressed: () {
          setState(() {
            // assignExamDataToDialogueBox();
          });
          buildDialogueBox(context);
        },
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
              selectedStatus = statusContents[index].listName;
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
              val = index + 1;
              selectedType = typeContents[index].listName;
            });
          },
          activeColor: Colors.green,
        ),
      ),
    );
  }

  // Widget buildExamLists() {
  //   return ListView(
  //     shrinkWrap: true,
  //     children: [
  //       CheckboxListTile(
  //         title: Text(examContents[0].listName),
  //         controlAffinity: ListTileControlAffinity.leading,
  //         value: ischecked1,
  //         onChanged: (value) {
  //           setState(() {
  //             ischecked1 = value!;
  //             if (ischecked1 = true) {
  //               ischecked2 = true;
  //               ischecked3 = true;
  //               ischecked4 = true;
  //               // assignExamDataToDialogueBox();
  //             }
  //           });
  //         },
  //       ),
  //       CheckboxListTile(
  //         title: Text(examContents[1].listName),
  //         controlAffinity: ListTileControlAffinity.leading,
  //         value: ischecked2,
  //         onChanged: (value) {
  //           setState(() {
  //             ischecked2 = value!;
  //             if (ischecked2 == false) {
  //               ischecked1 = false;
  //             } else if (ischecked2 == true &&
  //                 ischecked3 == true &&
  //                 ischecked4 == true) {
  //               ischecked1 = true;
  //               // assignExamDataToDialogueBox();
  //             }
  //           });
  //           // assignExamDataToDialogueBox();
  //         },
  //       ),
  //       CheckboxListTile(
  //         title: Text(examContents[2].listName),
  //         controlAffinity: ListTileControlAffinity.leading,
  //         value: ischecked3,
  //         onChanged: (value) {
  //           setState(() {
  //             ischecked3 = value!;
  //             if (ischecked3 == false) {
  //               ischecked1 = false;
  //             } else if (ischecked2 == true &&
  //                 ischecked3 == true &&
  //                 ischecked4 == true) {
  //               ischecked1 = true;
  //             }
  //           });
  //           // assignExamDataToDialogueBox();
  //         },
  //       ),
  //       CheckboxListTile(
  //         title: Text(examContents[3].listName),
  //         controlAffinity: ListTileControlAffinity.leading,
  //         value: ischecked4,
  //         onChanged: (value) {
  //           setState(() {
  //             ischecked4 = value!;
  //             if (ischecked4 == false) {
  //               ischecked1 = false;
  //             } else if (ischecked2 == true &&
  //                 ischecked3 == true &&
  //                 ischecked4 == true) {
  //               ischecked1 = true;
  //             }
  //           });
  //           // assignExamDataToDialogueBox();
  //         },
  //       ),
  //     ],
  //   );
  // }

  // void assignExamDataToDialogueBox() {
  //   if (ischecked1 == true) {
  //     selectedExam1 = examContents[1].listName;
  //     selectedExam2 = examContents[2].listName;
  //     selectedExam3 = examContents[3].listName;
  //   } else if (ischecked1 == false &&
  //       ischecked2 == true &&
  //       ischecked3 == false &&
  //       ischecked4 == false) {
  //     selectedExam1 = examContents[1].listName;
  //     selectedExam2 = '';
  //     selectedExam3 = '';
  //   } else if (ischecked1 == false &&
  //       ischecked2 == false &&
  //       ischecked3 == true &&
  //       ischecked4 == false) {
  //     selectedExam1 = '';
  //     selectedExam2 = examContents[2].listName;
  //     selectedExam3 = '';
  //   } else if (ischecked1 == false &&
  //       ischecked2 == false &&
  //       ischecked3 == false &&
  //       ischecked4 == true) {
  //     selectedExam1 = '';
  //     selectedExam2 = '';
  //     selectedExam3 = examContents[3].listName;
  //   } else if (ischecked1 == false &&
  //       ischecked2 == true &&
  //       ischecked3 == true &&
  //       ischecked4 == false) {
  //     selectedExam1 = examContents[1].listName;
  //     selectedExam2 = examContents[2].listName;
  //     selectedExam3 = '';
  //   } else if (ischecked1 == false &&
  //       ischecked2 == false &&
  //       ischecked3 == true &&
  //       ischecked4 == true) {
  //     selectedExam1 = '';
  //     selectedExam2 = examContents[2].listName;
  //     selectedExam3 = examContents[3].listName;
  //   } else if (ischecked1 == false &&
  //       ischecked2 == true &&
  //       ischecked3 == false &&
  //       ischecked4 == true) {
  //     selectedExam1 = examContents[1].listName;
  //     selectedExam2 = '';
  //     selectedExam3 = examContents[3].listName;
  //   }
  // }

  Widget buildExamList() {
    return ListView(
      shrinkWrap: true,
      children: [
        buildExamCheckboxAll(examContentsAll),
        ...examContents.map(buildSingleCheckbox).toList()
      ],
    );
  }

  Widget buildSingleCheckbox(ExamContents checkboxContents) {
    return CheckboxListTile(
      value: checkboxContents.value,
      controlAffinity: ListTileControlAffinity.leading,
      title: Text(checkboxContents.listName),
      onChanged: (value) {
        // tempExamData.add(checkboxContents.listName);
        setState(() {
          checkboxContents.value = value!;
          examContentsAll.value =
              examContents.every((examContent) => examContent.value);
          if (checkboxContents.value == true) {
            if (selectedExam.contains(checkboxContents.listName)) {
              return;
            } else {
              selectedExam.add(checkboxContents.listName);
            }
          } else if (checkboxContents.value == false) {
            selectedExam.remove(checkboxContents.listName);
          }
          // print(examContentsAll.value);
          // print(selectedExam);
        });
      },
    );
  }

  Widget buildExamCheckboxAll(ExamContents checkboxContents) {
    return CheckboxListTile(
      value: checkboxContents.value,
      controlAffinity: ListTileControlAffinity.leading,
      title: Text(checkboxContents.listName),
      onChanged: toggleCheckbox,
    );
  }

  void toggleCheckbox(bool? value) {
    if (value == null) return;

    setState(() {
      examContentsAll.value = value;
      selectedExam.clear();
      for (var examContent in examContents) {
        examContent.value = value;
        selectedExam.add(examContent.listName);
      }
      if (examContentsAll.value == false) {
        selectedExam.clear();
      }
      // print(examContentsAll.value);
      // print(selectedExam);
    });
  }

  buildDialogueBox(context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Selected options'),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Status',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(selectedStatus),
                const Divider(),
                const Text(
                  'Types',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(selectedType),
                const Divider(),
                const Text(
                  'Exam',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                buildExamDialogueBoxList()
              ],
            ),
            actions: <Widget>[
              MaterialButton(
                child: const Text('ok'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  buildExamDialogueBoxList() {
    if (selectedExam.isEmpty) {
      return const Text('Not Selected');
    } else {
      return Expanded(
        child: SizedBox(
          height: 200,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
            // scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: selectedExam.length,
            itemBuilder: (context, index) {
              return Text(selectedExam[index]);
            },
          ),
        ),
      );
    }
  }
}
