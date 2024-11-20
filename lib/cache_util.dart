import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

abstract class PreCacheUtil {
  PreCacheUtil._();

  static Future<void> startImageCache({
    bool isApplyForLocalAsset = true,
    List<String>? networkImagePathList,
  }) async {
    try {
      final binding = WidgetsFlutterBinding.ensureInitialized();
      binding.addPostFrameCallback((_) async {
        BuildContext? context = binding.rootElement;

        if (context != null) {
          if (isApplyForLocalAsset) {
            await _startImageCache(context);
          } else if (networkImagePathList != null) {
            await _startNetworkImageCache(context,
                networkImagePathList: networkImagePathList);
          }
        }
      });
    } catch (e) {
      rethrow;
    }
  }

  static Future<void> _startNetworkImageCache(BuildContext context,
      {required List<String> networkImagePathList}) async {
    try {
      for (String path in networkImagePathList) {
        await precacheImage(NetworkImage(path), context);
      }
    } catch (e) {
      rethrow;
    }
  }

  static Future<void> _startImageCache(BuildContext context) async {
    try {
      final manifestJson =
          await DefaultAssetBundle.of(context).loadString('AssetManifest.json');
      final Map<String, dynamic> manifestMap = json.decode(manifestJson);
      final List<String> assetList = manifestMap.keys.toList();

      List<String> extensionList = ['svg', 'png', 'jpg', 'jpeg'];
      assetList.removeWhere(
          (element) => !extensionList.contains(element.split('.').last));

      for (String path in assetList) {
        // ignore: use_build_context_synchronously
        _imageCache(path, context);
      }
    } catch (e) {
      rethrow;
    }
  }

  /// 이미지 전달받아서 캐싱함
  static Future<void> _imageCache(String path, BuildContext context) async {
    try {
      bool isSvg = path.contains('.svg');
      if (isSvg) {
        final loader = SvgAssetLoader(path);
        await svg.cache
            .putIfAbsent(loader.cacheKey(null), () => loader.loadBytes(null));
      } else {
        await precacheImage(AssetImage(path), context);
      }
    } catch (e) {
      rethrow;
    }
  }
}
