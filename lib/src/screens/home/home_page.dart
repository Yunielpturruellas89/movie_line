import 'package:flutter/material.dart';
import 'package:movie_line/src/class/hymn.dart';
import 'package:movie_line/src/components/Hymn/item_hymn.dart';

class HimnosScreen extends StatelessWidget {
  final List<Hymn> hymns;
  const HimnosScreen({super.key, required this.hymns});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 236, 234, 234),
      body: ListView.separated(
        itemCount: hymns.length,
        separatorBuilder: (context, index) => const SizedBox(height: 8),
        itemBuilder: (context, index) {
          final himno = hymns[index];
          return ItemHymn(
            hymn: himno,
            onTap: () {},
          );
        },
      ),
    );
  }
}
