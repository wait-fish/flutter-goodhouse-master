
import 'package:flutter/material.dart';
import 'package:flutter_advanced_networkimage_2/provider.dart';

final networkUriReg = RegExp('^http');
final localUriReg = RegExp('^static');

class CommonImage extends StatelessWidget {
  final String src;
  final double width;
  final double height;
  final BoxFit fit;

  const CommonImage({Key? key, required this.src, required this.width, required this.height, required this.fit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (networkUriReg.hasMatch(src)) {
      return Image(
        width: width,
        height: height,
        fit: fit,
        image: AdvancedNetworkImage(
          src,
          useDiskCache: true,
          cacheRule: const CacheRule(maxAge: Duration(days: 7)),
          timeoutDuration: const Duration(seconds: 10),
        ),
      );
    } else if (localUriReg.hasMatch(src)) {
      return Image.asset(
        src,
        width: width,
        height: height,
        fit: fit,
      );
    }
    assert(false, "图片地址 src 不合法！");
    return Container();
  }
}
