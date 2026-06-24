import 'package:base_flutter/customer/widgets/home_scaffold.dart';
import 'package:base_flutter/general/widgets/DefaultAppBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:tf_validator/localization/LocalizationMethods.dart';

import '../../../general/constants/MyColors.dart';
import '../../../general/utilities/tf_custom_widgets/utils/generic_cubit/generic_cubit.dart';
import '../../../general/widgets/product_card.dart';
import '../../models/ProductModel.dart';
import '../../resources/customer_repository_imports.dart';

part 'products.dart';
part 'products_data.dart';