import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:frontend/models/model.dart';
import 'package:frontend/services/api.dart';


part 'person_event.dart';
part 'person_state.dart';

class PersonBloc extends Bloc<PersonEvent, PersonState> {
  PersonBloc() : super(const PersonState(name: '', age: '', phone: '')){ on<NameChanged>((event, emit) {
      emit(state.copyWith(name: event.name));
    });
    
   
    on<AgeChanged>((event, emit) {
      emit(state.copyWith(age: event.age));
    });
    
    on<PhoneChanged>((event, emit) {
      emit(state.copyWith(phone: event.phone));
    });
    
    on<SubmitForm>((event, emit) async {
      emit(state.copyWith(isSubmitting: true));
      var jsondata = {
        'name': state.name,
        'phone': state.phone,
        'age': state.age,
      };
      await Api.addPerson(jsondata);
      emit(state.copyWith(isSubmitting: false));
    });
  } 
    
    }



