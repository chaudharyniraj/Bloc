import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:statemgmt_demo_2/bloc_state_management/Bloc/filters_event.dart';

import '../Bloc/filters_bloc.dart';
import '../Bloc/filters_state.dart';

class TypeWidget extends StatelessWidget {
  const TypeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FiltersBloc, FiltersState>(builder: (context, state) {
      // if (state is StatusState) return statusList(context);
      return typeList(context);
    });
  }

  typeList(BuildContext context) {
    FiltersBloc bloc = BlocProvider.of<FiltersBloc>(context);
    return Column(
        children: bloc.getTypeData
            .map((filter) => ListTile(
                  leading: Radio<String>(
                    groupValue: bloc.selectedType,
                    value: filter,
                    onChanged: (value) {
                      // log(bloc.selectedStatusValue);
                      BlocProvider.of<FiltersBloc>(context, listen: false)
                          .add(TypesRadioEvent(newSelectedType: value!));
                    },
                  ),
                  title: Text(filter),
                ))
            .toList());
  }
}
