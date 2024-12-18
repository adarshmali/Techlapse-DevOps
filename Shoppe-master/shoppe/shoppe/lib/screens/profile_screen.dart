import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: ProfilePage(),
//     );
//   }
// }

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 100,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: const Padding(
          padding: EdgeInsets.only(left: 24.0, top: 20),
          child: CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage('assets/avatar-13.png'),
          ),
        ),
        title: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Row(
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF004CFF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
                onPressed: () {
                  print("My Activity button pressed");
                },
                child: Text(
                  "My Activity",
                  style: GoogleFonts.raleway(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(width: 80),
              const Icon(
                Icons.card_giftcard,
                color: Color(0xFF004CFF),
                size: 24,
              ),
            ],
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 28.0, top: 20),
            child: Row(
              children: [
                Icon(Icons.menu, color: Color(0xFF004CFF)),
                SizedBox(width: 10),
                Icon(Icons.settings, color: Color(0xFF004CFF)),
              ],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hello, Romina!",
              style: GoogleFonts.raleway(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 236, 234, 234),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Announcement",
                          style: GoogleFonts.raleway(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: const Color.fromARGB(255, 0, 0, 0),
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit.\nMaecenas hendrerit luctus libero ac vulputate.",
                          style: GoogleFonts.nunitoSans(
                            fontSize: 10,
                            color: const Color.fromARGB(255, 0, 0, 0),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/live_screen');
                    },
                    child: const Icon(
                      Icons.arrow_forward,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // My Orders Section
            Text(
              "My Orders",
              style: GoogleFonts.raleway(
                fontSize: 21,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFE5EBFC),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      "To Pay",
                      style: GoogleFonts.raleway(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF0042E0),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFE5EBFC),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      "To Receive",
                      style: GoogleFonts.raleway(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF0042E0),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFE5EBFC),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      "To Review",
                      style: GoogleFonts.raleway(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF0042E0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Recently Viewed Section
            Text(
              "Recently viewed",
              style: GoogleFonts.raleway(
                fontSize: 21,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: 335,
              height: 60,
              margin: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(5, (index) {
                  String imageName = 'assets/image${index + 1}.png';
                  return Container(
                    width: 60,
                    height: 60,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x298D8D8D),
                          blurRadius: 10,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Center(
                      child: CircleAvatar(
                        radius: 25,
                        backgroundImage: AssetImage(imageName),
                      ),
                    ),
                  );
                }),
              ),
            ),
            const SizedBox(height: 20),

            // Stories Section
            Text(
              "Stories",
              style: GoogleFonts.raleway(
                fontSize: 21,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 175,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                separatorBuilder: (_, __) => const SizedBox(width: 10),
                itemBuilder: (context, index) {
                  String imageName = 'assets/image${index + 1}.png';
                  return Container(
                    width: 104,
                    height: 175,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                        image: AssetImage(imageName),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: Container(
          height: 84,
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Color(0x1A000000), // 10% opacity shadow
                blurRadius: 1,
                offset: Offset(0, -1),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: const Icon(Icons.home, color: Color(0xFF004CFF), size: 28),
                onPressed: () {
                  print("Home button pressed");
                },
              ),
              IconButton(
                icon: const Icon(Icons.favorite, color: Color(0xFF004CFF), size: 28),
                onPressed: () {
                  print("Favorite button pressed");
                },
              ),
              IconButton(
                icon: const Icon(Icons.list_alt, color: Color(0xFF004CFF), size: 28),
                onPressed: () {
                  print("Orders button pressed");
                },
              ),
              IconButton(
                icon: const Icon(Icons.shopping_cart_outlined, color: Color(0xFF004CFF), size: 28),
                onPressed: () {
                  print("Cart button pressed");
                },
              ),
              IconButton(
                icon: const Icon(Icons.person_outline, color: Color(0xFF004CFF), size: 28),
                onPressed: () {
                  print("Profile button pressed");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
