import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pre_cache_test/cache_util.dart';
import 'package:pre_cache_test/image_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      home: MyWidget(),
    );
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    PreCacheUtil.startImageCache();
    // PreCacheUtil.startImageCache(
    //     isApplyForLocalAsset: false,
    //     networkImagePathList: [
    //       'https://images.unsplash.com/photo-1727207652611-59e981d73c48?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8MXx8fGVufDB8fHx8fA%3D%3D',
    //     ]);

    return CupertinoPageScaffold(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ImageScreen(),
                  ),
                );
              },
              child: const Text('화면 이동'),
            ),
            ElevatedButton(
              onPressed: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NetworkImageScreen(),
                  ),
                );
              },
              child: const Text('네트워크 이미지 화면 이동'),
            ),
          ],
        ),
      ),
    );
  }
}
