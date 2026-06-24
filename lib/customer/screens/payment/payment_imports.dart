import 'package:base_flutter/customer/screens/payment/widgets/payment_widgets_imports.dart';
import 'package:base_flutter/customer/widgets/home_scaffold.dart';
import 'package:base_flutter/general/utilities/tf_custom_widgets/tf_custom_widgets.dart';
import 'package:base_flutter/general/utilities/utils_functions/Navigator.dart';
import 'package:base_flutter/general/widgets/DefaultAppBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:tf_validator/tf_validator.dart';

import '../../../general/blocks/lang_cubit/lang_cubit.dart';
import '../../../general/constants/MyColors.dart';
import '../../../general/models/LocationModel.dart';
import '../../../general/screens/location_address/LocationAddressImports.dart';
import '../../../general/screens/location_address/location_cubit/location_cubit.dart';
import '../../../general/utilities/tf_custom_widgets/Inputs/GenericTextField.dart';
import '../../../general/utilities/utils_functions/LoadingDialog.dart';
import '../../../general/utilities/utils_functions/UtilsImports.dart';
import '../../../res.dart';
import '../../models/dots/create_product_order_model.dart';
import '../../resources/customer_repository_imports.dart';
import '../home/HomeImports.dart';

part 'payment.dart';
part 'payment_data.dart';