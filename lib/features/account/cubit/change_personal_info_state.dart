part of 'change_personal_info_cubit.dart';

@immutable
sealed class ChangePersonalInfoState {}

final class ChangePersonalInfoInitial extends ChangePersonalInfoState {}

final class GetUserInfoState extends ChangePersonalInfoState {}

final class ValidationChangedState extends ChangePersonalInfoState {}

final class ChangeUserInfoSuccessState extends ChangePersonalInfoState {}
