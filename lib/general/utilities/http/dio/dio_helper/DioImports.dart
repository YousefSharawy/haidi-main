import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:base_flutter/general/screens/login/LoginImports.dart';
import 'package:base_flutter/general/utilities/http/dio/dio_cache_helper/src/builder_dio.dart';
import 'package:base_flutter/general/utilities/http/dio/dio_cache_helper/src/core/config.dart';
import 'package:base_flutter/general/utilities/http/dio/dio_cache_helper/src/manager_dio.dart';
import 'package:base_flutter/general/utilities/http/dio/modals/LoadingDialog.dart';
import 'package:base_flutter/general/utilities/http/dio/utils/DioUtils.dart';
import 'package:base_flutter/general/utilities/http/dio/utils/GlobalState.dart';
import 'package:base_flutter/general/utilities/utils_functions/Navigator.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'DioHelperStatus.dart';
part 'PrevDioHelper.dart';


