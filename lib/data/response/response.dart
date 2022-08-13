import 'package:json_annotation/json_annotation.dart';
// import 'package:udemy_course/data/lib.g.dart';

part 'response.g.dart';

class User {}

@JsonSerializable()
class BaseResponse {
  @JsonKey(name: "status")
  int? status;
  @JsonKey(name: "messeges")
  String? messages;

  BaseResponse(this.messages, this.status);

//from json
  factory BaseResponse.fromJson(Map<String, dynamic> json) =>
      _$BaseResponseFromJson(json);
//to json
// the statment "this" refers to the class itself ...."AuthenticationResponse"
  Map<String, dynamic> toJson() => _$BaseResponseToJson(this);
}

@JsonSerializable()
class CustomerResponse {
  @JsonKey(name: "id")
  String? id;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "numOfNotification")
  int? numOfNotification;
  CustomerResponse(this.id, this.name, this.numOfNotification);

//from json
  factory CustomerResponse.fromJson(Map<String, dynamic> json) =>
      _$CustomerResponseFromJson(json);
//to json
// the statment "this" refers to the class itself ...."AuthenticationResponse"
  Map<String, dynamic> toJson() => _$CustomerResponseToJson(this);
}

@JsonSerializable()
class ContactseRsponse {
  @JsonKey(name: "email")
  String? email;
  @JsonKey(name: "status")
  String? messages;
  @JsonKey(name: "Link")
  String? link;
  ContactseRsponse(this.email, this.link, this.messages);

//from json
  factory ContactseRsponse.fromJson(Map<String, dynamic> json) =>
      _$ContactseRsponseFromJson(json);
//to json
// the statment "this" refers to the class itself ...."AuthenticationResponse"
  Map<String, dynamic> toJson() => _$ContactseRsponseToJson(this);
}

@JsonSerializable()
class AuthenticationsResponse {
  @JsonKey(name: "customer")
  CustomerResponse? customer;
  @JsonKey(name: "contacts")
  ContactseRsponse? contacts;

  AuthenticationsResponse(this.contacts, this.customer);

//from json
  factory AuthenticationsResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthenticationsResponseFromJson(json);

  get status => null;

  get message => null;

//to json
// the statment "this" refers to the class itself ...."AuthenticationResponse"
  Map<String, dynamic> toJson() => _$AuthenticationsResponseToJson(this);
}
