import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loyalty_points/core/utils/constants/app_color.dart';

import '../../../../../core/shared/my_network_image.dart';
import '../../../../../core/utils/constants/app_constants.dart';

final ValueNotifier<int> _currentPage = ValueNotifier(0);

class CustomCarouselSlider extends StatelessWidget {
  const CustomCarouselSlider({super.key, required this.images, this.onTap});
  final List<String> images;
  final void Function(int)? onTap;

  @override
  Widget build(BuildContext context) {
    if (images.isEmpty) return const SizedBox();
    final bool autoPlay = images.length > 1;
    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: images.length,
          itemBuilder: (context, index, _) {
            return InkWell(
              onTap: onTap == null ? null : () => onTap!(index),
              borderRadius: BorderRadius.circular(AppConst.radiusDefault),
              child: MyNetworkImage(
                images[index],
                width: double.maxFinite,
                borderRadius: BorderRadius.circular(AppConst.radiusDefault),
              ),
            );
          },
          options: CarouselOptions(
            /// aspect ratio 3.18 because viewportFraction = 0.94 not equal 1
            /// this make real aspect ratio = 2 : 1
            aspectRatio: 2.127,
            viewportFraction: 0.94,
            initialPage: 0,
            enableInfiniteScroll: autoPlay,
            reverse: false,
            autoPlay: autoPlay,
            autoPlayInterval: const Duration(seconds: 7),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            enlargeFactor: 0.3,
            onPageChanged: (value, _) => _currentPage.value = value,
            scrollDirection: Axis.horizontal,
          ),
        ),
        const SizedBox(height: AppConst.paddingSmall),
        SizedBox(
          height: 8,
          child: ListenableBuilder(
            listenable: _currentPage,
            builder: (context, _) {
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: images.length,
                itemBuilder: (context, i) {
                  final bool isSelected = i == _currentPage.value;
                  return AnimatedContainer(
                    duration: AppConst.animationsDefault,
                    width: isSelected
                        ? AppConst.paddingBig
                        : AppConst.paddingSmall,
                    margin: const EdgeInsets.symmetric(
                        horizontal: AppConst.paddingExtraSmall),
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(AppConst.radiusNearCircle),
                      color: isSelected
                          ? context.theme.colorScheme.secondary
                          : AppColor.greyBackground,
                    ),
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
