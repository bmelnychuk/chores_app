import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CompositeForm extends StatefulWidget {
  final Widget child;

  CompositeForm({this.child});

  @override
  _CompositeFormState createState() => _CompositeFormState();
}

class _CompositeFormState extends State<CompositeForm> {
  final Set<SelfSubmitState> selfSubmitWidgets = Set();

  void _register(SelfSubmitState selfSubmitState) {
    selfSubmitWidgets.add(selfSubmitState);
  }

  void _unregister(SelfSubmitState selfSubmitState) {
    selfSubmitWidgets.remove(selfSubmitState);
  }

  @override
  Widget build(BuildContext context) {
    return Provider<_CompositeFormState>.value(
      value: this,
      child: widget.child,
    );
  }
}

mixin _CompositeSubmit on Widget {
  Future<void> submitComposite(BuildContext context) async {
    final compositeForm = context.read<_CompositeFormState>();
    for(SelfSubmitState selfSubmitState in compositeForm.selfSubmitWidgets) {
      await selfSubmitState.submit();
    }
  }
}

class CompositeSubmitButton extends StatelessWidget with _CompositeSubmit {
  final Widget child;
  final void Function() onPressed;

  CompositeSubmitButton({
    @required this.child,
    @required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: child,
      onPressed: () async {
        await submitComposite(context);
        this.onPressed();
      },
    );
  }
}

abstract class SelfSubmitState<T extends StatefulWidget> extends State<T> {
  @override
  @mustCallSuper
  void initState() {
    try {
      final compositeForm = context.read<_CompositeFormState>();
      compositeForm._register(this);
    } catch (e) {
      //ignore
    }
    super.initState();
  }

  @override
  @mustCallSuper
  void deactivate() {
    try {
      final compositeForm = context.read<_CompositeFormState>();
      compositeForm._unregister(this);
    } catch (e) {
      //ignore
    }
    super.deactivate();
  }

  Future<void> submit();
}
