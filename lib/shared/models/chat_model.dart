import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../utils/timestamp_converter.dart';

part 'chat_model.freezed.dart';
part 'chat_model.g.dart';

@freezed
abstract class ChatModel with _$ChatModel {
  const factory ChatModel({
    @Default('') String id,
    required String reportId,
    required String reportAuthorDisplayName,
    required String reportAuthorId,
    required List<String> participants,

    @TimestampConverter() required DateTime lastMessageAt,

    required String lastMessage,
    required String participantsKey,

    @TimestampConverter() required DateTime createdAt,

    required Map<String, String> participantDisplayNames,

    required List<String> lastMessageReadBy,
  }) = _ChatModel;

  factory ChatModel.fromJson(Map<String, dynamic> json) =>
      _$ChatModelFromJson(json);

  /*
      Po CO ? bo doc.data zawiera tylko pola danego dokumentu
      a id dokumentu dostaje sie po doc.id = nie znajduje sie wewnatrz danych doc.data()

   */
  factory ChatModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return ChatModel.fromJson(data).copyWith(id: doc.id);
  }
}
