import 'package:flutter/material.dart';
import 'package:shoppe/screens/date_view_screen.dart';

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
//       home: const CalenderScreen(),
//     );
//   }
// }

class CalenderScreen extends StatefulWidget {
  const CalenderScreen({super.key});

  @override
  _RecentlyViewedScreenState createState() => _RecentlyViewedScreenState();
}

class _RecentlyViewedScreenState extends State<CalenderScreen> {
  String selectedButton = 'Today';
  DateTime selectedDate = DateTime.now();

  // Helper function to get a list of days for the current month
  List<DateTime> _getDaysInMonth(DateTime month) {
    final firstDayOfMonth = DateTime(month.year, month.month, 1);
    final lastDayOfMonth = DateTime(month.year, month.month + 1, 0);
    List<DateTime> daysInMonth = [];
    
    for (int i = 0; i < lastDayOfMonth.day; i++) {
      daysInMonth.add(firstDayOfMonth.add(Duration(days: i)));
    }
    return daysInMonth;
  }

  @override
  Widget build(BuildContext context) {
    List<DateTime> daysInMonth = _getDaysInMonth(selectedDate);

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
            // Custom Calendar Widget
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 242, 232, 232),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 6,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    // Calendar Header (Month & Year)
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.arrow_left),
                            onPressed: () {
                              setState(() {
                                selectedDate = DateTime(selectedDate.year, selectedDate.month - 1);
                              });
                            },
                          ),
                          Text(
                            '${selectedDate.month} / ${selectedDate.year}',
                            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          IconButton(
                            icon: const Icon(Icons.arrow_right),
                            onPressed: () {
                              setState(() {
                                selectedDate = DateTime(selectedDate.year, selectedDate.month + 1);
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    // Calendar Grid (Days of the month)
                    GridView.builder(
                      shrinkWrap: true,
                      padding: const EdgeInsets.all(8.0),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 7,
                        crossAxisSpacing: 8.0,
                        mainAxisSpacing: 8.0,
                      ),
                      itemCount: daysInMonth.length,
                      itemBuilder: (context, index) {
                        DateTime day = daysInMonth[index];
                        bool isSelected = day.day == selectedDate.day &&
                            day.month == selectedDate.month &&
                            day.year == selectedDate.year;

                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedDate = day;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: isSelected ? Colors.lightBlue : Colors.transparent,
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.grey, width: 0.5),
                            ),
                            child: Center(
                              child: Text(
                                '${day.day}',
                                style: TextStyle(
                                  color: isSelected ? Colors.white : Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
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
              MaterialPageRoute(builder: (_) => const DateViewedScreen()),
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
