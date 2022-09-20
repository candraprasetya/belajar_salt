part of 'screens.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            //TODO Baris Pertama
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
              child: Image.network(
                'https://cdn1.iconfinder.com/data/icons/google-s-logo/150/Google_Icons-09-1024.png',
                height: 24,
                width: 24,
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100))),
              child: Image.asset(
                'assets/images/logo_google.png',
                height: 24,
                width: 24,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(FontAwesomeIcons.google),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Image.network(
                    "https://images.unsplash.com/photo-1661961110144-12ac85918e40?ixlib=rb-1.2.1&ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1770&q=80",
                    height: 64,
                    fit: BoxFit.cover,
                  ),
                ),
                Expanded(
                  child: Image.network(
                    "https://images.unsplash.com/photo-1661961110144-12ac85918e40?ixlib=rb-1.2.1&ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1770&q=80",
                    height: 64,
                    fit: BoxFit.cover,
                  ),
                ),
                Expanded(
                  child: Image.network(
                    "https://images.unsplash.com/photo-1661961110144-12ac85918e40?ixlib=rb-1.2.1&ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1770&q=80",
                    height: 64,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
            //TODO Baris Kedua
            Image.network(
              "https://images.unsplash.com/photo-1661961110144-12ac85918e40?ixlib=rb-1.2.1&ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1770&q=80",
              width: 64,
              height: 64,
              fit: BoxFit.cover,
            ),
            //TODO Baris Ketiga
            Image.network(
              "https://images.unsplash.com/photo-1661961110144-12ac85918e40?ixlib=rb-1.2.1&ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1770&q=80",
              width: 64,
              height: 64,
              fit: BoxFit.cover,
            ),
            //TODO Baris Keempat
            Image.network(
              "https://images.unsplash.com/photo-1661961110144-12ac85918e40?ixlib=rb-1.2.1&ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1770&q=80",
              width: 64,
              height: 64,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    ));
  }
}
