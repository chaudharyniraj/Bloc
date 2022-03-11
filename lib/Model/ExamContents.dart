class ExamContents {
  String listName;
  bool value;

  ExamContents({required this.listName, this.value = false});

  // every(Function(dynamic examContent) param0) {}

  // bool every(Function(dynamic examContents) param0) {}
}

List<ExamContents> examContents = [
  ExamContents(
    listName: 'All',
  ),
  ExamContents(
    listName: 'Effective client communication level 1 - Section A',
  ),
  ExamContents(
    listName: 'Data Structure and Algorithm - DSA - Section A',
  ),
  ExamContents(
    listName: 'FM Proctoring Exam - Section A',
  ),
];

ExamContents examContentsAll = ExamContents(
  listName: 'All',
);
