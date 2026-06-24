import 'package:base_flutter/customer/screens/home/HomeImports.dart';
import 'package:base_flutter/customer/screens/reservation_confirmation/widgets/reservation_confirmation_widgets_imports.dart';
import 'package:base_flutter/customer/widgets/home_scaffold.dart';
import 'package:base_flutter/general/utilities/tf_custom_widgets/tf_custom_widgets.dart';
import 'package:base_flutter/general/utilities/utils_functions/Navigator.dart';
import 'package:base_flutter/general/widgets/DefaultAppBar.dart';
import 'package:base_flutter/res.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tf_validator/localization/LocalizationMethods.dart';

import '../../../general/blocks/lang_cubit/lang_cubit.dart';
import '../../../general/blocks/setting_cubit/setting_cubit.dart';
import '../../../general/blocks/user_cubit/user_cubit.dart';
import '../../../general/constants/MyColors.dart';
import '../../models/cart_service_datils_model.dart';
import '../../models/dots/create_service_order_model.dart';
import '../../models/setting_model.dart';
import '../../resources/customer_repository_imports.dart';
import '../payment_method/payment_method_data.dart';
import '../payment_method/payment_method_imports.dart';
import '../success/success_imports.dart';

part 'reservation_confirmation.dart';
part 'reservation_confirmation_data.dart';