
///[FormWidget] : an abstract class that helps to validate and get values from dynamic widgets.
abstract class FormWidget{
  Map<String,dynamic> getValues();
  bool validate();
}