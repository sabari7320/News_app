import 'package:equatable/equatable.dart';

// abstract class Failure extends Equatable {
//   final String message;
//   const Failure(this.message);

//   @override
//   List<Object?> get props => [message];
// }

class Failure extends Equatable {
  final String message;
  const Failure([this.message = "Un expected Error Occured"]);

  @override
  List<Object?> get props => [message];
}

// class CommonFailure extends Failure {
//   const CommonFailure(super.message, {required this.message});
// }

// class InvalidcredentialsFailure extends Failure {
//   const InvalidcredentialsFailure() : super("'Invalid email or password.'");
// }

// class CacheFailure extends Failure {
//   const CacheFailure(super.message);
// }

// class EmailinuseFailure extends Failure {
//   const EmailinuseFailure() : super("Email is already in use.");
// }

// class UsernotfoundFailure extends Failure {
//   const UsernotfoundFailure(super.message);
// }
