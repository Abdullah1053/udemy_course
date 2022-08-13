import 'package:udemy_course/domain/models/models.dart';
import '../../app/constant.dart';
import '../response/response.dart';
import 'package:udemy_course/app/extentions.dart';

extension CustomerResponseMapping on CustomerResponse? {
  Customer toDomain() {
    return Customer(
        this?.id.orEmpty() ?? Constants.empty,
        this?.name.orEmpty() ?? Constants.empty,
        this?.numOfNotification.orZero() ?? Constants.zero);
  }
}

extension ContactseRsponseMapping on ContactseRsponse? {
  Contacts toDomain() {
    return Contacts(
        this?.email.orEmpty() ?? Constants.empty,
        this?.link.orEmpty() ?? Constants.empty,
        this?.messages.orEmpty() ?? Constants.empty);
  }
}

extension AuthenticationsResponseMapping on AuthenticationsResponse? {
  Authentication toDomain() {
    return Authentication(this?.contacts.toDomain(), this?.customer.toDomain());
  }
}
