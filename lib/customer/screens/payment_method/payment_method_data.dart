import 'package:base_flutter/general/utilities/tf_custom_widgets/tf_custom_widgets.dart';

import '../../models/dots/payment_method_model.dart';

enum PaymentMethodEnum { Visa, Master, Mada, Sadad }

class PaymentMethodData {
  static final PaymentMethodData _instance = PaymentMethodData._internal();

  PaymentMethodData._internal();

  factory PaymentMethodData({bool newInstance = false}) {
    if (newInstance) {
      return PaymentMethodData();
    } else {
      return _instance;
    }
  }

  GenericBloc<PaymentMethodEnum> paymentMethodCubit =
      GenericBloc(PaymentMethodEnum.Visa);

  selectedPaymentMethod(PaymentMethodEnum data) {
    paymentMethodCubit.onUpdateData(data);
  }
}
