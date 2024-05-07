import 'package:climb_up/core/utils/app_styles.dart';
import 'package:climb_up/core/utils/constants.dart';
import 'package:climb_up/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TextInContainer extends StatelessWidget {
  const TextInContainer({
    super.key,
    required this.rate,
    required this.price,
    required this.detailes,
    required this.title,
  });
  final String rate, price, detailes, title;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24), topRight: Radius.circular(24)),
      child: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: CustomScrollView(
            // crossAxisAlignment: CrossAxisAlignment.start,
            slivers: [
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 12,
                ),
              ),
              SliverToBoxAdapter(
                child: Text(
                  title,
                  style: AppStyles.poppinsStyleBold24(context)
                      .copyWith(color: Colors.black),
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 19,
                ),
              ),
              SliverToBoxAdapter(
                child: Row(
                  children: [
                    const Icon(
                      FontAwesomeIcons.solidStar,
                      color: Color(0xffFFAB07),
                      size: 18,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(rate,
                        style: AppStyles.poppinsStyleBold14(context)
                            .copyWith(color: Colors.black))
                  ],
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 24,
                ),
              ),
              SliverToBoxAdapter(
                child: Text(
                  'Description',
                  style: AppStyles.poppinsStyleBold24(context)
                      .copyWith(color: Colors.black),
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 15,
                ),
              ),
              SliverFillRemaining(
                child: Text(
                  detailes,
                  style: AppStyles.poppinsStyleRegular14(context)
                      .copyWith(color: Colors.black87),
                ),
              ),
              
              
            ],
          ),
        ),
      ),
    );
  }
}
