import 'package:base_flutter/customer/screens/products/products_imports.dart';
import 'package:base_flutter/customer/screens/store/widgets/store_widgets_imports.dart';
import 'package:base_flutter/customer/widgets/home_scaffold.dart';
import 'package:base_flutter/general/utilities/tf_custom_widgets/tf_custom_widgets.dart';
import 'package:base_flutter/general/widgets/DefaultAppBar.dart';
import 'package:base_flutter/general/widgets/build_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:tf_validator/localization/LocalizationMethods.dart';

import '../../../general/constants/MyColors.dart';
import '../../../general/utilities/utils_functions/Navigator.dart';
import '../../../general/widgets/product_card.dart';
import '../../models/ProductModel.dart';
import '../../models/sub_categories_model.dart';
import '../../resources/customer_repository_imports.dart';

part 'store.dart';
part 'store_data.dart';