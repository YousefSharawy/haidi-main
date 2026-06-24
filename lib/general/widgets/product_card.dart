
import 'package:base_flutter/customer/screens/product_details/product_details_imports.dart';
import 'package:base_flutter/general/screens/login/LoginImports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tf_validator/localization/LocalizationMethods.dart';

import '../../customer/models/ProductModel.dart';
import '../../customer/resources/customer_repository_imports.dart';
import '../../customer/screens/home/tabs/reservations/tabs/products/products_imports.dart';
import '../../customer/screens/products_cart/products_cart_imports.dart';
import '../blocks/auth_cubit/auth_cubit.dart';
import '../constants/MyColors.dart';
import '../utilities/tf_custom_widgets/widgets/CachedImage.dart';
import '../utilities/tf_custom_widgets/widgets/DefaultButton.dart';
import '../utilities/tf_custom_widgets/widgets/MyText.dart';
import '../utilities/utils_functions/Navigator.dart';
import 'custom_alert_dialog.dart';

class ProductCard extends StatelessWidget {
  final MarketProducts productModel;
  final String providerId;

  const ProductCard({required this.productModel, required this.providerId});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Nav.navigateTo(
          ProductDetails(
              productId: productModel.id!.toString(), providerId: providerId),
          navigatorType: NavigatorType.push),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5), topRight: Radius.circular(5)),
                child: CachedImage(
                    height: 140,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(5)),
                    fit: BoxFit.cover,
                    url: productModel.image!)),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyText(
                    title: productModel.providerName!,
                    size: 11,
                    color: MyColors.blackOpacity,
                  ),
                  MyText(title: productModel.title ?? '', size: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MyText(
                        title:
                            '${productModel.price}' + ' ' + tr(context, 'sar'),
                        size: 13,
                        color: MyColors.primary,
                        fontWeight: FontWeight.bold,
                      ),
                      InkWell(
                        onTap: () async {
                          final auth =
                              context.read<AuthCubit>().state.authorized;
                          if (auth) {
                            var data = await CustomerRepository(context)
                                .addProductToCart(productModel.id!, 1,
                                    productModel.providerId!);
                            if (data != null) {
                              showDialog<void>(
                                useRootNavigator: true,
                                barrierDismissible: false,
                                context: context,
                                builder: (BuildContext context) {
                                  return new Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.all(0),
                                        child: new Container(
                                          padding: EdgeInsets.all(20),
                                          width:
                                              MediaQuery.of(context).size.width,
                                          color: Colors.white,
                                          child: new Column(
                                            children: <Widget>[
                                              Row(
                                                children: [
                                                  Container(
                                                    decoration: BoxDecoration(
                                                        color: MyColors.primary,
                                                        shape: BoxShape.circle),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              3.0),
                                                      child: Icon(Icons.check,
                                                          size: 16,
                                                          color: Colors.white),
                                                    ),
                                                  ),
                                                  SizedBox(width: 20),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      MyText(
                                                          title: productModel
                                                              .title!,
                                                          size: 13),
                                                      SizedBox(height: 4),
                                                      MyText(
                                                        title: tr(
                                                            context, 'inCart'),
                                                        size: 9,
                                                        color:
                                                            Color(0xff8A8A8A),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                              SizedBox(height: 7),
                                              Container(
                                                  padding: EdgeInsetsDirectional
                                                      .only(
                                                          end: 10, bottom: 10),
                                                  alignment:
                                                      AlignmentDirectional
                                                          .topEnd,
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    children: [
                                                      MyText(
                                                        title: tr(context,
                                                            'totalCart'),
                                                        size: 12,
                                                        color: MyColors
                                                            .blackOpacity,
                                                      ),
                                                      MyText(
                                                        title:
                                                            data['totalPrices']
                                                                    .toString() +
                                                                ' ' +
                                                                tr(context,
                                                                    'sar'),
                                                        size: 12,
                                                        color: MyColors.black,
                                                      ),
                                                    ],
                                                  )),
                                              SizedBox(height: 7),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  DefaultButton(
                                                    borderColor:
                                                        MyColors.primary,
                                                    color: MyColors.white,
                                                    textColor: MyColors.primary,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            25),
                                                    height: 35,
                                                    width: 145,
                                                    margin: EdgeInsets.zero,
                                                    onTap: () async {
                                                      Navigator.of(context).pop();
                                                      // Nav.navigateTo(Products(),
                                                      //     navigatorType:
                                                      //         NavigatorType
                                                      //             .push);
                                                    },
                                                    title: tr(context,
                                                        'continueShopping'),
                                                  ),
                                                  DefaultButton(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    height: 35,
                                                    width: 145,
                                                    margin: EdgeInsets.zero,
                                                    onTap: () {
                                                      Nav.navigateTo(
                                                          ProductsCart(),
                                                          navigatorType:
                                                              NavigatorType
                                                                  .push);
                                                    },
                                                    title: tr(context,
                                                        'CompleteThePurchase'),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  );
                                },
                              );
                            }
                          } else {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return CustomAlertDialog(
                                  authDialog: true,
                                  content: tr(context, 'SignInToContinue'),
                                  onTap: () {
                                    Nav.navigateTo(LoginView(),
                                        navigatorType: NavigatorType.push);
                                  },
                                );
                              },
                            );
                          }
                        },
                        child: Container(
                          padding: EdgeInsets.all(3),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: MyColors.primary),
                          child: Icon(Icons.shopping_cart_outlined,
                              color: MyColors.white),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
