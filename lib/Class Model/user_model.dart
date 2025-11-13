class UserModel {
  final int? id;
  final String firstName;
  final String lastName;
  final String emailId;
  final String userName;
  final String birthday;
  final String password;
  final String phoneNumber;
  final String securityQuestion;
  final String securityAnswer;

  // Constructor
  UserModel({
    this.id,
    required this.firstName,
    required this.lastName,
    required this.emailId,
    required this.userName,
    required this.birthday,
    required this.password,
    required this.phoneNumber,
    required this.securityQuestion,
    required this.securityAnswer,
  });
}
