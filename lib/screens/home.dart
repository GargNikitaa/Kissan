import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'login.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // List of images for the slider
  final List<String> imgList = [
    'https://media.istockphoto.com/id/1453962739/photo/the-middle-aged-indian-farmer-is-smiling-while-showing-his-monthly-income-indian-model.jpg?s=612x612&w=0&k=20&c=YdevYcNxwoQB1efBaOzATJywHHarzzpXAQ7Sd_fTniY=', // Replace with actual image URLs or local assets
    'https://img.freepik.com/premium-photo/happy-indian-farmer-counting-money-home_75648-7346.jpg',
    'https://media.istockphoto.com/id/1330214199/photo/indian-farmer-busy-using-mobile-phone-while-sitting-in-between-the-crop-seedlings-inside.jpg?s=612x612&w=0&k=20&c=PmGOwjZlQdOhETmjVwBoT4thL3mJn3VfEm5q9doj4aU=',
  ];

  int _selectedIndex = 0; // Selected index for bottom navigation

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    // Handle navigation based on the index
    if (index == 0) {
      // Navigate to Home
    } else if (index == 1) {
      // Navigate to Feed
    } else if (index == 2) {
      // Navigate to Crop Care
    } else if (index == 3) {
      // Navigate to Mandi
    } else if (index == 4) {
      // Navigate to Account
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Feed"),
        backgroundColor: Colors.green[200],
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // Notification button action
            },
          ),
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () {
              // Filter button action
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Search bar
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.green[100],
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    hintText: 'Search',
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
              ),
            ),
            // Category buttons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: const [
                    CategoryButton(icon: Icons.grain, label: 'My Crop'),
                    CategoryButton(icon: Icons.info, label: 'Krishi Gyaan'),
                    CategoryButton(icon: Icons.wb_sunny, label: 'Weather News'),
                    CategoryButton(icon: Icons.attach_money, label: 'Market Price'),
                    CategoryButton(icon: Icons.show_chart, label: 'Soil Health'),
                  ],
                ),
              ),
            ),
            // Tabs: Posts, Videos, Community
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  TabButton(label: 'Posts'),
                  TabButton(label: 'Videos'),
                  TabButton(label: 'Community'),
                ],
              ),
            ),
            // Image carousel slider
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: CarouselSlider(
                options: CarouselOptions(
                  height: 200.0,
                  autoPlay: true,
                  enlargeCenterPage: true,
                ),
                items: imgList
                    .map((item) => ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            item,
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        ))
                    .toList(),
              ),
            ),
            // Wheat info card
            // Updated Wheat Info Card
Padding(
  padding: const EdgeInsets.all(13.0),
  child: Container(
    decoration: BoxDecoration(
      color: Colors.green[100], // Change to a more elegant white background
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.2),
          spreadRadius: 3,
          blurRadius: 6,
          offset: Offset(0, 3), // changes position of shadow
        ),
      ],
    ),
    padding: const EdgeInsets.all(16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(Icons.grain, color: Colors.brown, size: 30), // Wheat icon
                const SizedBox(width: 10),
                Text(
                  "Wheat",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.brown[700],
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.green[700],
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                "Available",
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: const [
            Icon(Icons.location_on, size: 16, color: Colors.grey),
            SizedBox(width: 5),
            Text(
              "Location: Delhi",
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: const [
            Icon(Icons.date_range, size: 16, color: Colors.grey),
            SizedBox(width: 5),
            Text(
              "8 Sept 2024",
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Text(
          "Rs. 5600/kg",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.green[700],
          ),
        ),
        const SizedBox(height: 12),
        Align(
          alignment: Alignment.bottomRight,
          child: TextButton(
            onPressed: () {
              // Navigate to details page
            },
            child: const Text(
              "View more >>",
              style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ],
    ),
  ),
),

            const SizedBox(height: 20),
          ],
        ),
      ),
      // Updated bottom navigation bar
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: _selectedIndex == 0 ? Colors.green : Colors.grey),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.feed, color: _selectedIndex == 1 ? Colors.green : Colors.grey),
            label: 'Feed',
          ),
          BottomNavigationBarItem(
            icon: Container(
              decoration: BoxDecoration(
                color: Colors.green[200],
                shape: BoxShape.circle,
              ),
              padding: EdgeInsets.all(8), // Increase the padding for a larger icon
              child: Icon(Icons.local_florist, color: _selectedIndex == 2 ? Colors.green : Colors.grey),
            ),
            label: 'Crop Care',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.store, color: _selectedIndex == 3 ? Colors.green : Colors.grey),
            label: 'Mandi',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: _selectedIndex == 4 ? Colors.green : Colors.grey),
            label: 'Account',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

// Custom widget for Category buttons
class CategoryButton extends StatelessWidget {
  final IconData icon;
  final String label;

  const CategoryButton({Key? key, required this.icon, required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: Colors.green[200],
            radius: 30,
            child: Icon(icon, color: Colors.white),
          ),
          const SizedBox(height: 8),
          Text(label, style: const TextStyle(fontSize: 14)),
        ],
      ),
    );
  }
}

// Custom widget for Tabs
class TabButton extends StatelessWidget {
  final String label;

  const TabButton({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        Container(
          height: 2,
          width: 40,
          color: Colors.green,
        ),
      ],
    );
  }
}
