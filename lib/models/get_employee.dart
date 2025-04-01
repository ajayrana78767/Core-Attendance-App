import 'dart:ffi';

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
