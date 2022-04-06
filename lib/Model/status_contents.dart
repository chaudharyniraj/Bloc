class StatusContents {
  String listName;

  StatusContents({
    required this.listName,
  });
}

List<StatusContents> statusContents = [
  StatusContents(
    listName: 'All',
  ),
  StatusContents(
    listName: 'Submitted',
  ),
  StatusContents(
    listName: 'Not Submitted',
  ),
  StatusContents(
    listName: 'Over Due',
  ),
  StatusContents(
    listName: 'Graded',
  ),
  StatusContents(
    listName: 'Checked',
  ),
  StatusContents(
    listName: 'Returned',
  ),
  StatusContents(
    listName: 'Re-Submitted',
  ),
  StatusContents(
    listName: 'Late Submitted',
  ),
];
