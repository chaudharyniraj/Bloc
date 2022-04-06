import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Bloc/filters_bloc.dart';
import '../Bloc/filters_event.dart';
import '../Bloc/filters_state.dart';

class StatusWidget extends StatelessWidget {
  const StatusWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FiltersBloc, FiltersState>(builder: (context, state) {
      // if (state is StatusState) return statusList(context);
      return statusList(context);
    });
  }

  statusList(BuildContext context) {
    FiltersBloc bloc = BlocProvider.of<FiltersBloc>(context, listen: false);
    return Column(
        children: bloc.getStatusData
            .map((filter) => ListTile(
                  leading: Radio<String>(
                    groupValue: bloc.selectedStatusValue,
                    value: filter,
                    onChanged: (value) {
                      // log(bloc.selectedStatusValue);
                      BlocProvider.of<FiltersBloc>(context, listen: false)
                          .add(StatusRadioEvent(newSelectedStatus: value!));
                    },
                  ),
                  title: Text(filter),
                ))
            .toList());
    // return ListView.builder(
    //   itemCount: bloc.getStatusData.length,
    //   shrinkWrap: true,
    //   physics: const NeverScrollableScrollPhysics(),
    //   itemBuilder: (context, index) => ListTile(
    //     title: Text(bloc.getStatusData[index]),
    //     leading: Radio(
    //       value: bloc.getStatusData[index],
    //       groupValue: bloc.selectedStatusValue,
    //       onChanged: (value) {
    //         // bloc.selectedStatusValue = index + 1;
    //         log(bloc.selectedStatusValue.toString());
    //         BlocProvider.of<FiltersBloc>(context).add(StatusRadioEvent(
    //           selectedStatus: value,
    //         ));
    //       },
    //       activeColor: Colors.green,
    //     ),
    //   ),
    // );
  }
}
