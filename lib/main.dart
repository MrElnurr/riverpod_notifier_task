import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_state_notifier_provider_task/notifierprovider.dart';

void main() => runApp(const ProviderScope(child: MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Riverpod Task',
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final posts = ref.watch(dataNotifierProvider);

    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              ref.read(dataNotifierProvider.notifier).reversePost();
            },
            icon: const Icon(Icons.list),
          ),
          actions: [
            IconButton(
              onPressed: () {
                ref.read(dataNotifierProvider.notifier).getPosts();
              },
              icon: const Icon(
                Icons.refresh,
              ),
            ),
            IconButton(
              onPressed: () {
                ref
                    .read(dataNotifierProvider.notifier)
                    .addPost('salam', 101, 'salam', 101);
              },
              icon: const Icon(Icons.add),
            )
          ]),
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Text(posts[index].id.toString()),
            title: Text(
              posts[index].title.toString(),
            ),
            trailing: IconButton(
                onPressed: () {
                  ref
                      .watch(dataNotifierProvider.notifier)
                      .deletePost(posts[index].id!);
                },
                icon: const Icon(Icons.disabled_by_default_outlined)),
          );
        },
      ),
    );
  }
}
