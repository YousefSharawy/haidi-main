

import 'dart:io';

import 'package:base_flutter/customer/models/dots/register_model.dart';
import 'package:base_flutter/customer/screens/register/widgets/RegisterWidgetsImports.dart';
import 'package:base_flutter/general/screens/active_account/ActiveAccountImports.dart';
import 'package:base_flutter/general/utilities/tf_custom_widgets/utils/CustomButtonAnimation.dart';
import 'package:base_flutter/general/utilities/utils_functions/Navigator.dart';
import 'package:base_flutter/general/utilities/utils_functions/UtilsImports.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:tf_validator/localization/LocalizationMethods.dart';

import '../../../general/blocks/lang_cubit/lang_cubit.dart';
import '../../../general/models/LocationModel.dart';
import '../../../general/screens/location_address/LocationAddressImports.dart';
import '../../../general/screens/location_address/location_cubit/location_cubit.dart';
import '../../../general/utilities/http/dio/modals/LoadingDialog.dart';
import '../../../general/utilities/tf_custom_widgets/Inputs/custom_dropDown/CustomDropDown.dart';
import '../../../general/utilities/tf_custom_widgets/utils/generic_cubit/generic_cubit.dart';
import '../../../general/utilities/utils_functions/LoadingDialog.dart';
import '../../../res.dart';
import '../../models/city_model.dart';
import '../../resources/customer_repository_imports.dart';

part 'Register.dart';
part 'RegisterData.dart';