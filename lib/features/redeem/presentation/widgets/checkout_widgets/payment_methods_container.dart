import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/utils/config/locale/local_lang.dart';
import '../../../../../core/utils/constants/app_constants.dart';
import '../../../../../core/utils/types/payment_methods.dart';
import '../../controller/redeem_controller.dart';

class PaymentMethodsContainer extends StatelessWidget {
  const PaymentMethodsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: AppConst.paddingBig, vertical: AppConst.paddingSmall),
          child: Text(
            localeLang(context).redeemWays,
            style: context.textTheme.titleLarge?.copyWith(),
          ),
        ),
        Container(
          height: 120,
          alignment: Alignment.center,
          child: GetBuilder<RedeemController>(
            builder: (controller) {
              return ListView.separated(
                itemCount: PaymentMethod.values.length,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                separatorBuilder: (_, i) =>
                    const SizedBox(width: AppConst.paddingSmall),
                itemBuilder: (_, index) {
                  final bool isSelected =
                      controller.selectedPaymentIndex == index;
                  return Column(
                    children: [
                      Flexible(
                        child: InkWell(
                          onTap: () => controller.setPayment(index),
                          child: Container(
                            alignment: Alignment.center,
                            width: 180,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.circular(AppConst.radiusDefault),
                              boxShadow: [
                                BoxShadow(
                                  color:
                                      isSelected ? Colors.black : Colors.grey,
                                  blurRadius: isSelected ? 0 : 10,
                                  spreadRadius: 1,
                                ),
                              ],
                            ),
                            child: Image.asset(
                                PaymentMethod.values[index].image,
                                width: 200),
                          ),
                        ),
                      ),
                      Text(
                        localeLang(context).transferToPaymentName(
                          PaymentMethod.values[index].name,
                        ),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
