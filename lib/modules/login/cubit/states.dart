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

class LoginWithGoogleLoadingState extends LoginStates {}

class LoginWithGoogleSuccessState extends LoginStates {
}

class LoginWithGoogleErrorState extends LoginStates {
  final error;

  LoginWithGoogleErrorState(this.error);
}

// Register

class RegisterLoadingState extends LoginStates {}

class RegisterSuccessState extends LoginStates {}

class RegisterErrorState extends LoginStates {
  final error;

  RegisterErrorState(this.error);
}

class CreateUserSuccessState extends LoginStates {
  final String uId;

  CreateUserSuccessState(this.uId);
}

class CreateUserErrorState extends LoginStates {
  final error;

  CreateUserErrorState(this.error);
}

class RegisterPasswordVisibility extends LoginStates {}