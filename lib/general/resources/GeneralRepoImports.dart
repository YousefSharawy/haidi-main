import 'dart:io';

import 'package:base_flutter/general/models/QuestionModel.dart';
import 'package:base_flutter/general/utilities/http/dio/dio_helper.dart';
import 'package:base_flutter/general/utilities/utils_functions/ApiNames.dart';
import 'package:base_flutter/general/utilities/utils_functions/UtilsImports.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tf_validator/localization/LocalizationMethods.dart';

import '../blocks/lang_cubit/lang_cubit.dart';
import '../screens/login/LoginImports.dart';
import '../screens/reset_password/ResetPasswordImports.dart';
import '../utilities/utils_functions/Navigator.dart';

part 'GeneralHttpMethods.dart';
part 'GeneralRepository.dart';