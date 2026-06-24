import 'dart:io';

import 'package:base_flutter/customer/models/ads_subcategory.dart';
import 'package:base_flutter/customer/models/department_model.dart';
import 'package:base_flutter/customer/models/dots/add_ad_model.dart';
import 'package:base_flutter/customer/resources/customer_repository_imports.dart';
import 'package:base_flutter/customer/screens/my_ads_details/widgets/my_ads_widgets_imports.dart';
import 'package:base_flutter/customer/widgets/home_scaffold.dart';
import 'package:base_flutter/general/constants/MyColors.dart';
import 'package:base_flutter/general/utilities/http/dio/dio_helper.dart';
import 'package:base_flutter/general/utilities/tf_custom_widgets/Inputs/DropdownTextField.dart';
import 'package:base_flutter/general/utilities/tf_custom_widgets/Inputs/GenericTextField.dart';
import 'package:base_flutter/general/utilities/tf_custom_widgets/Inputs/custom_dropDown/CustomDropDown.dart';
import 'package:base_flutter/general/utilities/tf_custom_widgets/utils/generic_cubit/generic_cubit.dart';
import 'package:base_flutter/general/utilities/tf_custom_widgets/widgets/DefaultButton.dart';
import 'package:base_flutter/general/utilities/tf_custom_widgets/widgets/MyText.dart';
import 'package:base_flutter/general/utilities/utils_functions/Navigator.dart';
import 'package:base_flutter/general/utilities/utils_functions/UtilsImports.dart';
import 'package:base_flutter/general/widgets/DefaultAppBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tf_validator/localization/LocalizationMethods.dart';
import 'package:tf_validator/tf_validator.dart';

import '../../models/ad_edit_details_model.dart';

part 'my_ads_details_data.dart';
part 'my_ads_details_view.dart';