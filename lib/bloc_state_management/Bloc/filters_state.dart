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

class ExamCheckboxFilters extends FiltersState {
  final String changedExam;
  final bool changedExamValue;
  ExamCheckboxFilters(
      {required this.changedExam, required this.changedExamValue});
}

// class FiltersTypes extends FiltersState {
//   final String filterTypes;
//   FiltersTypes({
//     required this.filterTypes,
//   });
// }
