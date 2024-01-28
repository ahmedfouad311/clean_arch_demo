import 'package:flutter/material.dart';

import '../../../remote/entities/post_entity.dart';

class PostItem extends StatelessWidget {
  Post post;
  PostItem({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Card(
        child: ListTile(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'User ID: ${post.userId}',
                style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20,),
              const Text(
                'Title: ',
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              Text(
                post.title,
                style: const TextStyle(color: Colors.black),
              ),
              const SizedBox(height: 20,),
              const Text(
                'Body: ',
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              Text(
                post.body,
                style: const TextStyle(color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
