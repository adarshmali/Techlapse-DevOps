import 'dart:async';
import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: ProductPage(),
//     );
//   }
// }

class SaleScreen extends StatefulWidget {
  const SaleScreen({super.key});

  @override
  State<SaleScreen> createState() => _ProductPageState();
}

class _ProductPageState extends State<SaleScreen> {
  bool isFavorite = false; // Heart icon state
  Duration remainingTime = const Duration(hours: 0, minutes: 36, seconds: 58); // Initial timer value

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingTime.inSeconds > 0) {
        setState(() {
          remainingTime -= const Duration(seconds: 1);
        });
      } else {
        timer.cancel();
      }
    });
  }

  String formatTime(Duration time) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    return "${twoDigits(time.inMinutes.remainder(60))}:${twoDigits(time.inSeconds.remainder(60))}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: Stack(
        children: [
          // Fullscreen image
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset(
              'assets/product.png', // Replace with your image file
              width: MediaQuery.of(context).size.width,
              height: 447,
              fit: BoxFit.cover,
            ),
          ),

         // Timer bar with hours, minutes, and seconds separately
Positioned(
  top: 464,
  left: 194,
  child: Container(
    width: 150, // Adjusted width to fit the new design
    height: 40, // Adjusted height to match the uploaded design
    decoration: BoxDecoration(
      color: const Color(0xFFFFEDED), // Light pink background color
      borderRadius: BorderRadius.circular(8),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Timer icon
        const Padding(
          padding: EdgeInsets.only(left: 6),
          child: Icon(
            Icons.timer,
            size: 20,
            color: Color(0xFF004CFF), // Blue timer icon
          ),
        ),
        // Timer values (hours, minutes, seconds)
        Text(
          "${remainingTime.inHours.toString().padLeft(2, '0')} : ${remainingTime.inMinutes.remainder(60).toString().padLeft(2, '0')} : ${remainingTime.inSeconds.remainder(60).toString().padLeft(2, '0')}",
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontFamily: 'Raleway',
            color: Color(0xFF202020), // Dark text color
          ),
        ),
      ],
    ),
  ),
),


          // New price
          const Positioned(
            top: 457,
            left: 19,
            child: SizedBox(
              width: 94,
              height: 37,
              child: Center(
                child: Text(
                  '\$24,00',
                  style: TextStyle(
                    fontFamily: 'Raleway',
                    fontSize: 29,
                    fontWeight: FontWeight.w800,
                    color: Colors.black,
                    letterSpacing: -0.26,
                  ),
                ),
              ),
            ),
          ),

          // Share button
          Positioned(
            top: 465,
            left: 362,
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: const Color(0xFFFFEBEB),
                borderRadius: BorderRadius.circular(15),
              ),
              child: IconButton(
                onPressed: () {
                  // Share functionality
                },
                icon: const Icon(
                  Icons.share,
                  color: Colors.black,
                  size: 18,
                ),
              ),
            ),
          ),

          // Strike-through price
          const Positioned(
            top: 496,
            left: 20,
            child: Text(
              '\$30,00',
              style: TextStyle(
                fontFamily: 'Raleway',
                fontSize: 15,
                fontWeight: FontWeight.w800,
                height: 1.33,
                letterSpacing: 0.16,
                decoration: TextDecoration.lineThrough,
                decorationColor: Colors.red,
                color: Color(0xFFF1AEAE),
              ),
            ),
          ),

          // Sale badge
          Positioned(
            top: 495,
            left: 75,
            child: Container(
              width: 40,
              height: 19,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFFFF5790), Color(0xFFF81140)],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5),
                  bottomRight: Radius.circular(5),
                ),
              ),
              child: const Center(
                child: Text(
                  '-20%',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),

          // Product description
          const Positioned(
            top: 530,
            left: 20,
            right: 20,
            child: Text(
              'Lorem ipsum dolor sit amet, consectetur\nadipiscing elit. Etiam arcu mauris, scelerisque\neu mauris id, pretium pulvinar sapien.',
              style: TextStyle(
                fontFamily: 'Raleway',
                fontSize: 15,
                color: Colors.black,
                height: 1.5,
              ),
            ),
          ),

          // Variations
          Positioned(
            top: 612,
            left: 20,
            right: 20,
            child: Row(
              children: [
                const SizedBox(
                  width: 96,
                  height: 26,
                  child: Text(
                    'Variations',
                    style: TextStyle(
                      fontFamily: 'Raleway',
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: Colors.black,
                      letterSpacing: -0.2,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[300],
                    minimumSize: const Size(60, 26),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Pink',
                    style: TextStyle(color: Colors.black, fontSize: 14),
                  ),
                ),
                const SizedBox(width: 5),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[300],
                    minimumSize: const Size(60, 26),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'M',
                    style: TextStyle(color: Colors.black, fontSize: 14),
                  ),
                ),
                const Spacer(),
                Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    color: const Color(0xFF004CFF),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/categories_screen');
                    },
                    icon: const Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                      size: 17,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Image boxes
          Positioned(
            top: 670,
            left: 20,
            child: Row(
              children: [
                Image.asset(
                  'assets/clothing.png',
                  width: 85,
                  height: 85,
                ),
                const SizedBox(width: 2),
                Image.asset(
                  'assets/image2.png',
                  width: 85,
                  height: 85,
                ),
                const SizedBox(width: 2),
                Image.asset(
                  'assets/image4.png',
                  width: 85,
                  height: 85,
                ),
              ],
            ),
          ),

          // Slide Bar with Dots
          Positioned(
            top: 419,
            left: 135,
            child: Row(
              children: List.generate(6, (index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 6),
                  child: Container(
                    width: index == 0 ? 40 : 10,
                    height: 10,
                    decoration: BoxDecoration(
                      color: index == 0 ? const Color(0xFF0042E0) : Colors.grey,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                );
              }),
            ),
          ),

          // Bottom Buttons (Favorites, Add to Cart, Buy Now)
          Positioned(
            bottom: 20,
            left: 10,
            right: 20,
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      isFavorite = !isFavorite;
                    });
                  },
                  icon: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: isFavorite ? Colors.red : Colors.black,
                  ),
                  iconSize: 34,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // Add to cart functionality
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF000000),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: const Text(
                      'Add to cart',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // Buy now functionality
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF0015E7),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: const Text(
                      'Buy now',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
