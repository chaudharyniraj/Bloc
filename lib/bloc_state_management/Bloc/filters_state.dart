import 'package:statemgmt_demo_2/bloc_state_management/Data/exam_data.dart';

abstract class FiltersState {}

class FiltersInitial extends FiltersState {
  final String selectedStatus;
  final String selectedTypes;

  FiltersInitial({required this.selectedStatus, required this.selectedTypes});
}

class RadioState extends FiltersState {
  final String changedStatus;
  RadioState({
    required this.changedStatus,
  });
}

class ExamCheckboxFiltersState extends FiltersState {
  final String changedExam;
  final bool changedExamValue;
  ExamCheckboxFiltersState(
      {required this.changedExam, required this.changedExamValue});
}

class SubmitState extends FiltersState {
  final String status;
  final String type;
  final List<ExamData> exams;

  SubmitState({required this.status, required this.type, required this.exams});
}
