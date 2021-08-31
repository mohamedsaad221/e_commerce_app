abstract class LoginStates {}

class InitialState extends LoginStates {}

class SocialLoginLoadingState extends LoginStates {}

class SocialLoginSuccessState extends LoginStates {
  final uId;

  SocialLoginSuccessState(this.uId);
}

class SocialLoginErrorState extends LoginStates {
  final error;

  SocialLoginErrorState(this.error);
}

class SocialLoginPasswordVisibility extends LoginStates {}