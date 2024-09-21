part of 'person_bloc.dart';

@immutable
sealed class PersonEvent {}

class NameChanged extends PersonEvent {
  final String name;
  NameChanged(this.name);
}

class AgeChanged extends PersonEvent {
  final String age;
  AgeChanged(this.age);
}

class PhoneChanged extends PersonEvent {
  final String phone;
  PhoneChanged(this.phone);
}


class SubmitForm extends PersonEvent{}

abstract class DisplayDataEvent{}

class FetchData extends DisplayDataEvent{}
