import 'package:base_flutter/customer/screens/products_cart/widgets/products_cart_widgets_imports.dart';
import 'package:base_flutter/customer/screens/store/store_imports.dart';
import 'package:base_flutter/customer/widgets/home_scaffold.dart';
import 'package:base_flutter/general/constants/MyColors.dart';
import 'package:base_flutter/general/utilities/tf_custom_widgets/tf_custom_widgets.dart';
import 'package:base_flutter/general/widgets/DefaultAppBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tf_validator/tf_validator.dart';

import '../../../general/blocks/lang_cubit/lang_cubit.dart';
import '../../../general/blocks/setting_cubit/setting_cubit.dart';
import '../../../general/utilities/utils_functions/Navigator.dart';
import '../../../res.dart';
import '../../models/product_cart_model.dart';
import '../../models/setting_model.dart';
import '../../resources/customer_repository_imports.dart';

part 'products_cart.dart';
part 'products_cart_data.dart';