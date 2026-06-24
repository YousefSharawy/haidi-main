import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';

import '../blocks/slider_cubit/slider_cubit.dart';
import '../constants/MyColors.dart';
import '../utilities/tf_custom_widgets/widgets/CachedImage.dart';

class BuildSwiper extends StatelessWidget {
  const BuildSwiper();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 230,
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(25)),
      child: BlocBuilder<SliderCubit, SliderState>(
        builder: (context, state) {
          if (state is SliderUpdateState) {
            return FlutterCarousel.builder(
              itemCount: state.sliders.length,
              itemBuilder: (BuildContext context, int index, int realIndex) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: CachedImage(
                    borderRadius: BorderRadius.circular(25),
                    fit: BoxFit.cover,
                    url: state.sliders[index],
                  ),
                );
              },
              options: FlutterCarouselOptions(
                height: 190,
                viewportFraction: 1.0,
                autoPlay: true,
                showIndicator: true,
                slideIndicator: CircularSlideIndicator(
                  slideIndicatorOptions: SlideIndicatorOptions(
                    currentIndicatorColor: MyColors.primary,
                    indicatorBackgroundColor: MyColors.primary.withOpacity(0.6),
                    itemSpacing: 16,
                    indicatorRadius: 3,
                  ),
                ),
              ),
            );
          } else {
            return Center(
                child: CircularProgressIndicator(color: MyColors.primary));
          }
        },
      ),
    );
  }
}
