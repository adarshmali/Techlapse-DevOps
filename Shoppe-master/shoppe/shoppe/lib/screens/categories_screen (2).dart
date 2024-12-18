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
//       home: CategoriesPage(),
//     );
//   }
// }

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  String selectedTab = "Female"; // Default selected tab

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.black),
          onPressed: () {},
        ),
        title: const Text(
          "All Categories",
          style: TextStyle(
            color: Colors.black,
            fontSize: 29,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: [
          // Tabs
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: ["All", "Female", "Male"].map((tab) {
              bool isActive = selectedTab == tab;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedTab = tab;
                  });
                },
                child: Container(
                  width: 107,
                  height: 38,
                  decoration: BoxDecoration(
                    color: isActive
                        ? const Color(0xFF004CFF)
                        : const Color(0xFFF9F9F9),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(9),
                      topRight: Radius.circular(9),
                    ),
                    border: isActive
                        ? Border.all(color: const Color(0xFF004CFF))
                        : Border.all(color: Colors.transparent),
                  ),
                  child: Center(
                    child: Text(
                      tab,
                      style: TextStyle(
                        color: isActive ? Colors.white : Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 20),

          // Clothing Section
          const CategoryTile(
            title: "Clothing",
            imagePath: "assets/clothing.png", // Replace with your image path
            subcategories: [
              "Dresses",
              "Pants",
              "Skirts",
              "Shorts",
              "Jackets",
              "Hoodies",
              "Shirts",
              "Polo",
              "T-Shirts",
              "Tunics",
            ],
          ),

          // Other categories
          const CategoryTile(
            title: "Shoes",
            imagePath: "assets/shoes.png", // Replace with your image path
          ),
          const CategoryTile(
            title: "Bags",
            imagePath: "assets/bags.png", // Replace with your image path
          ),
          const CategoryTile(
            title: "Lingerie",
            imagePath: "assets/lingerie.png", // Replace with your image path
          ),
          const CategoryTile(
            title: "Accessories",
            imagePath: "assets/access.png", // Replace with your image path
          ),
          const CategoryTile(
            title: "Just for You",
            imagePath: "assets/access.png", // Replace with your image path
            isLast: true,
            showStar: true, // Enable the star for this tile
          ),
        ],
      ),
    );
  }
}

class CategoryTile extends StatefulWidget {
  final String title;
  final String imagePath;
  final List<String>? subcategories;
  final bool isLast;
  final bool showStar;

  const CategoryTile({
    super.key,
    required this.title,
    required this.imagePath,
    this.subcategories,
    this.isLast = false,
    this.showStar = false, // Optional flag for adding a star
  });

  @override
  State<CategoryTile> createState() => _CategoryTileState();
}
class _CategoryTileState extends State<CategoryTile> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              isExpanded = !isExpanded;
            });
          },
          child: Container(
            width: double.infinity,
            height: 50,
            margin: EdgeInsets.only(top: widget.isLast ? 20 : 10),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(7),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x1A000000),
                  offset: Offset(0, 5),
                  blurRadius: 10,
                ),
              ],
            ),
            child: Row(
              children: [
                Image.asset(widget.imagePath, width: 44, height: 44), // Replace with image
                const SizedBox(width: 10),
                Text(
                  widget.title,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const Spacer(),
                if (widget.showStar)
                  Container(
                    width: 18,
                    height: 20,
                    margin: const EdgeInsets.only(right: 150), // Move closer to text
                    decoration: const BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Color.fromARGB(255, 255, 255, 255), // Blue background
                    ),
                    child: const Icon(
                      Icons.star,
                      size: 21,
                      color: Color.fromARGB(255, 31, 7, 241), // White star
                    ),
                  ),

                Icon(
                  isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                  color: Colors.black,
                ),
              ],
            ),
          ),
        ),

        // Expanded Content for "Just for You"
        if (isExpanded && widget.title == "Just for You")
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/review_screen');
            },
            child: Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(top: 10), // Adjust spacing
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: const Color(0xFF004CFF), // Blue background
                borderRadius: BorderRadius.circular(5), // Optional for rounded edges
              ),
              child: const Icon(
                Icons.arrow_forward, // Use any icon or widget
                size: 14.46,
                color: Colors.white,
              ),
            ),
          ),

        // Expanded Content for Subcategories
        if (isExpanded && widget.subcategories != null && widget.title != "Just for You")
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: widget.subcategories!.map((sub) {
              return Container(
                width: 163,
                height: 40,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(7),
                  border: Border.all(color: const Color(0xFFFFEBEB)),
                ),
                child: Text(
                  sub,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              );
            }).toList(),
          ),
      ],
    );
  }
}
