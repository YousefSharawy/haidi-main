import 'dart:io';

import 'package:base_flutter/customer/screens/register/RegisterImports.dart';
import 'package:base_flutter/general/constants/MyColors.dart';
import 'package:base_flutter/general/screens/terms/TermsImports.dart';
import 'package:base_flutter/general/utilities/tf_custom_widgets/Inputs/GenericTextField.dart';
import 'package:base_flutter/general/utilities/tf_custom_widgets/tf_custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tf_validator/localization/LocalizationMethods.dart';
import 'package:tf_validator/validator/Validator.dart';

import '../../../../general/screens/location_address/location_cubit/location_cubit.dart';
import '../../../../general/utilities/tf_custom_widgets/Inputs/DropdownTextField.dart';
import '../../../../general/utilities/utils_functions/Navigator.dart';
import '../../../models/city_model.dart';
import '../../../resources/customer_repository_imports.dart';

part 'BuildAccept.dart';
part 'BuildHaveAccount.dart';
part 'BuildRegisterButton.dart';
part 'BuildRegisterInputs.dart';
part 'BuildRegisterPic.dart';
part 'BuildText.dart';