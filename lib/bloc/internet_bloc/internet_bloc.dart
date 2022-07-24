import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:ecom/bloc/internet_bloc/internet_event.dart';
import 'package:ecom/bloc/internet_bloc/internet_state.dart';

class InternetBloc extends Bloc<InternetEvent,InternetState>{

  // InternetBloc(InternetState initialState) : super(initialState);
  Connectivity _connectivity = Connectivity();
  StreamSubscription? connectivitySubscription;

  InternetBloc() : super(InternetInitialState()){


    on<InternetLostEvent>((event,emit) => emit(InternetLostState()));
    on<InternetGainedEvent>((event,emit) => emit(InternetGainedState()));

    connectivitySubscription = _connectivity.onConnectivityChanged.listen((result) {
      if(result == ConnectivityResult.mobile || result == ConnectivityResult.wifi){
        add(InternetGainedEvent());
      }
      else{
        add(InternetLostEvent());
      }
    });


  }

  @override
  Future<void> close() {
    connectivitySubscription?.cancel();
    return super.close();
  }

}