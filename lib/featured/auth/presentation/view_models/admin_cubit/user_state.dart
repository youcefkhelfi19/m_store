part of 'user_cubit.dart';

@immutable
abstract class UserState {}

class AdminInitial extends UserState {}
class AdminFailed extends UserState {
  final String errMsg;

  AdminFailed({required this.errMsg});
}
class AdminSuccess extends UserState {
  final UserModel admin;
  AdminSuccess({required this.admin});
}
class AdminLoading extends UserState {}
