part of 'screens.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //posisi index = 0

    return Scaffold(
      appBar: AppBar(title: Text('List Kontak')),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          return ContactWidget(
            data: contacts[index],
          );
        },
      ),
    );
  }
}
