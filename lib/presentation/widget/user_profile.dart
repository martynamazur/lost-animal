import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lostanimal/presentation/widget/statistic_tile.dart';

class UserProfile extends ConsumerStatefulWidget {
  const UserProfile({super.key});

  @override
  ConsumerState createState() => _UserProfileState();
}

class _UserProfileState extends ConsumerState<UserProfile> {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    return Column(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundImage: user?.photoURL != null ? NetworkImage(user!.photoURL!) : AssetImage('assets/appIcon.png') as ImageProvider,
        ),
        Text(user?.displayName ?? 'Anonymous User', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        Text(user?.email ?? 'No email provided', style: TextStyle(fontSize: 14, color: Colors.grey)),
        Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          elevation: 0.5,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                StatisticTile(
                  icon: Icons.search,
                  label: 'Found',
                  value: '12',
                  color: Theme.of(context).colorScheme.secondaryContainer,
                  iconColor: Theme.of(context).colorScheme.onSecondaryContainer,
                ),
                StatisticTile(
                  icon: Icons.lightbulb_outline,
                  label: 'Tips',
                  value: '7',
                  color: Theme.of(context).colorScheme.secondaryContainer,
                  iconColor: Theme.of(context).colorScheme.onSecondaryContainer,
                ),
                StatisticTile(
                  icon: Icons.comment,
                  label: 'Comments',
                  value: '3',
                  color: Theme.of(context).colorScheme.secondaryContainer,
                  iconColor: Theme.of(context).colorScheme.onSecondaryContainer,
                ),
              ],
            ),
          ),
        ),

      ],
    );
  }
}
