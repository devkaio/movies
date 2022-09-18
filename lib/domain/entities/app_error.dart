import 'package:equatable/equatable.dart';

class AppError extends Equatable {
  final AppErrorType errorType;
  const AppError(
    this.errorType,
  );

  @override
  List<Object?> get props => [errorType];
}

enum AppErrorType { api, network }
