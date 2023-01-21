import 'package:flutter/material.dart';

class ResturantCard extends StatelessWidget {
  // const String resturantName;
  // final List _post = ['nandos', 'kabae', 'aaladin'];
  final String cominglist;
  final String speciallist;
  final VoidCallback wait;
  final String imageurl;

  const ResturantCard({
    super.key,
    required this.cominglist,
    required this.speciallist,
    required this.wait,
    required this.imageurl,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Card(
        child: ListTile(
            leading: SizedBox(
              height: 50,
              width: 50,
              child: Image.network(
                imageurl,
                width: 65,
                height: 65,
              ),
            ),
            title: Text(cominglist),
            subtitle: Text(speciallist),
            trailing: GestureDetector(
              child: const Icon(
                Icons.keyboard_arrow_right,
              ),
            ),
            onTap: wait
            // isThreeLine: true,
            ),
      ),
    );
  }
}
