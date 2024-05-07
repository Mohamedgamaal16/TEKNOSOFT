part of 'profile_cubit.dart';

abstract class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class ProfileIsLoading extends ProfileState {}

final class ProfileLoadedSuccessfully extends ProfileState {}

final class SetGender extends ProfileState {}
