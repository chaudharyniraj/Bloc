import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:statemgmt_demo_2/bloc_state_management/Bloc/filters_bloc.dart';
import 'package:statemgmt_demo_2/bloc_state_management/Bloc/filters_event.dart';
import 'package:statemgmt_demo_2/bloc_state_management/Bloc/filters_state.dart';

class ExamWidget extends StatelessWidget {
  const ExamWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FiltersBloc, FiltersState>(builder: ((context, state) {
      return examList(context);
    }));
  }

  examList(BuildContext context) {
    FiltersBloc bloc = BlocProvider.of<FiltersBloc>(context, listen: false);
    return ListView(
      shrinkWrap: true,
      children: [
        // buildExamCheckboxAll(context, bloc.getAllExamData),
        ...bloc.getExamData
            .map((examDatas) => CheckboxListTile(
                  value: examDatas.value,
                  controlAffinity: ListTileControlAffinity.leading,
                  title: Text(examDatas.listName),
                  onChanged: (value) {
                    // checkboxData.value = value!;
                    // log(value.toString());
                    BlocProvider.of<FiltersBloc>(context, listen: false).add(
                        ExamsCheckbox(
                            newSelectedExam: examDatas.listName,
                            newSelectedValue: value!));
                  },
                ))
            .toList()
      ],
    );
  }

  // Widget buildExamCheckboxAll(BuildContext context, checkboxData) {
  //   return CheckboxListTile(
  //     value: checkboxData.value,
  //     controlAffinity: ListTileControlAffinity.leading,
  //     title: Text(checkboxData.listName),
  //     onChanged: (value) {
  //       if (value == null) return;
  //       BlocProvider.of<FiltersBloc>(context, listen: false).add(ExamsCheckbox(
  //           newSelectedExam: checkboxData, newSelectedValue: value));
  //     },
  //   );
  // }
}
