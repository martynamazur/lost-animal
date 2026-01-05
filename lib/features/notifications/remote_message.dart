import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'remote_message.freezed.dart';
part 'remote_message.g.dart';

@freezed
abstract class PushPayload with _$PushPayload {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory PushPayload({
    required String type,
    String? chatId,
    String? messageId,
    required DateTime sentAt,
  }) = _PushPayload;

  factory PushPayload.fromJson(Map<String, dynamic> json) =>
      _$PushPayloadFromJson(json);
}

/*
To jest to co app interpretuje ; jaki typ zdarzenia nastapil, jaka akcje wykonac, do jakiego zasobu sie odwolac itp
 */
