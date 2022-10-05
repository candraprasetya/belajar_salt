part of 'widgets.dart';

class LifecycleWidget extends StatefulWidget {
  final Widget child;

  const LifecycleWidget({super.key, required this.child});

  @override
  State<LifecycleWidget> createState() => _LifecycleWidgetState();
}

class _LifecycleWidgetState extends State<LifecycleWidget>
    with WidgetsBindingObserver {
  //DONE: Kita akan tambahkan initState

  @override
  void initState() {
    // DONE: implement initState
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  //DONE: Kita tambahakan didChangeAppLifecycleState
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // TODO: implement didChangeAppLifecycleState
    print('AppLifecycleState: $state');
    if (state == AppLifecycleState.resumed) {
      print('KAMU JELEK!!!');
    }
    super.didChangeAppLifecycleState(state);
  }

  //DONE: Kita tambahkan dispose
  @override
  void dispose() {
    // DONE: implement dispose
    WidgetsBinding.instance.addObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
