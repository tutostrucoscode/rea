class FormFieldModel {
  String field1;
  String field2;
  String field3;
  String field4;
  String field5;
  String field6;
  String field7;
  String field8;
  String field9;

  FormFieldModel(this.field1, this.field2, this.field3, this.field4,
      this.field5, this.field6, this.field7, this.field8, this.field9);

  Map<String, dynamic> toJson() => {
        'field1': field1,
        'field2': field2,
        'field3': field3,
        'field4': field4,
        'field5': field5,
        'field6': field6,
        'field7': field7,
        'field8': field8,
        'field9': field9,
      };
}
