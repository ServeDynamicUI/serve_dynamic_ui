import 'package:json_annotation/json_annotation.dart';
import 'package:serve_dynamic_ui/src/dynamic_widgets/index.dart';

part 'tab_dto.g.dart';

///[TabDTO] : dto that holds properties related to [DynamicTabView]
@JsonSerializable(
  explicitToJson: false,
  createToJson: false,
)
class TabDTO {
  final String? title;
  final String? scrollKey;
  final DynamicWidget? child;
  final String? pageUrl;

  TabDTO(
    this.title,
    this.scrollKey,
    this.child,
    this.pageUrl,
  );

  factory TabDTO.fromJson(Map<String, dynamic> json) => _$TabDTOFromJson(json);
}
