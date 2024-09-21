import 'package:bloc/bloc.dart';
import 'package:frontend/bloc/person_bloc.dart';

import 'package:frontend/services/api.dart';
import 'package:frontend/models/model.dart';

class DisplayDataBloc extends Bloc<DisplayDataEvent, DisplayDataState> {
  DisplayDataBloc() : super(DisplayDataState(persons: [])) {
    on<FetchData>((event, emit) async {
      emit(state.copyWith(isLoading: true));
      try {
        List<Person> persons = await Api.getPerson();
        emit(state.copyWith(persons: persons, isLoading: false));
      } catch (e) {
        emit(state.copyWith(hasError: true, isLoading: false));
      }
    });
  }
}
