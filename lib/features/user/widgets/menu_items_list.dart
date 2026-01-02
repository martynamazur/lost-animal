import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lostanimal/shared/models/menu_item_model.dart';

class MenuItemsList extends StatelessWidget {
  final List<MenuItem> menuItems;
  final void Function()? onSignOut;
  const MenuItemsList({super.key, required this.menuItems, this.onSignOut});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 12,
      children: [
        ...menuItems.map((item) {
          return Card(
            elevation: 0.5,
            margin: const EdgeInsets.symmetric(vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              title: Text(item.label),
              onTap: () {
                if (item.route != null) {
                  context.router.push(item.route!);
                } else {
                  onSignOut!();
                }
              },
              leading: CircleAvatar(
                radius: 16,
                backgroundColor: Theme.of(
                  context,
                ).colorScheme.surfaceContainerHighest,
                child: item.icon,
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: Colors.grey,
              ),
            ),
          );
        }),
      ],
    );
  }
}
