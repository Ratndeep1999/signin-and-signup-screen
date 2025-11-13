class UserModel {
  /// Parameters
  final int? id;
  final String fullName;
  final String emailId;
  final String userName;
  final String birthday;
  final String password;
  final String phoneNumber;
  final String securityQuestion;
  final String securityAnswer;

  /// Constructor
  UserModel({
    this.id,
    required this.fullName,
    required this.emailId,
    required this.userName,
    required this.birthday,
    required this.password,
    required this.phoneNumber,
    required this.securityQuestion,
    required this.securityAnswer,
  });

  /// Method to convert object to map (use to inserting data)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'fullName': fullName,
      'emailId': emailId,
      'userName': userName,
      'birthday': birthday,
      'password': password,
      'phoneNumber': phoneNumber,
      'securityQuestion': securityQuestion,
      'securityAnswer': securityAnswer,
    };
  }

  /// Method to convert map to object (use to read data)
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      fullName: map['fullName'],
      emailId: map['emailId'],
      userName: map['userName'],
      birthday: map['birthday'],
      password: map['password'],
      phoneNumber: map['phoneNumber'],
      securityQuestion: map['securityQuestion'],
      securityAnswer: map['securityAnswer'],
    );
  }
}
