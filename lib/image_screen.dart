import 'package:flutter/cupertino.dart';

class ImageScreen extends StatelessWidget {
  const ImageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Column(
        children: [
          Text('이미지'),
          Expanded(
            child: Image.asset(
              'assets/image_2.jpg',
            ),
          ),
        ],
      ),
    );
  }
}

class NetworkImageScreen extends StatelessWidget {
  const NetworkImageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Column(
        children: [
          Text('네트워크 이미지'),
          Expanded(
            child: Image.network(
              'https://images.unsplash.com/photo-1727207652611-59e981d73c48?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8MXx8fGVufDB8fHx8fA%3D%3D',
            ),
          ),
        ],
      ),
      // child: CachedNetworkImage(
      //   imageUrl:
      //       'https://images.unsplash.com/photo-1727207652611-59e981d73c48?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8MXx8fGVufDB8fHx8fA%3D%3D',
      //   imageBuilder: (context, imageProvider) => Container(
      //     decoration: BoxDecoration(
      //       image: DecorationImage(
      //         image: imageProvider,
      //         fit: BoxFit.cover,
      //       ),
      //     ),
      //   ),
      //   placeholder: (context, url) => const CircularProgressIndicator(),
      //   errorWidget: (context, url, error) => const Icon(Icons.error),
      // ),
    );
  }
}
