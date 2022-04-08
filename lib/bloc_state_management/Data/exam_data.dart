class ExamData {
  String listName;
  bool value;

  ExamData({required this.listName, required this.value});
}

final examData = [
  ExamData(listName: 'All', value: false),
  ExamData(
      listName: 'Effective client communication level 1 - Section A',
      value: false),
  ExamData(
      listName: 'Data Structure and Algorithm - DSA - Section A', value: false),
  ExamData(listName: 'FM Proctoring Exam - Section A', value: false),
];

// final allExamData = ExamData(listName: 'All', value: false);
