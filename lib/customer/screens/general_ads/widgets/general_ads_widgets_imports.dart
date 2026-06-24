import 'dart:io';

import 'package:badges/badges.dart';
import 'package:base_flutter/customer/models/dots/add_ad_model.dart';
import 'package:base_flutter/customer/models/general_ad_model.dart';
import 'package:base_flutter/customer/screens/ad_details/ad_details_imports.dart';
import 'package:base_flutter/customer/screens/general_ads/general_ads_imports.dart';
import 'package:base_flutter/customer/screens/my_ads_details/my_ads_details_imports.dart';
import 'package:base_flutter/general/constants/MyColors.dart';
import 'package:base_flutter/general/widgets/DefaultAppBar.dart';
import 'package:flutter/material.dart' hide Badge;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tf_validator/localization/LocalizationMethods.dart';

import '../../../../general/blocks/auth_cubit/auth_cubit.dart';
import '../../../../general/blocks/setting_cubit/setting_cubit.dart';
import '../../../../general/utilities/tf_custom_widgets/tf_custom_widgets.dart';
import '../../../../general/utilities/tf_custom_widgets/widgets/CachedImage.dart';
import '../../../../general/utilities/tf_custom_widgets/widgets/MyText.dart';
import '../../../../general/utilities/utils_functions/Navigator.dart';
import '../../../../general/widgets/custom_alert_dialog.dart';
import '../../../../res.dart';
import '../../notifications/notifications_imports.dart';
import '../../search_screen/search_screen_imports.dart';



part 'general_ads_appBar.dart';
part 'general_ad_card.dart';