import 'package:base_flutter/customer/screens/products_cart/products_cart_imports.dart';
import 'package:base_flutter/general/utilities/utils_functions/Navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tf_validator/tf_validator.dart';

import '../../../../general/constants/MyColors.dart';
import '../../../../general/utilities/tf_custom_widgets/Inputs/GenericTextField.dart';
import '../../../../general/utilities/tf_custom_widgets/utils/generic_cubit/generic_cubit.dart';
import '../../../../general/utilities/tf_custom_widgets/widgets/CachedImage.dart';
import '../../../../general/utilities/tf_custom_widgets/widgets/DefaultButton.dart';
import '../../../../general/utilities/tf_custom_widgets/widgets/MyText.dart';
import '../../../models/product_cart_model.dart';
import '../../payment/payment_imports.dart';

part 'discount_text_field.dart';
part 'products_cart_item.dart';
part 'total_container.dart';