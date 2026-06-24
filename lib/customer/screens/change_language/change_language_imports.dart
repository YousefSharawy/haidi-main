import 'package:base_flutter/customer/widgets/home_scaffold.dart';
import 'package:base_flutter/general/constants/MyColors.dart';
import 'package:base_flutter/general/widgets/DefaultAppBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:tf_validator/localization/LocalizationMethods.dart';

import '../../../general/blocks/auth_cubit/auth_cubit.dart';
import '../../../general/blocks/lang_cubit/lang_cubit.dart';
import '../../../general/blocks/user_cubit/user_cubit.dart';
import '../../../general/resources/GeneralRepoImports.dart';
import '../../../general/utilities/tf_custom_widgets/utils/generic_cubit/generic_cubit.dart';
import '../../../general/utilities/tf_custom_widgets/widgets/DefaultButton.dart';
import '../../../general/utilities/tf_custom_widgets/widgets/MyText.dart';
import '../../../general/utilities/utils_functions/Navigator.dart';
import '../../../general/utilities/utils_functions/UtilsImports.dart';
import '../home/HomeImports.dart';

part 'change_language.dart';
part 'change_language_data.dart';