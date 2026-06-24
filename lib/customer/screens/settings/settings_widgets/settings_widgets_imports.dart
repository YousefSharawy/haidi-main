import 'dart:io';

import 'package:base_flutter/customer/screens/settings/settings_imports.dart';
import 'package:base_flutter/general/utilities/tf_custom_widgets/tf_custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tf_validator/tf_validator.dart';

import '../../../../general/blocks/user_cubit/user_cubit.dart';
import '../../../../general/constants/MyColors.dart';
import '../../../../general/screens/location_address/location_cubit/location_cubit.dart';
import '../../../../general/utilities/tf_custom_widgets/Inputs/DropdownTextField.dart';
import '../../../../general/utilities/tf_custom_widgets/Inputs/GenericTextField.dart';
import '../../../models/city_model.dart';
import '../../../resources/customer_repository_imports.dart';

part 'settings_form_item.dart';
part 'settings_from.dart';
part 'settings_image.dart';