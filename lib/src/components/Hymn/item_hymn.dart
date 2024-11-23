import 'package:flutter/material.dart';
import 'package:movie_line/src/class/hymn.dart';
import 'package:movie_line/src/components/Icons/favorite_icon.dart';
import 'package:movie_line/src/screens/hymn/hymn_detail_screen.dart';

class ItemHymn extends StatelessWidget {
  final Hymn hymn;

  const ItemHymn(
      {super.key, required this.hymn, required Null Function() onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        children: [
          Text(
            '${hymn.number.toString().padLeft(3, '0')} -',
            style: const TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          const SizedBox(width: 8),
          Text(hymn.name,
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black)),
          const Expanded(child: SizedBox()),
          FavoriteIcon(hymn: hymn),
          const SizedBox(width: 10),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetalleHimnoScreen(himno: hymn),
                ),
              );
            },
            child: const Icon(
              Icons.chevron_right,
              size: 30,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
