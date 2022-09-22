part of 'widgets.dart';

class ContactWidget extends StatelessWidget {
  final ContactModel data;

  const ContactWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(children: [
        Image.network(
          data.imageUrl,
          fit: BoxFit.cover,
          width: 46,
          height: 46,
        ),
        SizedBox(width: 16),
        Column(
          children: [
            Text(data.name),
            SizedBox(height: 4),
            Text(data.phone),
          ],
        )
      ]),
    );
  }
}
