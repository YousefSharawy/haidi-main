import 'dart:convert';
import 'dart:io';

import 'package:base_flutter/general/blocks/lang_cubit/lang_cubit.dart';
import 'package:base_flutter/general/blocks/user_cubit/user_cubit.dart';
import 'package:base_flutter/general/constants/MyColors.dart';
import 'package:base_flutter/general/constants/input_field_style/CustomInputDecoration.dart';
import 'package:base_flutter/general/constants/input_field_style/CustomInputTextStyle.dart';
import 'package:base_flutter/general/models/LocationModel.dart';
import 'package:base_flutter/general/screens/active_account/ActiveAccountImports.dart';
import 'package:base_flutter/general/screens/location_address/LocationAddressImports.dart';
import 'package:base_flutter/general/screens/location_address/location_cubit/location_cubit.dart';
import 'package:base_flutter/general/screens/select_lang/SelectLangImports.dart';
import 'package:base_flutter/general/utilities/http/dio/modals/LoadingDialog.dart';
import 'package:base_flutter/general/utilities/http/dio/utils/DioUtils.dart';
import 'package:base_flutter/general/utilities/http/dio/utils/GlobalState.dart';
import 'package:base_flutter/general/utilities/tf_custom_widgets/utils/WidgetUtils.dart';
import 'package:base_flutter/general/utilities/utils_functions/ApiNames.dart';
import 'package:base_flutter/general/utilities/utils_functions/Navigator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tf_validator/localization/LocalizationMethods.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../customer/models/sldier_model.dart';
import '../../../customer/resources/customer_repository_imports.dart';
import '../../../customer/screens/home/HomeImports.dart';
import '../../blocks/auth_cubit/auth_cubit.dart';
import '../../blocks/slider_cubit/slider_cubit.dart';
import '../../blocks/theme_cubit/theme_cubit.dart';
import '../../models/user_model.dart';
import 'LoadingDialog.dart';

part 'utils.dart';


