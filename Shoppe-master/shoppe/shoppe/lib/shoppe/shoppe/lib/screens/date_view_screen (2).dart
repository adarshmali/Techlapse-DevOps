import 'package:flutter/material.dart';
import 'package:shoppe/screens/cart_empty_screen.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Recently Viewed',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const DateViewedScreen(),
//     );
//   }
// }

class DateViewedScreen extends StatefulWidget {
  const DateViewedScreen({super.key});

  @override
  _RecentlyViewedScreenState createState() => _RecentlyViewedScreenState();
}

class _RecentlyViewedScreenState extends State<DateViewedScreen> {
  String selectedButton = 'Today';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Recently viewed',
          style: TextStyle(
            fontFamily: 'Raleway',
            fontSize: 29,
            fontWeight: FontWeight.w700,
            color: Color(0xFF202020),
            letterSpacing: -0.29,
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Toggle Buttons Row
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Row(
                children: [
                  _buildToggleButton('Today'),
                  const SizedBox(width: 8),
                  _buildToggleButton('December 07'),
                  const Spacer(),
                  // Dropdown Button
                  IconButton(
                    onPressed: () {
                      // Add dropdown functionality
                    },
                    icon: const Icon(
                      Icons.arrow_drop_down,
                      color: Color(0xFF004BFE),
                    ),
                  ),
                ],
              ),
            ),
            // Scrollable Content
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 0.65,
                  ),
                  itemCount: 6, // Replace with the actual item count
                  itemBuilder: (context, index) {
                    return _buildProductCard(
                      image: 'assets/image${index + 1}.png', // Replace with actual paths
                      title: 'Lorem ipsum dolor sit amet consectetur',
                      price: '\$17.00',
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          if (index == 0) {
            // Navigate to RecentlyViewedScreen
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const CartPage()),
            );
          }
          
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.article_outlined),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message_outlined),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: '',
          ),
        ],
      ),
    );
  }

  // Build Toggle Button
  Widget _buildToggleButton(String text) {
    bool isSelected = text == selectedButton;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedButton = text;
        });
      },
      child: Container(
        width: 146,
        height: 30,
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue : Colors.transparent,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: isSelected ? Colors.blue : Colors.grey,
          ),
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style: TextStyle(
            fontFamily: 'Raleway',
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: isSelected ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }

  // Build Product Card
  Widget _buildProductCard({
    required String image,
    required String title,
    required String price,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product Image
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
            child: Image.asset(
              image,
              height: 171,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return const Icon(
                  Icons.broken_image,
                  size: 50,
                  color: Colors.grey,
                );
              },
            ),
          ),
          const SizedBox(height: 8),
          // Product Title
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontFamily: 'Nunito Sans',
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            ),
          ),
          const Spacer(),
          // Product Price
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
            child: Text(
              price,
              style: const TextStyle(
                fontFamily: 'Raleway',
                fontSize: 17,
                fontWeight: FontWeight.w700,
                color: Color(0xFF202020),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
