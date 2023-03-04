// class LoginResponse {
//   String? token;

//   LoginResponse({required this.token});

//   LoginResponse.fromJson(Map<String, dynamic> json) {
//     token = json['token'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['token'] = this.token;
//     return data;
//   }
// }

class LoginResponse {
  int? status;
  Data? data;
  List<Null>? params;
  String? message;
  Null? errors;
  List<User>? dataa;

  LoginResponse(
      {this.status, this.data, this.params, this.message, this.errors});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    if (json['params'] != null) {
      params = <Null>[];
      json['params'].forEach((v) {
        params!.add((v));
      });
    }
    message = json['message'];
    errors = json['errors'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    if (this.params != null) {
      data['params'] = this.params!.map((v) => toJson()).toList();
    }
    data['message'] = this.message;
    data['errors'] = this.errors;
    return data;
  }
}

class Data {
  String? lastUpdate;
  String? validUntil;
  User? user;
  Role? role;
  String? roleCode;
  String? token;

  Data(
      {this.lastUpdate,
      this.validUntil,
      this.user,
      this.role,
      this.roleCode,
      this.token});

  Data.fromJson(Map<String, dynamic> json) {
    lastUpdate = json['lastUpdate'];
    validUntil = json['validUntil'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    role = json['role'] != null ? new Role.fromJson(json['role']) : null;
    roleCode = json['role_code'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lastUpdate'] = this.lastUpdate;
    data['validUntil'] = this.validUntil;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.role != null) {
      data['role'] = this.role!.toJson();
    }
    data['role_code'] = this.roleCode;
    data['token'] = this.token;
    return data;
  }
}

class User {
  int? id;
  int? tenantId;
  int? allTenant;
  String? userIdcode;
  String? avatar;
  String? name;
  String? username;
  String? email;
  Null? emailVerifiedAt;
  String? phone;
  Null? phoneVerifiedAt;
  Null? note;
  String? role;
  int? level;
  int? systemUser;
  String? socialauthFacebookId;
  String? socialauthFacebookToken;
  Null? socialauthFacebookData;
  String? socialauthGoogleId;
  String? socialauthGoogleToken;
  Null? socialauthGoogleData;
  int? status;
  int? linkedId;
  String? bannedNote;
  Null? bannedAt;
  String? createdAt;
  String? updatedAt;
  Profile? profile;

  User(
      {this.id,
      this.tenantId,
      this.allTenant,
      this.userIdcode,
      this.avatar,
      this.name,
      this.username,
      this.email,
      this.emailVerifiedAt,
      this.phone,
      this.phoneVerifiedAt,
      this.note,
      this.role,
      this.level,
      this.systemUser,
      this.socialauthFacebookId,
      this.socialauthFacebookToken,
      this.socialauthFacebookData,
      this.socialauthGoogleId,
      this.socialauthGoogleToken,
      this.socialauthGoogleData,
      this.status,
      this.linkedId,
      this.bannedNote,
      this.bannedAt,
      this.createdAt,
      this.updatedAt,
      this.profile});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tenantId = json['tenant_id'];
    allTenant = json['all_tenant'];
    userIdcode = json['user_idcode'];
    avatar = json['avatar'];
    name = json['name'];
    username = json['username'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    phone = json['phone'];
    phoneVerifiedAt = json['phone_verified_at'];
    note = json['note'];
    role = json['role'];
    level = json['level'];
    systemUser = json['system_user'];
    socialauthFacebookId = json['socialauth_facebook_id'];
    socialauthFacebookToken = json['socialauth_facebook_token'];
    socialauthFacebookData = json['socialauth_facebook_data'];
    socialauthGoogleId = json['socialauth_google_id'];
    socialauthGoogleToken = json['socialauth_google_token'];
    socialauthGoogleData = json['socialauth_google_data'];
    status = json['status'];
    linkedId = json['linked_id'];
    bannedNote = json['banned_note'];
    bannedAt = json['banned_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    profile =
        json['profile'] != null ? new Profile.fromJson(json['profile']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['tenant_id'] = this.tenantId;
    data['all_tenant'] = this.allTenant;
    data['user_idcode'] = this.userIdcode;
    data['avatar'] = this.avatar;
    data['name'] = this.name;
    data['username'] = this.username;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['phone'] = this.phone;
    data['phone_verified_at'] = this.phoneVerifiedAt;
    data['note'] = this.note;
    data['role'] = this.role;
    data['level'] = this.level;
    data['system_user'] = this.systemUser;
    data['socialauth_facebook_id'] = this.socialauthFacebookId;
    data['socialauth_facebook_token'] = this.socialauthFacebookToken;
    data['socialauth_facebook_data'] = this.socialauthFacebookData;
    data['socialauth_google_id'] = this.socialauthGoogleId;
    data['socialauth_google_token'] = this.socialauthGoogleToken;
    data['socialauth_google_data'] = this.socialauthGoogleData;
    data['status'] = this.status;
    data['linked_id'] = this.linkedId;
    data['banned_note'] = this.bannedNote;
    data['banned_at'] = this.bannedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.profile != null) {
      data['profile'] = this.profile!.toJson();
    }
    return data;
  }
}

class Profile {
  int? id;
  int? tenantId;
  int? userId;
  int? gender;
  Null? dateOfBirth;
  String? socnetFacebook;
  String? socnetInstagram;
  String? address;
  String? postalCode;
  String? createdAt;
  String? updatedAt;

  Profile(
      {this.id,
      this.tenantId,
      this.userId,
      this.gender,
      this.dateOfBirth,
      this.socnetFacebook,
      this.socnetInstagram,
      this.address,
      this.postalCode,
      this.createdAt,
      this.updatedAt});

  Profile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tenantId = json['tenant_id'];
    userId = json['user_id'];
    gender = json['gender'];
    dateOfBirth = json['date_of_birth'];
    socnetFacebook = json['socnet_facebook'];
    socnetInstagram = json['socnet_instagram'];
    address = json['address'];
    postalCode = json['postal_code'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['tenant_id'] = this.tenantId;
    data['user_id'] = this.userId;
    data['gender'] = this.gender;
    data['date_of_birth'] = this.dateOfBirth;
    data['socnet_facebook'] = this.socnetFacebook;
    data['socnet_instagram'] = this.socnetInstagram;
    data['address'] = this.address;
    data['postal_code'] = this.postalCode;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Role {
  Webdev? webdev;

  Role({this.webdev});

  Role.fromJson(Map<String, dynamic> json) {
    webdev =
        json['webdev'] != null ? new Webdev.fromJson(json['webdev']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.webdev != null) {
      data['webdev'] = this.webdev!.toJson();
    }
    return data;
  }
}

class Webdev {
  int? id;
  int? tenantGroupId;
  int? tenantId;
  String? roleCode;
  int? level;
  int? systemRole;
  String? name;
  Null? rule;
  int? isMainRole;
  int? hasAuthGrant;

  Webdev(
      {this.id,
      this.tenantGroupId,
      this.tenantId,
      this.roleCode,
      this.level,
      this.systemRole,
      this.name,
      this.rule,
      this.isMainRole,
      this.hasAuthGrant});

  Webdev.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tenantGroupId = json['tenant_group_id'];
    tenantId = json['tenant_id'];
    roleCode = json['role_code'];
    level = json['level'];
    systemRole = json['system_role'];
    name = json['name'];
    rule = json['rule'];
    isMainRole = json['is_main_role'];
    hasAuthGrant = json['has_auth_grant'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['tenant_group_id'] = this.tenantGroupId;
    data['tenant_id'] = this.tenantId;
    data['role_code'] = this.roleCode;
    data['level'] = this.level;
    data['system_role'] = this.systemRole;
    data['name'] = this.name;
    data['rule'] = this.rule;
    data['is_main_role'] = this.isMainRole;
    data['has_auth_grant'] = this.hasAuthGrant;
    return data;
  }
}
