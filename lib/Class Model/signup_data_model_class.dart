class SignUpDataModel{

  // Signup first screen
  String fullName;
  String emailAddress;
  String username;


  // Signup second screen
  String birthday;
  String password;
  String phoneNumber;
  String securityQuestion;
  String securityAnswer;

  // Constructor
  SignUpDataModel({
    required this.fullName,
    required this.emailAddress,
    required this.username,
    required this.birthday,
    required this.password,
    required this.phoneNumber,
    required this.securityQuestion,
    required this.securityAnswer,

  });

}