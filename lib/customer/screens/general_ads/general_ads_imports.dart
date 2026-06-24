


import 'package:base_flutter/customer/models/ads_subcategory.dart';
import 'package:base_flutter/customer/models/general_ad_model.dart';
import 'package:base_flutter/customer/screens/general_ads/widgets/general_ads_widgets_imports.dart';
import 'package:base_flutter/customer/screens/my_ads/my_ads_imports.dart';
import 'package:base_flutter/customer/screens/my_ads/widgets/my_ads_widgets_imports.dart';
import 'package:base_flutter/customer/screens/store/store_imports.dart';
import 'package:base_flutter/customer/widgets/home_scaffold.dart';
import 'package:base_flutter/general/widgets/build_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:tf_validator/localization/LocalizationMethods.dart';

import '../../../general/constants/MyColors.dart';
import '../../../general/utilities/tf_custom_widgets/utils/generic_cubit/generic_cubit.dart';
import '../../../general/widgets/product_card.dart';
import '../../models/ProductModel.dart';
import '../../models/sub_categories_model.dart';
import '../../resources/customer_repository_imports.dart';
import '../store/widgets/store_widgets_imports.dart';

part 'general_ads_data.dart';
part 'general_ads_view.dart';