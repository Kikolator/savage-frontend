import 'package:flutter/material.dart';
import 'package:savage_client/data/meeting_room.dart';
import 'package:savage_client/ui/common/ui_helpers.dart';

class MeetingRoomCard extends StatelessWidget {
  final MeetingRoom meetingRoom;
  final Function()? onPressed;
  const MeetingRoomCard(
      {required this.meetingRoom, required this.onPressed, super.key});
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.all(10),
      clipBehavior: Clip.hardEdge,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: meetingRoom.photoUrl != null ? 240 : 120,
            child: meetingRoom.photoUrl != null
                ? Image.network(
                    meetingRoom.photoUrl!,
                    fit: BoxFit.cover,
                  )
                : const Icon(
                    Icons.meeting_room_outlined,
                    size: 120,
                  ),
          ),
          verticalSpaceSmall,
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              meetingRoom.name,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              meetingRoom.description,
              style: const TextStyle(color: Colors.black),
            ),
          ),
          verticalSpaceTiny,
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              'Capacity: ${meetingRoom.capacity}',
              style: const TextStyle(color: Colors.black),
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
