import 'package:bloc/bloc.dart';
import 'package:statemgmt_demo_2/bloc_state_management/Data/data.dart';

import '../Data/exam_data.dart';
import 'filters_event.dart';
import 'filters_state.dart';

class FiltersBloc extends Bloc<FiltersEvent, FiltersState> {
  String selectedStatus = 'All';
  List selectedExam = [];
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

    on<ExamsCheckbox>((event, emit) {
      for (var eData in getExamData) {
        if (eData.listName == event.newSelectedExam) {
          eData.value = event.newSelectedValue;
        } else if (event.newSelectedExam == 'All') {
          for (var e in getExamData) {
            e.value = event.newSelectedValue;
          }
        }
        for (int i = 1; i < getExamData.length; i++) {
          if (getExamData[i].value == false) {
            getExamData[0].value = false;
            break;
          } else if (getExamData[i].value == true) {
            getExamData[0].value = true;
          }
        }
        emit(ExamCheckboxFiltersState(
            changedExam: eData.listName, changedExamValue: eData.value));
      }
    });
    on<SubmitEvent>((event, emit) {
      emit(SubmitState(
          status: selectedStatus, type: selectedType, exams: getExamData));
    });
  }

  List<String> get getStatusData {
    return data.statusData;
  }

  List<String> get getTypeData {
    return data.typeData;
  }

  List<ExamData> get getExamData {
    return examData;
  }

  get selectedStatusValue {
    return selectedStatus;
  }

  get selectedTypeValue {
    return selectedType;
  }
}
