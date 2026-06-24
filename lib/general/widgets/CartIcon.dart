import 'package:badges/badges.dart';
import 'package:base_flutter/customer/screens/cart/cart_imports.dart';
import 'package:base_flutter/customer/screens/products_cart/products_cart_imports.dart';
import 'package:base_flutter/general/utilities/utils_functions/Navigator.dart';
import 'package:flutter/material.dart' hide Badge;
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocks/auth_cubit/auth_cubit.dart';
import '../blocks/setting_cubit/setting_cubit.dart';
import '../constants/MyColors.dart';
import 'custom_alert_dialog.dart';

class CartIcon extends StatelessWidget {
  final bool isStore;

  const CartIcon({this.isStore = false});

  @override
  Widget build(BuildContext context) {
    final auth = context.read<AuthCubit>().state.authorized;
    return auth
        ? BlocBuilder<SettingCubit, SettingState>(
            builder: (context, state) {
              return Badge(
                  position: BadgePosition.topStart(top: 13, start: 13),
                  animationDuration: Duration(milliseconds: 300),
                  animationType: BadgeAnimationType.fade,
                  badgeColor: Colors.red,
                  showBadge: isStore
                      ? state.model.productCart!
                      : state.model.serviceCart!,
                  child: IconButton(
                      icon: Icon(
                        Icons.shopping_cart,
                        color: MyColors.primary,
                        size: 25,
                      ),
                      onPressed: () {
                        isStore
                            ? Nav.navigateTo(ProductsCart(),
                                navigatorType: NavigatorType.push)
                            : Nav.navigateTo(Cart(),
                                navigatorType: NavigatorType.push);
                      }));
            },
          )
        : IconButton(
            icon: Icon(
              Icons.shopping_cart,
              color: MyColors.primary,
              size: 25,
            ),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return CustomAlertDialog(authDialog: true);
                },
              );
            });
  }
}
