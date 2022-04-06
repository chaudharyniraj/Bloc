import 'package:bloc/bloc.dart';
import 'package:statemgmt_demo_2/bloc_state_management/Data/data.dart';

import 'filters_event.dart';
import 'filters_state.dart';

class FiltersBloc extends Bloc<FiltersEvent, FiltersState> {
  // int selectedValue = 1;
  String selectedStatus = 'All';
  String selectedType = 'All';
  Data data = Data();
  FiltersBloc()
      : super(FiltersInitial(selectedStatus: 'All', selectedTypes: 'All')) {
    on<StatusRadioEvent>((event, emit) {
      selectedStatus = event.newSelectedStatus;
      emit(RadioState(
        changedStatus: event.newSelectedStatus,
      ));
    });
    on<TypesRadioEvent>((event, emit) {
      selectedType = event.newSelectedType;
      emit(RadioState(
        changedStatus: event.newSelectedType,
      ));
    });
  }

  List<String> get getStatusData {
    return data.statusData;
  }

  List<String> get getTypeData {
    return data.typeData;
  }

  get selectedStatusValue {
    return selectedStatus;
  }

  get selectedTypeValue {
    return selectedType;
  }
}
