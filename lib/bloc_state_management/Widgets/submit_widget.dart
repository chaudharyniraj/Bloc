import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:statemgmt_demo_2/bloc_state_management/Bloc/filters_state.dart';
import 'package:statemgmt_demo_2/bloc_state_management/Data/exam_data.dart';

import '../Bloc/filters_bloc.dart';
import '../Bloc/filters_event.dart';

class SubmitWidget extends StatelessWidget {
  const SubmitWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FiltersBloc, FiltersState>(builder: (context, state) {
      return FloatingActionButton(
        onPressed: () {
          BlocProvider.of<FiltersBloc>(context, listen: false)
              .add(SubmitEvent());
          if (state is SubmitState) {
            buildDialogueBox(context, state.status, state.type, state.exams);
          }
        },
        child: const Text('Submit'),
      );
    });
  }

  buildDialogueBox(context, status, type, List<ExamData> examsData) {
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
                Text(status),
                const Divider(),
                const Text(
                  'Types',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(type),
                const Divider(),
                const Text(
                  'Exam',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Column(
                  children: examsData.map((courses) {
                    if (courses.value == true) {
                      return Align(
                          alignment: Alignment.topLeft,
                          child: Text(courses.listName));
                    }
                    return Container();
                  }).toList(),
                )
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
}
