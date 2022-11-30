import 'package:equatable/equatable.dart';
import '../utils/app_strings.dart';

class ServerException extends Equatable implements Exception {
  final String? message;

  const ServerException([this.message]);

  @override
  List<Object?> get props => [message];

  @override
  String toString() {
    return '$message';
  }
}

class FetchDataException extends ServerException {
  const FetchDataException([message])
      : super(AppStrings.errorDuringCommunication);
}

class BadRequestException extends ServerException {
  const BadRequestException([message]) : super(AppStrings.badRequest);
}

class UnauthorizedException extends ServerException {
  const UnauthorizedException([message]) : super(AppStrings.unauthorized);
}

class NotFoundException extends ServerException {
  const NotFoundException([message]) : super(AppStrings.requestedInfoNotFound);
}

class ConflictException extends ServerException {
  const ConflictException([message]) : super(AppStrings.conflictOccurred);
}

class InternalServerErrorException extends ServerException {
  const InternalServerErrorException([message])
      : super(AppStrings.internalServerError);
}

class NoInternetConnectionException extends ServerException {
  const NoInternetConnectionException([message])
      : super(AppStrings.noInternetConnection);
}

class CacheException implements Exception {}
