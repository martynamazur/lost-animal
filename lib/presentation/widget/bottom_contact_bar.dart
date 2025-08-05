import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomContactBar extends StatelessWidget {
  const BottomContactBar({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        spacing: 8.0,
        children: [
          OutlinedButton.icon(
              onPressed: () {},
              label: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.phone),
                    SizedBox(width: 8),
                    Text('Call')
              ])
          ),

          Expanded(
            child: FilledButton.icon(
                onPressed: () {},
                label: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.messenger_outline),
                      SizedBox(width: 8),
                      Text('Send message')
                ])
            ),
          ),

        ],
      ),
    );
  }
}
