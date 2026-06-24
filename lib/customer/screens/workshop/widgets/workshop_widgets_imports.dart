import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:map/map.dart';
import 'package:tf_validator/localization/LocalizationMethods.dart';
import 'package:latlng/latlng.dart' as lattt;
import 'package:animations/animations.dart';
import 'package:base_flutter/customer/models/provider_services_model.dart';
import 'package:base_flutter/customer/screens/workshop/workshop_imports.dart';
import 'package:base_flutter/general/utilities/utils_functions/Navigator.dart';
import 'package:base_flutter/general/utilities/utils_functions/UtilsImports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tf_validator/tf_validator.dart';

import '../../../../general/blocks/auth_cubit/auth_cubit.dart';
import '../../../../general/constants/MyColors.dart';
import '../../../../general/screens/location_address/location_cubit/location_cubit.dart';
import '../../../../general/utilities/tf_custom_widgets/Inputs/GenericTextField.dart';
import '../../../../general/utilities/tf_custom_widgets/utils/generic_cubit/generic_cubit.dart';
import '../../../../general/utilities/tf_custom_widgets/widgets/CachedImage.dart';
import '../../../../general/utilities/tf_custom_widgets/widgets/DefaultButton.dart';
import '../../../../general/utilities/tf_custom_widgets/widgets/MyText.dart';
import '../../../../general/widgets/custom_alert_dialog.dart';
import '../../../../res.dart';
import '../../../models/provider_dates_model.dart';
import '../../../models/provider_offers_model.dart';
import '../../cupertino_time_picker/cupertino_time_picker_imports.dart';
import '../../date_picker/date_picker_imports.dart';


// import 'package:google_maps_flutter/google_maps_flutter.dart' as google;
// import 'package:map/map.dart' as mapp;





part 'BuildDescription.dart';
part 'BuildDetails.dart';
part 'BuildLocationSalonView.dart';
part 'add_service_button.dart';
part 'add_service_button_dialog_item.dart';
part 'build_address_radio_button.dart';
part 'build_time_row.dart';
part 'information.dart';
part 'offers.dart';
part 'provider_services.dart';
part 'service_item.dart';
part 'services_content.dart';
part 'works_time.dart';
part 'workshop_image.dart';
part 'workshop_tab_bar.dart';
part 'workshop_tab_bar_item.dart';
part 'BuildMapLayOutBuilder.dart';