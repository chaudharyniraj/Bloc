class ExamContents {
  String listName;
  bool value;

  ExamContents({required this.listName, this.value = false});
}

final examContents = [
  // ExamContents(
  //   listName: 'All',
  // ),
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

final examContentsAll = ExamContents(
  listName: 'All',
);
