
///[FormWidget] : an abstract class that helps to validate and get values from dynamic widgets.
abstract class FormWidget{
  ///helps to get the values present in this widget.
  Map<String,dynamic> getValues();

  ///helps to validate data in this widget.
  bool validate();
}