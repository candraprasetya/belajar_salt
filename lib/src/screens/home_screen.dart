part of 'screens.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  //_buildHeaderText
  //headerText
  //HeaderText

  Widget _buildHeaderText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('MyIFA'),
        Text('Impresive Financial Assistant'),
      ],
    );
  }

  Widget _buildDescriptionText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Mencatat Keuangan Lebih Mudah!'),
        Text('Untuk financial planning kamu apa pun tujuanmu'),
      ],
    );
  }

  Widget _buildImage() {
    return Image.network(
        'https://www.kindpng.com/picc/m/355-3557482_flutter-logo-png-transparent-png.png');
  }

  Widget _buildButton() {
    return Column(
      children: [
        //Buat Button disini
        ElevatedButton(
          child: Text('Elevated Button'),
          style: ElevatedButton.styleFrom(
            primary: Colors.green,
          ),
          onPressed: () {},
        ),
        SizedBox(
          height: 16,
        ),
        //Buat Text Button disini
        TextButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              overlayColor: MaterialStateProperty.resolveWith<Color?>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.hovered))
                    return Colors.blue.withOpacity(0.04);
                  if (states.contains(MaterialState.focused) ||
                      states.contains(MaterialState.pressed))
                    return Colors.blue.withOpacity(0.12);
                  return null; // Defer to the widget's default.
                },
              ),
            ),
            onPressed: () {},
            child: Text('TextButton'))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          _buildHeaderText(),
          SizedBox(height: 24),
          _buildDescriptionText(),
          SizedBox(height: 24),
          _buildImage(),
          SizedBox(height: 24),
          _buildButton()
        ],
      ),
    ));
  }
}
