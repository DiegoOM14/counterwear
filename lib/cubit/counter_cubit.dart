import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  void increment() {
    if (isIncrementLimitReached()) {
      showToast();
    } else {
      emit(state + 1);
    }
  }

  void decrement() {
    if (isDecrementLimitReached()) {
      showToast();
    } else {
      emit(state - 1);
    }
  }

  void reset() {
    emit(0);
  }

  bool isIncrementLimitReached() {
    return state > 9;
  }

  bool isDecrementLimitReached() {
    return state < -9;
  }

  void showToast() {
    Fluttertoast.showToast(
        msg: "Limite alcanzado",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Color.fromARGB(255, 216, 3, 3),
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
