// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponse _$BaseResponseFromJson(Map<String, dynamic> json) => BaseResponse(
      json['messeges'] as String?,
      json['status'] as int?,
    );

Map<String, dynamic> _$BaseResponseToJson(BaseResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'messeges': instance.messages,
    };

CustomerResponse _$CustomerResponseFromJson(Map<String, dynamic> json) =>
    CustomerResponse(
      json['id'] as String?,
      json['name'] as String?,
      json['numOfNotification'] as int?,
    );

Map<String, dynamic> _$CustomerResponseToJson(CustomerResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'numOfNotification': instance.numOfNotification,
    };

ContactseRsponse _$ContactseRsponseFromJson(Map<String, dynamic> json) =>
    ContactseRsponse(
      json['email'] as String?,
      json['Link'] as String?,
      json['status'] as String?,
    );

Map<String, dynamic> _$ContactseRsponseToJson(ContactseRsponse instance) =>
    <String, dynamic>{
      'email': instance.email,
      'status': instance.messages,
      'Link': instance.link,
    };

AuthenticationsResponse _$AuthenticationsResponseFromJson(
        Map<String, dynamic> json) =>
    AuthenticationsResponse(
      json['contacts'] == null
          ? null
          : ContactseRsponse.fromJson(json['contacts'] as Map<String, dynamic>),
      json['customer'] == null
          ? null
          : CustomerResponse.fromJson(json['customer'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AuthenticationsResponseToJson(
        AuthenticationsResponse instance) =>
    <String, dynamic>{
      'customer': instance.customer,
      'contacts': instance.contacts,
    };
