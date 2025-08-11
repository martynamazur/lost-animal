import 'package:lostanimal/model/chat_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'inbox_provider.dart';

part 'inbox_notifier.g.dart';

@riverpod
class InboxNotifier extends _$InboxNotifier {
  @override
  Stream<List<ChatModel>> build(){
    return ref.read(inboxRepositoryProvider).getUserChatsStream();
  }
}
