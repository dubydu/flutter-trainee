import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Cubit<LoginState> {
  LoginBloc() : super(LoginInitialState());

  void onNameChanged({required String name}) {
    // Save name value into State
    // emit(LoginState(name: name, password: state.password));
    // Or
    emit(state.copyWith(name: name));
  }

  void onPasswordChanged({required String pwd}) {
    emit(state.copyWith(password: pwd));
  }
}

class LoginState {
  LoginState({
    required this.name,
    required this.password,
  });

  final String? name;
  final String? password;

  bool get inValidName {
    return ((name ?? '').length > 20);
  }

  bool get inValidPassword {
    return ((password ?? '').length > 12);
  }

  LoginState copyWith({
    final String? name,
    final String? password,
  }) {
    return LoginState(
      name: name ?? this.name,
      password: password ?? this.password,
    );
  }
}

class LoginInitialState extends LoginState {
  LoginInitialState() : super(name: null, password: null);
}