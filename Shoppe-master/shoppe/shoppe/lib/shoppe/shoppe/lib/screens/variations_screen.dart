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

class VariationsScreen extends StatefulWidget {
  const VariationsScreen({super.key});

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<VariationsScreen> {
  bool isFavorite = false;
  int quantity = 1;
  String selectedSize = "M";

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Background Image
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/blur.png', // Replace with your image path
              width: size.width,
              height: size.height * 0.5,
              fit: BoxFit.cover,
            ),
          ),

          // Blurred Background
          Positioned(
            top: size.height * 0.3,
            left: 0,
            right: 0,
            child: Container(
              height: size.height * 0.6,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Price Section
                  Padding(
                    padding: const EdgeInsets.all(24),
                    child: Row(
                      children: [
                        const CircleAvatar(
                          backgroundImage:
                              AssetImage('assets/product.png'), // Replace
                          radius: 39,
                        ),
                        const SizedBox(width: 24),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              '\$17,00',
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                             const SizedBox(height: 5),
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: const Color.fromARGB(255, 226, 231, 235),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: const Text(
                                    'Pink',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 17, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: const Color.fromARGB(255, 226, 231, 235),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: const Text(
                                    'M',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  // Color Options
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 18),
                    child: Text(
                      'Color Options',
                      style: TextStyle(
                        fontFamily: 'Raleway',
                        fontSize: 21,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: Row(
                      children: [
                        for (int i = 0; i < 4; i++) ...[
                          Container(
                            margin: const EdgeInsets.only(right: 8),
                            width: 84,
                            height: 84,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: const DecorationImage(
                                 image: AssetImage('assets/banner.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ]
                      ],
                    ),
                  ),

                  const SizedBox(height: 21),

                  // Size Label
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      'Size',
                      style: TextStyle(
                        fontFamily: 'Raleway',
                        fontSize: 21,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Size Bar
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 22),
                    child: Row(
                      children: [
                        for (String size in ['S', 'M', 'L', 'XL', 'XXL'])
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedSize = size;
                              });
                            },
                            child: Container(
                              margin: const EdgeInsets.only(right: 9),
                              width: 60,
                              height: 40,
                              decoration: BoxDecoration(
                                color: selectedSize == size
                                    ? Colors.blue
                                    : Colors.grey[200],
                                borderRadius: BorderRadius.circular(8),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                size,
                                style: TextStyle(
                                  color: selectedSize == size
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),

                   const SizedBox(height: 22),

  // Quantity Bar
  const Padding(
  padding: EdgeInsets.symmetric(horizontal: 20),
  child: Text(
    'Quantity',
    style: TextStyle(
      fontFamily: 'Raleway',
      fontSize: 21,
      fontWeight: FontWeight.w700,
    ),
  ),
),
const SizedBox(height: 15),
Padding(
  padding: const EdgeInsets.symmetric(horizontal: 20),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      GestureDetector(
        onTap: () {
          setState(() {
            if (quantity > 1) quantity--;
          });
        },
        child: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.blue),
            borderRadius: BorderRadius.circular(15),
          ),
          alignment: Alignment.center,
          child: const Icon(Icons.remove, color: Colors.blue),
        ),
      ),
      Container(
        width: 74,
        height: 50,
        alignment: Alignment.center,
        margin: const EdgeInsets.only(left: 6, top: 7), // Adjusting position
        child: Text(
          quantity.toString(),
          style: const TextStyle(fontSize: 18),
        ),
      ),
      GestureDetector(
        onTap: () {
          setState(() {
            quantity++;
          });
        },
        child: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.blue),
            borderRadius: BorderRadius.circular(15),
          ),
          alignment: Alignment.center,
          child: const Icon(Icons.add, color: Colors.blue),
        ),
      ),
    ],
  ),
),
],
),
),
),

          // Bottom Buttons
          Positioned(
            bottom: 20,
            left: 20,
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
                      Navigator.pushNamed(context, '/recent_screen');  // Buy now functionality
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