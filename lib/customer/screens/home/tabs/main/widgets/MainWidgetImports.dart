import 'dart:io';

import 'package:badges/badges.dart';
import 'package:base_flutter/customer/screens/home/tabs/main/MainImports.dart';
import 'package:base_flutter/general/constants/MyColors.dart';
import 'package:flutter/material.dart' hide Badge;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:tf_validator/localization/LocalizationMethods.dart';

import '../../../../../../general/blocks/auth_cubit/auth_cubit.dart';
import '../../../../../../general/blocks/setting_cubit/setting_cubit.dart';
import '../../../../../../general/utilities/tf_custom_widgets/utils/generic_cubit/generic_cubit.dart';
import '../../../../../../general/utilities/tf_custom_widgets/widgets/CachedImage.dart';
import '../../../../../../general/utilities/tf_custom_widgets/widgets/MyText.dart';
import '../../../../../../general/utilities/utils_functions/Navigator.dart';
import '../../../../../../general/widgets/custom_alert_dialog.dart';
import '../../../../../../res.dart';
import '../../../../../models/category_model.dart';
import '../../../../notifications/notifications_imports.dart';
import '../../../../search_screen/search_screen_imports.dart';
import '../../../../store/store_imports.dart';
import '../../../../workshops/workshops_imports.dart';

part 'BuildMainItems.dart';
part 'MainAppBar.dart';
part 'main_item.dart';
