part of 'person_bloc.dart';

@immutable
class PersonState {
  final String name;
  final String age;
  final String phone;
  final bool isSubmitting;

  const PersonState(
      {required this.name,
      required this.age,
      required this.phone,
      this.isSubmitting = false});

  PersonState copyWith(
      {String? name, String? age, String? phone, bool? isSubmitting}) {
    return PersonState(
        name: name ?? this.name,
        age: age ?? this.age,
        phone: phone ?? this.phone,
        isSubmitting: isSubmitting ?? this.isSubmitting);
  }
}

class DisplayDataState {
  final List<Person> persons;
  final bool isLoading;
  final bool hasError;

  DisplayDataState(
      {required this.persons, this.isLoading = false, this.hasError = false});

  DisplayDataState copyWith(
      {List<Person>? persons, bool? isLoading, bool? hasError}) {
    return DisplayDataState(
        persons: persons ?? this.persons,
        isLoading: isLoading ?? this.isLoading,
        hasError: hasError ?? this.hasError);
  }
}
