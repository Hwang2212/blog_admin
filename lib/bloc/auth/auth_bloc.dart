import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../services/src/shared_preferences.dart';

// Bloc handles logic

part 'auth_event.dart'; // Functions and Events
part 'auth_state.dart'; // Store datas

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SharedPreferencesService sharedPreferences;
  AuthBloc(this.sharedPreferences) : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      if (event is Login) {
        if (event.userName.isEmpty ||
            event.password.isEmpty ||
            (event.userName != "admin" && event.password != "admin")) {
          emit(AuthError());
        } else {
          emit(AuthLoading());
          await Future.delayed(const Duration(seconds: 3), () async {
            await sharedPreferences.setLogIn();
            emit(AuthLoaded(event.userName));
          });
        }
      }
    });
  }
}
