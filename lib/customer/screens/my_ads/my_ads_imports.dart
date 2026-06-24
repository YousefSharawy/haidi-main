import 'dart:io';

import 'package:base_flutter/customer/models/dots/add_ad_model.dart';
import 'package:base_flutter/customer/models/general_ad_model.dart';
import 'package:base_flutter/customer/resources/customer_repository_imports.dart';
import 'package:base_flutter/customer/screens/my_ads/widgets/my_ads_widgets_imports.dart';
import 'package:base_flutter/customer/widgets/home_scaffold.dart';
import 'package:base_flutter/general/constants/MyColors.dart';
import 'package:base_flutter/general/utilities/tf_custom_widgets/tf_custom_widgets.dart';
import 'package:base_flutter/general/utilities/utils_functions/Navigator.dart';
import 'package:base_flutter/general/widgets/DefaultAppBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:tf_validator/localization/LocalizationMethods.dart';

import '../../../general/utilities/tf_custom_widgets/widgets/DefaultButton.dart';
import '../my_ads_details/my_ads_details_imports.dart';

part 'my_ads_data.dart';
part 'my_ads_view.dart';