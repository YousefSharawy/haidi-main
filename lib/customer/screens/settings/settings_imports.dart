import 'dart:io';

import 'package:animations/animations.dart';
import 'package:base_flutter/customer/resources/customer_repository_imports.dart';
import 'package:base_flutter/customer/screens/settings/settings_widgets/settings_widgets_imports.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:tf_validator/localization/LocalizationMethods.dart';

import '../../../general/blocks/lang_cubit/lang_cubit.dart';
import '../../../general/blocks/user_cubit/user_cubit.dart';
import '../../../general/constants/MyColors.dart';
import '../../../general/models/LocationModel.dart';
import '../../../general/screens/change_password/ChangePasswordImports.dart';
import '../../../general/screens/location_address/LocationAddressImports.dart';
import '../../../general/screens/location_address/location_cubit/location_cubit.dart';
import '../../../general/utilities/tf_custom_widgets/Inputs/custom_dropDown/CustomDropDown.dart';
import '../../../general/utilities/tf_custom_widgets/utils/generic_cubit/generic_cubit.dart';
import '../../../general/utilities/tf_custom_widgets/widgets/DefaultButton.dart';
import '../../../general/utilities/tf_custom_widgets/widgets/MyText.dart';
import '../../../general/utilities/utils_functions/LoadingDialog.dart';
import '../../../general/utilities/utils_functions/UtilsImports.dart';
import '../../../general/widgets/DefaultAppBar.dart';
import '../../models/city_model.dart';
import '../../models/dots/update_profile_model.dart';
import '../../widgets/home_scaffold.dart';

part 'settings.dart';
part 'settings_data.dart';