import 'package:base_flutter/customer/screens/product_details/widgets/product_details_widgets_imports.dart';
import 'package:base_flutter/customer/screens/products_cart/products_cart_imports.dart';
import 'package:base_flutter/general/constants/MyColors.dart';
import 'package:base_flutter/general/utilities/tf_custom_widgets/tf_custom_widgets.dart';
import 'package:base_flutter/general/utilities/utils_functions/Navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tf_validator/localization/LocalizationMethods.dart';

import '../../../general/blocks/auth_cubit/auth_cubit.dart';
import '../../../general/widgets/custom_alert_dialog.dart';
import '../../models/product_details_model.dart';
import '../../resources/customer_repository_imports.dart';
import '../products/products_imports.dart';

part 'product_details.dart';
part 'product_details_data.dart';