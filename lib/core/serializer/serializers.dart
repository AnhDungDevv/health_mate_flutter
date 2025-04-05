import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:health_mate/src/auth/data/models/auth_data.dart';
import 'package:health_mate/src/auth/data/models/sign_in_request_model.dart';
import 'package:health_mate/src/auth/data/models/sign_up_request_model.dart';
import 'package:health_mate/src/payment/data/models/payment_model.dart';
import 'package:health_mate/src/profile/data/model/user_model.dart';
import 'package:health_mate/src/wallet/data/model/transaction_model.dart';
import 'package:health_mate/src/wallet/data/model/wallet_model.dart';

part 'serializers.g.dart';

@SerializersFor([
  AuthDataModel,
  UserModel,
  SignUpRequestModel,
  SignInRequestModel,
  WalletModel,
  TransactionModel,
  PaymentModel
])
final Serializers serializers = (_$serializers.toBuilder()
      ..add(RoleSerializer())
      ..addPlugin(StandardJsonPlugin()))
    .build();
