class GetEmployee {
  bool? status;
  String? message;
  List<Employee>? data;
  GetEmployee({this.status, this.message, this.data});
  factory GetEmployee.fromJson(Map<String, dynamic> json) {
    return GetEmployee(
      status: json['status'],
      message: json['message'],
      data: json['data'] != null
          ? (json['data'] as List).map((e) => Employee.fromJson(e)).toList()
          : [],
    );
  }
 

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'data': data?.map((e) => e.toJson()).toList(),
    };
  }
}
class Employee {
  int? id;
  int? userTypeId;
  int? employeeCode;
  String? name;
  String? email;
  String? address;
  int? mobile;
  int? ppf;
  String? pan;
  int? aadhar;
  String? description;
  String? emailVerifiedAt;
  String? fcmToken;
  String? platform;
  String? createdAt;
  String? updatedAt;

  Employee({
    this.id,
    this.userTypeId,
    this.employeeCode,
    this.name,
    this.email,
    this.address,
    this.mobile,
    this.ppf,
    this.pan,
    this.aadhar,
    this.description,
    this.emailVerifiedAt,
    this.fcmToken,
    this.platform,
    this.createdAt,
    this.updatedAt,
  });

  // From JSON
  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
      id: json['id'],
      userTypeId: json['user_type_id'],
      employeeCode: json['employee_code'],
      name: json['name'],
      email: json['email'],
      address: json['address'],
      mobile: json['mobile'],
      ppf: json['ppf'],
      pan: json['pan'],
      aadhar: json['aadhar'],
      description: json['description'],
      emailVerifiedAt: json['email_verified_at'],
      fcmToken: json['fcm_token'],
      platform: json['platform'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  // To JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_type_id': userTypeId,
      'employee_code': employeeCode,
      'name': name,
      'email': email,
      'address': address,
      'mobile': mobile,
      'ppf': ppf,
      'pan': pan,
      'aadhar': aadhar,
      'description': description,
      'email_verified_at': emailVerifiedAt,
      'fcm_token': fcmToken,
      'platform': platform,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}
class LoginResponse {
  final bool success;
  final String message;
  final Data data;

  LoginResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      success: json['success'],
      message: json['message'],
      data: Data.fromJson(json['data']),
    );
  }
}

class Data {
  final String token;
  final User user;

  Data({
    required this.token,
    required this.user,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      token: json['token'],
      user: User.fromJson(json['user']),
    );
  }
}

class User {
  final int id;
  final String? userType;
  final String? name;
  final String? email;
  final String? emailVerifiedAt;
  final String phone;
  final int isVerified;
  final int isEmail;
  final String firstname;
  final String lastname;
  final String dob;
  final String address;
  final String? city;
  final String? country;
  final String? state;
  final String? pinCode;
  final String gender;
  final String otp;
  final String image;
  final int isActive;
  final String createdAt;
  final String updatedAt;

  User({
    required this.id,
    this.userType,
    this.name,
    this.email,
    this.emailVerifiedAt,
    required this.phone,
    required this.isVerified,
    required this.isEmail,
    required this.firstname,
    required this.lastname,
    required this.dob,
    required this.address,
    this.city,
    this.country,
    this.state,
    this.pinCode,
    required this.gender,
    required this.otp,
    required this.image,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      userType: json['user_type'],
      name: json['name'],
      email: json['email'],
      emailVerifiedAt: json['email_verified_at'],
      phone: json['phone'],
      isVerified: json['is_verified'],
      isEmail: json['is_email'],
      firstname: json['firstname'],
      lastname: json['lastname'],
      dob: json['dob'],
      address: json['address'],
      city: json['city'],
      country: json['country'],
      state: json['state'],
      pinCode: json['pin_code'],
      gender: json['gender'],
      otp: json['otp'],
      image: json['image'],
      isActive: json['is_active'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}
