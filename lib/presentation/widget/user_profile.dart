import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
          elevation: 1,
          child: GridView.count(
            crossAxisCount: 3,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(
                    radius: 24,
                    backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
                    child: Icon(Icons.search, color: Theme.of(context).colorScheme.onSecondaryContainer),
                  ),
                  const SizedBox(height: 8),
                  Text('12', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Text('Znalezione', style: TextStyle(fontSize: 12)),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(
                    radius: 24,
                    backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
                    child: Icon(Icons.lightbulb_outline, color: Theme.of(context).colorScheme.onSecondaryContainer),
                  ),
                  const SizedBox(height: 8),
                  Text('7', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Text('Tips', style: TextStyle(fontSize: 12)),
                ],
              ),
              Column(
                spacing: 8.0,
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(
                    radius: 24,
                    backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
                    child: Icon(Icons.comment, color: Theme.of(context).colorScheme.onSecondaryContainer),
                  ),

                  Text('3', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Text('Komentarze', style: TextStyle(fontSize: 12)),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
