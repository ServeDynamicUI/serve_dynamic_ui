import 'package:json_annotation/json_annotation.dart';

part 'action_dto.g.dart';

///[ActionDTO] contains the properties required in executing an action.
///
/// *[actionString] : string to identify unique action that performs a unique task.
/// *[extras] : map to where you can pass data required for that action to be performed.
@JsonSerializable(
  explicitToJson: true,
  createToJson: false,
)
class ActionDTO {
  String? actionString;
  Map<String, dynamic>? extras;

  ActionDTO(this.actionString, this.extras);

  factory ActionDTO.fromJson(Map<String, dynamic> json) =>
      _$ActionDTOFromJson(json);
}
