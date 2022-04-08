// ignore_for_file: must_be_immutable

import 'package:meta/meta.dart';

@immutable
abstract class FiltersEvent {}

class StatusRadioEvent extends FiltersEvent {
  String newSelectedStatus;
  StatusRadioEvent({required this.newSelectedStatus});
}

class TypesRadioEvent extends FiltersEvent {
  String newSelectedType;
  TypesRadioEvent({required this.newSelectedType});
}

class ExamsCheckbox extends FiltersEvent {
  String newSelectedExam;
  bool newSelectedValue;
  ExamsCheckbox(
      {required this.newSelectedExam, required this.newSelectedValue});
}

class SubmitEvent extends FiltersEvent {}
