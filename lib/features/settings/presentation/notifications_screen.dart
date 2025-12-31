import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  bool _pushNotifications = true;
  bool _emailNotifications = false;
  bool _newReportsNearby = true;
  bool _chatMessages = true;
  bool _reportUpdates = true;
  bool _soundEnabled = true;
  bool _vibrationEnabled = true;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Notifications'), elevation: 0),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // General Settings
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.settings_outlined,
                        color: theme.colorScheme.primary,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'General Settings',
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  SwitchListTile(
                    title: const Text('Push Notifications'),
                    subtitle: const Text(
                      'Receive notifications on this device',
                    ),
                    value: _pushNotifications,
                    onChanged: (value) {
                      setState(() {
                        _pushNotifications = value;
                      });
                    },
                    contentPadding: EdgeInsets.zero,
                  ),

                  SwitchListTile(
                    title: const Text('Email Notifications'),
                    subtitle: const Text('Receive notifications via email'),
                    value: _emailNotifications,
                    onChanged: (value) {
                      setState(() {
                        _emailNotifications = value;
                      });
                    },
                    contentPadding: EdgeInsets.zero,
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 16),

          // Notification Types
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.notifications_outlined,
                        color: theme.colorScheme.primary,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Notification Types',
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  SwitchListTile(
                    title: const Text('New Reports Nearby'),
                    subtitle: const Text(
                      'When new lost/found reports are posted in your area',
                    ),
                    value: _newReportsNearby,
                    onChanged: _pushNotifications
                        ? (value) {
                            setState(() {
                              _newReportsNearby = value;
                            });
                          }
                        : null,
                    contentPadding: EdgeInsets.zero,
                  ),

                  SwitchListTile(
                    title: const Text('Chat Messages'),
                    subtitle: const Text('When you receive new messages'),
                    value: _chatMessages,
                    onChanged: _pushNotifications
                        ? (value) {
                            setState(() {
                              _chatMessages = value;
                            });
                          }
                        : null,
                    contentPadding: EdgeInsets.zero,
                  ),

                  SwitchListTile(
                    title: const Text('Report Updates'),
                    subtitle: const Text('Updates on your posted reports'),
                    value: _reportUpdates,
                    onChanged: _pushNotifications
                        ? (value) {
                            setState(() {
                              _reportUpdates = value;
                            });
                          }
                        : null,
                    contentPadding: EdgeInsets.zero,
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 16),

          // Sound & Vibration
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.volume_up_outlined,
                        color: theme.colorScheme.primary,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Sound & Vibration',
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  SwitchListTile(
                    title: const Text('Sound'),
                    subtitle: const Text('Play sound for notifications'),
                    value: _soundEnabled,
                    onChanged: _pushNotifications
                        ? (value) {
                            setState(() {
                              _soundEnabled = value;
                            });
                          }
                        : null,
                    contentPadding: EdgeInsets.zero,
                  ),

                  SwitchListTile(
                    title: const Text('Vibration'),
                    subtitle: const Text('Vibrate for notifications'),
                    value: _vibrationEnabled,
                    onChanged: _pushNotifications
                        ? (value) {
                            setState(() {
                              _vibrationEnabled = value;
                            });
                          }
                        : null,
                    contentPadding: EdgeInsets.zero,
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 16),

          // Info Card
          Card(
            color: theme.colorScheme.surfaceContainerHighest,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.info_outline,
                        color: theme.colorScheme.primary,
                        size: 20,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'About Notifications',
                        style: theme.textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Notifications help you stay updated about lost pets in your area and messages from other users. '
                    'You can customize which notifications you receive and how you\'re alerted.',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 24),

          // Action Buttons
          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () => _resetToDefaults(),
                  icon: const Icon(Icons.refresh),
                  label: const Text('Reset to Defaults'),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: FilledButton.icon(
                  onPressed: () => _saveSettings(),
                  icon: const Icon(Icons.save),
                  label: const Text('Save Settings'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _resetToDefaults() {
    setState(() {
      _pushNotifications = true;
      _emailNotifications = false;
      _newReportsNearby = true;
      _chatMessages = true;
      _reportUpdates = true;
      _soundEnabled = true;
      _vibrationEnabled = true;
    });

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Settings reset to defaults')));
  }

  void _saveSettings() {
    // TODO: Implement saving settings to SharedPreferences or backend
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Settings saved successfully')),
    );
  }
}
