import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../theme/app_theme_data.dart';

class NetworkImageWidget extends StatelessWidget {
  final String imageUrl;
  final double? height;
  final double? width;
  final Widget? errorWidget;
  final Widget? progressIndicator;
  final BoxFit? fit;
  final double? borderRadius;
  final Color? color;
  final bool? isProfile;

  const NetworkImageWidget({
    Key? key,
    this.height,
    this.width,
    this.fit,
    required this.imageUrl,
    this.borderRadius,
    this.errorWidget,
    this.progressIndicator,
    this.color,
    this.isProfile = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius ?? 0),
      child: CachedNetworkImage(
        fit: fit ?? BoxFit.cover,
        height: height ?? 100,
        width: width ?? 100,
        imageUrl: imageUrl,
        color: color,
        progressIndicatorBuilder: (context, url, downloadProgress) => progressIndicator ??
            Image.asset(
          isProfile! ? '' : '',

          height: height ?? 100,
          width: width ?? 100,
          fit: BoxFit.cover,
        ),
        errorWidget: (context, url, error) => Container(
          height: height ?? 100,
          width: width ?? 100,
          color:  AppThemeData.grey800 ,
          child: errorWidget ??
              Image.asset(
                isProfile! ? '': '',
                height: height ?? 100,
                width: width ?? 100,
                fit: BoxFit.cover,
              ),
        ),
      ),
    );
  }
}
