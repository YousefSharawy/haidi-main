part of 'GeneralRepoImports.dart';

class GeneralHttpMethods {
  final BuildContext context;

  FirebaseMessaging messaging = FirebaseMessaging.instance;

  GeneralHttpMethods(this.context);

  Future<bool> userLogin(String phone, String password) async {
    String? _token = await messaging.getToken().timeout(const Duration(seconds: 3), onTimeout: () => "").catchError((e) => "");
    Map<String, dynamic> body = {
      "phone": "$phone",
      "password": "$password",
      "deviceId": "$_token",
      "TypeUser": 1,
      "deviceType": Platform.isIOS ? "ios" : "android",
      "projectName": "Haidy"
    };

    var data = await GenericHttp<dynamic>(context).callApi(
      name: ApiNames.login,
      jsonBody: body,
      returnType: ReturnType.Type,
      methodType: MethodType.Post,
      showLoader: true,
      returnDataFun: (data) => data,
    );
    return Utils.manipulateLoginData(context, data, _token ?? "");
  }

  Future<List<QuestionModel>> frequentQuestions() async {
    return await GenericHttp<QuestionModel>(context).callApi(
            name: ApiNames.repeatedQuestions,
            returnType: ReturnType.List,
            showLoader: true,
            methodType: MethodType.Get,
            returnDataFun: (data) => data["data"],
            toJsonFunc: (json) => QuestionModel.fromJson(json))
        as List<QuestionModel>;
  }

  Future<bool> sendCode(String code, String userId) async {
    var lang = context.read<LangCubit>().state.locale.languageCode;
    String? _token = await messaging.getToken().timeout(const Duration(seconds: 3), onTimeout: () => "").catchError((e) => "");
    Map<String, dynamic> body = {"lang": lang, "code": code, "userId": userId};
    dynamic data = await GenericHttp<dynamic>(context).callApi(
      name: ApiNames.sendCode,
      jsonBody: body,
      returnType: ReturnType.Type,
      showLoader: true,
      methodType: MethodType.Post,
    );
    return Utils.manipulateLoginData(context, data, _token ?? "",
        fromSendCode: true);
  }

  Future<bool> resendCode(String userId) async {
    var lang = context.read<LangCubit>().state.locale.languageCode;
    Map<String, dynamic> body = {"lang": lang, "userId": userId};
    dynamic data = await GenericHttp<dynamic>(context).callApi(
      name: ApiNames.resendCode,
      query: body,
      returnType: ReturnType.Type,
      showLoader: true,
      methodType: MethodType.Post,
    );
    if (data != null) {
      CustomToast.showSimpleToast(msg: tr(context, 'theCodeHasBeenSent'));
      return true;
    } else {
      return false;
    }
  }

  Future<String?> aboutApp() async {
    var lang = context.read<LangCubit>().state.locale.languageCode;
    var data = await GenericHttp<String>(context).callApi(
        name: ApiNames.aboutApp,
        returnType: ReturnType.Type,
        refresh: true,
        query: {'lang': lang},
        methodType: MethodType.Get,
        showLoader: false,
        returnDataFun: (data) => data["aboutUs"]);
    // toJsonFunc: (json) => ProviderServicesModel.fromJson(json));
    return data;
  }

  Future<String?> terms() async {
    var lang = context.read<LangCubit>().state.locale.languageCode;
    var data = await GenericHttp<String>(context).callApi(
        name: ApiNames.conditionForClient,
        returnType: ReturnType.Type,
        refresh: true,
        query: {'lang': lang},
        methodType: MethodType.Get,
        showLoader: false,
        returnDataFun: (data) => data["condtions"]);
    return data;
  }

  Future<bool> switchNotify() async {
    dynamic data = await GenericHttp<dynamic>(context).callApi(
      name: ApiNames.switchNotify,
      returnType: ReturnType.Type,
      showLoader: false,
      methodType: MethodType.Post,
    );
    return (data != null);
  }

  Future<bool> forgetPassword(String phone) async {
    Map<String, dynamic> body = {
      "Phone": "$phone",
    };
    dynamic data = await GenericHttp<dynamic>(context).callApi(
      name: ApiNames.forgetPassword,
      returnType: ReturnType.Type,
      jsonBody: body,
      showLoader: false,
      methodType: MethodType.Post,
    );
    if (data != null) {
      CustomToast.showSimpleToast(msg: tr(context, 'codeSendSuccessfully'));
      Nav.navigateTo(ResetPassword(userId: data['userId']),
          navigatorType: NavigatorType.push);
      return true;
    } else {
      return false;
    }
  }

  Future<bool> resetUserPassword(
      String userId, String code, String pass) async {
    Map<String, dynamic> body = {
      "userId": userId,
      "code": "$code",
      "newPassword": "$pass",
    };
    dynamic data = await GenericHttp<dynamic>(context).callApi(
      name: ApiNames.resetPassword,
      returnType: ReturnType.Type,
      jsonBody: body,
      showLoader: true,
      methodType: MethodType.Post,
    );
    if (data != null) {
      CustomToast.showSimpleToast(msg: data['msg']);
      return true;
    } else {
      return false;
    }
  }

  Future<bool> changePassword(String oldPass, String newPass) async {
    var lang = context.read<LangCubit>().state.locale.languageCode;
    Map<String, dynamic> body = {
      "oldPassword": "$oldPass",
      "newPassword": "$newPass",
      "lang": lang
    };
    dynamic data = await GenericHttp<dynamic>(context).callApi(
      name: ApiNames.changePassword,
      returnType: ReturnType.Type,
      jsonBody: body,
      showLoader: true,
      methodType: MethodType.Post,
    );

    if (data != null) {
      CustomToast.showSimpleToast(msg: data['msg']);
      return true;
    } else {
      return false;
    }
  }

  Future<bool> sendMessage(
      String? name, String? mail, String? phone, String? message) async {
    Map<String, dynamic> body = {
      "userName": "$name",
      "email": "$mail",
      "phone": "$phone",
      "msg": "$message",
    };
    dynamic data = await GenericHttp<dynamic>(context).callApi(
      name: ApiNames.contactUs,
      returnType: ReturnType.Type,
      jsonBody: body,
      showLoader: false,
      methodType: MethodType.Post,
    );
    return (data != null);
  }

  Future<bool> changeLanguage(String lang) async {
    print('lang is $lang');
    Map<String, dynamic> body = {"lang": "$lang"};
    dynamic data = await GenericHttp<bool>(context).callApi(
      name: ApiNames.changeLanguage,
      returnType: ReturnType.Type,
      jsonBody: body,
      refresh: true,
      showLoader: false,
      methodType: MethodType.Patch,
    );
    return (data != null);
  }

  Future<void> logout() async {
    String? deviceId = await Utils.getDeviceId();
    Map<String, dynamic> body = {
      "lang": context.read<LangCubit>().state.locale.languageCode,
      "device_id": deviceId,
    };
    dynamic data = await GenericHttp<dynamic>(context).callApi(
      name: ApiNames.logout,
      returnType: ReturnType.Type,
      jsonBody: body,
      showLoader: true,
      returnDataFun: (data) => data,
      methodType: MethodType.Delete,
    );
    if (data != null) {
      CustomToast.showSimpleToast(msg: data['msg']);
      Utils.clearSavedData();
      Nav.navigateTo(LoginView(), navigatorType: NavigatorType.pushAndPopUntil);
    }
  }

  Future<void> deleteAccount() async {
    dynamic data = await GenericHttp<dynamic>(context).callApi(
      name: ApiNames.removeAccount,
      returnType: ReturnType.Type,
      showLoader: true,
      returnDataFun: (data) => data,
      methodType: MethodType.Delete,
    );
    if (data != null) {
      CustomToast.showSimpleToast(msg: data['msg']);
      Utils.clearSavedData();
      Nav.navigateTo(LoginView(), navigatorType: NavigatorType.pushAndPopUntil);
    }
  }
}
