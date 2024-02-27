abstract class LoginEvent{}

class LoggedInEvent extends LoginEvent{
  final String email;
  final String password;

  LoggedInEvent({required this.email, required this.password});
}



