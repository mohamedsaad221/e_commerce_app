abstract class LoginStates {}

class InitialState extends LoginStates {}

class LoginLoadingState extends LoginStates {}

class LoginSuccessState extends LoginStates {
  final uId;

  LoginSuccessState(this.uId);
}

class LoginErrorState extends LoginStates {
  final error;

  LoginErrorState(this.error);
}

class LoginPasswordVisibility extends LoginStates {}


class LoginWithFaceBookLoadingState extends LoginStates {}

class LoginWithFaceBookSuccessState extends LoginStates {
}

class LoginWithFaceBookErrorState extends LoginStates {
  final error;

  LoginWithFaceBookErrorState(this.error);
}