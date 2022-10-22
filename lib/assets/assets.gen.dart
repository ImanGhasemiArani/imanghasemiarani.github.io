/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/brifecase-timer-bulk.svg
  SvgGenImage get brifecaseTimerBulk =>
      const SvgGenImage('assets/icons/brifecase-timer-bulk.svg');

  /// File path: assets/icons/brifecase-timer-twoTone.svg
  SvgGenImage get brifecaseTimerTwoTone =>
      const SvgGenImage('assets/icons/brifecase-timer-twoTone.svg');

  /// File path: assets/icons/code-1-bulk.svg
  SvgGenImage get code1Bulk =>
      const SvgGenImage('assets/icons/code-1-bulk.svg');

  /// File path: assets/icons/code-1-twoTone.svg
  SvgGenImage get code1TwoTone =>
      const SvgGenImage('assets/icons/code-1-twoTone.svg');

  /// File path: assets/icons/diamonds-bulk.svg
  SvgGenImage get diamondsBulk =>
      const SvgGenImage('assets/icons/diamonds-bulk.svg');

  /// File path: assets/icons/home-1-bulk.svg
  SvgGenImage get home1Bulk =>
      const SvgGenImage('assets/icons/home-1-bulk.svg');

  /// File path: assets/icons/home-1-twoTone.svg
  SvgGenImage get home1TwoTone =>
      const SvgGenImage('assets/icons/home-1-twoTone.svg');

  /// File path: assets/icons/teacher-bulk.svg
  SvgGenImage get teacherBulk =>
      const SvgGenImage('assets/icons/teacher-bulk.svg');

  /// File path: assets/icons/teacher-twoTone.svg
  SvgGenImage get teacherTwoTone =>
      const SvgGenImage('assets/icons/teacher-twoTone.svg');

  /// List of all assets
  List<SvgGenImage> get values => [
        brifecaseTimerBulk,
        brifecaseTimerTwoTone,
        code1Bulk,
        code1TwoTone,
        diamondsBulk,
        home1Bulk,
        home1TwoTone,
        teacherBulk,
        teacherTwoTone
      ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/original_circle_transparent.png
  AssetGenImage get originalCircleTransparent =>
      const AssetGenImage('assets/images/original_circle_transparent.png');

  /// List of all assets
  List<AssetGenImage> get values => [originalCircleTransparent];
}

class Assets {
  Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider() => AssetImage(_assetName);

  String get path => _assetName;

  String get keyName => _assetName;
}

class SvgGenImage {
  const SvgGenImage(this._assetName);

  final String _assetName;

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    Color? color,
    BlendMode colorBlendMode = BlendMode.srcIn,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    Clip clipBehavior = Clip.hardEdge,
    bool cacheColorFilter = false,
    SvgTheme? theme,
  }) {
    return SvgPicture.asset(
      _assetName,
      key: key,
      matchTextDirection: matchTextDirection,
      bundle: bundle,
      package: package,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      color: color,
      colorBlendMode: colorBlendMode,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
      theme: theme,
    );
  }

  String get path => _assetName;
}
