import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/core/styling/app_styles.dart';
import 'package:ecommerce_app/core/widgets/spacing_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductItemWidget extends StatelessWidget {
  final String title;
  final String price;
  final String image;
  final Function()? onTap;
  const ProductItemWidget(
      {super.key,
      required this.title,
      required this.price,
      this.onTap,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ?? () {},
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(8.r),
                child: Hero(
                  tag: "product$title",
                  child: CachedNetworkImage(
                    width: 150.w,
                    height: 190.h,
                    fit: BoxFit.cover,
                    imageUrl: image,
                  ),
                )),
            const HeightSpace(8),
            Text(title, maxLines: 1, style: AppStyles.black15BoldStyle),
            const HeightSpace(8),
            Text(price,
                style: AppStyles.grey12MediumStyle
                    .copyWith(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
