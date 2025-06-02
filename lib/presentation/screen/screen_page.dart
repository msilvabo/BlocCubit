import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScreenPage extends StatelessWidget {
  const ScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Bloc & Cubits'),
      ),
      body: ListView(
        children: const[
      
          _CustomListTile(
              title: 'Cubit',
              subTitle: 'Counter Cubit',
              location: '/counter'),      
          _CustomListTile(
              title: 'Bloc Listener / Bloc Consumer',
              subTitle: 'Counter Listener',
              location: '/listener'),      
          _CustomListTile(
              title: 'Cubit',
              subTitle: 'Splash',
              location: '/splash'),      
          _CustomListTile(
              title: 'Estados sin CopyWith',
              subTitle: 'Counter - Get Api Pokemon',
              location: '/withoutCopyWith'),                    
        ]
      ),
    );
  }
}

class _CustomListTile extends StatelessWidget {
  final String title;
  final String subTitle;
  final String location;

  const _CustomListTile({
    required this.title,
    required this.subTitle,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subTitle),
      trailing: const Icon(Icons.arrow_forward_ios_rounded),
      onTap: () => context.push(location),
    );
  }
}