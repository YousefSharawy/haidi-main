

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../customer/models/setting_model.dart';

part 'setting_state.dart';

class SettingCubit extends Cubit<SettingState> {
  SettingCubit() : super(SettingInitial());

  onUpdateSettingData(SettingModel model){
    emit(SettingUpdateState(model: model,changed: !state.changed));
  }

}