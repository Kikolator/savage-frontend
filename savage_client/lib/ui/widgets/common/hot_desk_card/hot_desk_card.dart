import 'package:flutter/material.dart';
import 'package:savage_client/data/desk.dart';
import 'package:savage_client/ui/common/ui_helpers.dart';

class HotDeskCard extends StatelessWidget {
  final Desk desk;
  final void Function()? onPressed;
  const HotDeskCard({required this.desk, this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 120,
            alignment: Alignment.center,
            child: desk.photoUrl != null
                ? Image.network(
                    desk.photoUrl!,
                    fit: BoxFit.cover,
                  )
                : const Icon(
                    Icons.desk_rounded,
                    size: 120,
                  ),
          ),
          verticalSpaceSmall,
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              'Hot Desk ${desk.number}',
              style: const TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: const Text(
              'Av. España 230',
              style: TextStyle(color: Colors.grey),
            ),
          ),
          verticalSpaceMedium,
          Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.only(right: 10),
              child: ElevatedButton(
                  onPressed: onPressed, child: const Text('Book'))),
          verticalSpaceMedium,
        ],
      ),
    );
  }
}
