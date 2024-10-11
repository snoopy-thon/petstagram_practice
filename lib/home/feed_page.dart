import 'package:flutter/material.dart';

class FeedPage extends StatelessWidget {
  const FeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: 5,
          itemBuilder: (context, index) {
            return const Expanded(
              child: SizedBox(
                width: 100,
                height: 100,
                child: Column(
                  children: [
                    Text('이미지'),
                    Text('날짜'),
                    Text('좋아요'),
                  ],
                ),
              ),
            );
          }),
      floatingActionButton: IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.add_a_photo_outlined,
          size: 40,
        ),
      ),
    );
  }
}
