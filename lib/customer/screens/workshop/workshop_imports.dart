import 'package:base_flutter/customer/screens/workshop/widgets/workshop_widgets_imports.dart';
import 'package:base_flutter/customer/widgets/home_scaffold.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_core/core.dart';
import 'package:tf_validator/localization/LocalizationMethods.dart';

import '../../../general/models/LocationModel.dart';
import '../../../general/screens/location_address/LocationAddressImports.dart';
import '../../../general/screens/location_address/location_cubit/location_cubit.dart';
import '../../../general/utilities/tf_custom_widgets/utils/generic_cubit/generic_cubit.dart';
import '../../../general/utilities/tf_custom_widgets/widgets/DefaultButton.dart';
import '../../../general/utilities/utils_functions/LoadingDialog.dart';
import '../../../general/utilities/utils_functions/Navigator.dart';
import '../../../general/utilities/utils_functions/UtilsImports.dart';
import '../../../general/widgets/DefaultAppBar.dart';
import '../../models/dots/add_service_to_cart_model.dart';
import '../../models/provider_dates_model.dart';
import '../../models/provider_offers_model.dart';
import '../../models/provider_services_model.dart';
import '../../models/search_model.dart';
import '../../resources/customer_repository_imports.dart';
import '../cart/cart_imports.dart';

part 'workshop.dart';
part 'workshop_data.dart';
