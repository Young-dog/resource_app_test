abstract class AuthExceptions implements Exception {}

class InvalidUserCredentialException extends AuthExceptions{}

class UserAlreadyAddedException extends AuthExceptions{}

class IncorrectDataException extends AuthExceptions{}

class PasswordsNotMatchException extends AuthExceptions{}
