import 'package:flutter/material.dart';

class CompositeForm extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final List<SelfSubmitWidget> children;
  final Widget submit;
  final void Function() onSubmit;

  CompositeForm({
    this.children = const [],
    @required this.submit,
    @required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidate: true,
      child: Column(
        children: <Widget>[
          ...children,
          SizedBox(height: 8),
          Container(
            child: RaisedButton(
              child: submit,
              onPressed: () async {
                if (_formKey.currentState.validate()) {
                  await Future.wait(children.map((c) => c.submit()));
                  onSubmit();
                }
              },
            ),
          )
        ],
      ),
    );
  }
}

mixin SelfSubmitWidget on Widget {
  Future<void> submit() async {}
}
