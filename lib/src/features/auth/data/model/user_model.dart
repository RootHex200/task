class UserModel {
  bool? status;
  String? message;
  String? token;
  int? id;
  Data? data;

  UserModel({this.status, this.message, this.token, this.id, this.data});

  UserModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    token = json['token'];
    id = json['id'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    data['token'] = token;
    data['id'] = id;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? name;
  String? userType;
  String? cardNo;
  String? email;
  String? password;
  String? mobile;
  String? type;
  String? joiningDate;
  String? inactiveDate;
  String? bankAccount;
  String? bloodGroup;
  String? dateOfBirth;
  String? presentAddress;
  String? emergencyContact;
  int? gradeId;
  int? designationId;
  int? departmentId;
  int? companyLocationId;
  int? departmentHead;
  int? approvedBy;
  String? status;
  String? updatedAt;

  Data(
      {this.id,
      this.name,
      this.userType,
      this.cardNo,
      this.email,
      this.password,
      this.mobile,
      this.type,
      this.joiningDate,
      this.inactiveDate,
      this.bankAccount,
      this.bloodGroup,
      this.dateOfBirth,
      this.presentAddress,
      this.emergencyContact,
      this.gradeId,
      this.designationId,
      this.departmentId,
      this.companyLocationId,
      this.departmentHead,
      this.approvedBy,
      this.status,
      this.updatedAt,
});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    userType = json['user_type'];
    cardNo = json['card_no'];
    email = json['email'];
    password = json['password'];
    mobile = json['mobile'];
    type = json['type'];
    joiningDate = json['joining_date'];
    inactiveDate = json['inactive_date'];
    bankAccount = json['bank_account'];
    bloodGroup = json['blood_group'];
    dateOfBirth = json['date_of_birth'];
    presentAddress = json['present_address'];
    emergencyContact = json['emergency_contact'];
    gradeId = json['grade_id'];
    designationId = json['designation_id'];
    departmentId = json['department_id'];
    companyLocationId = json['company_location_id'];
    departmentHead = json['department_head'];
    approvedBy = json['approved_by'];
    status = json['status'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['user_type'] = userType;
    data['card_no'] = cardNo;
    data['email'] = email;
    data['password'] = password;
    data['mobile'] = mobile;
    data['type'] = type;
    data['joining_date'] = joiningDate;
    data['inactive_date'] = inactiveDate;
    data['bank_account'] = bankAccount;
    data['blood_group'] = bloodGroup;
    data['date_of_birth'] = dateOfBirth;
    data['present_address'] = presentAddress;
    data['emergency_contact'] = emergencyContact;
    data['grade_id'] = gradeId;
    data['designation_id'] = designationId;
    data['department_id'] = departmentId;
    data['company_location_id'] = companyLocationId;
    data['department_head'] = departmentHead;
    data['approved_by'] = approvedBy;
    data['status'] = status;
    data['updated_at'] = updatedAt;
    return data;
  }
}
