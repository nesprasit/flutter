import 'package:flutter/material.dart';

class FormDialog {
  Function(String nickName, String firstName, String lastName) submit;

  FormDialog.show({BuildContext context,this.submit}) {
    showDialog(
      context: context,
      child: _FormDialog(
        context: context,
        formObj: this,
      ),
    );
  }
}

class _FormDialog extends Dialog {
  BuildContext _context;
  FormDialog _formObj;

  final nickNameTextEditController = TextEditingController();
  final firstNameTextEditController = TextEditingController();
  final lastNameTextEditController = TextEditingController();

  _FormDialog({BuildContext context, FormDialog formObj}) {
    this._context = context;
    this._formObj = formObj;
  }

  @override
  Color get backgroundColor => Colors.transparent;

  @override
  ShapeBorder get shape => RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      );

  @override
  Widget get child => Form(
        child: Container(
          padding:
              const EdgeInsets.only(top: 12, bottom: 12, left: 16, right: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "User infomation",
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 14),
                child: TextFormField(
                  controller: nickNameTextEditController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Nick name',
                  ),
                  onChanged: (value) {},
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 14),
                child: TextFormField(
                  controller: firstNameTextEditController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'First name',
                  ),
                  onChanged: (value) {},
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 14),
                child: TextFormField(
                  controller: lastNameTextEditController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Last name',
                  ),
                  onChanged: (value) {},
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 19),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    FlatButton(
                      color: Colors.grey.withOpacity(0.5),
                      onPressed: () {
                        Navigator.pop(_context);
                      },
                      child: Text(
                        'Cancel',
                        style: TextStyle(color: Colors.black.withOpacity(0.8)),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 10),
                      child: FlatButton(
                        color: Colors.blue,
                        onPressed: () {
                          Navigator.pop(_context);
                          _formObj.submit?.call(
                              nickNameTextEditController?.text ?? '',
                              firstNameTextEditController?.text ?? '',
                              lastNameTextEditController?.text ?? '');
                        },
                        child: Text(
                          'Save',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      );
}
