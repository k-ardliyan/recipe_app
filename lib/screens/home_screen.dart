import 'package:flutter/material.dart';
import 'package:recipe_app/config/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

final List<Map<String, String>> recipes = [
  {
    "title": "Spiced Fried Chicken",
    "area": "Indonesian",
    "category": "Chicken",
    "image": 'https://picsum.photos/600/300',
  },
  {
    "title": "Beef Steak",
    "area": "American",
    "category": "Beef",
    "image": 'https://picsum.photos/600/301',
  },
  {
    "title": "Shrimp Pasta",
    "area": "Italian",
    "category": "Pasta",
    "image": 'https://picsum.photos/600/302',
  },
];

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: buildBody(context),
      ),
      bottomNavigationBar: buildBottomNavBar(),
    );
  }

  Widget buildAppBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 24.0,
        top: 12.0,
        right: 24.0,
      ),
      child: Row(
        children: [
          const CircleAvatar(
            backgroundImage: NetworkImage(
              'https://picsum.photos/150/150',
            ), // User profile image
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome, 👋",
                style: TextStyle(color: Colors.grey[400]),
              ),
              const Text(
                "Annisa Gita R.",
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const Spacer(),
          IconButton(
            icon: const Icon(Icons.notifications_none),
            onPressed: () {
              SharedPreferences.getInstance().then((prefs) {
                prefs.clear();
              });
              Navigator.pushReplacementNamed(context, AppRoutes.splash);
            },
          ),
        ],
      ),
    );
  }

  Widget buildBody(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildAppBar(context),
            const SizedBox(height: 24),
            buildSearch(),
            const SizedBox(height: 24),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                "What's in your fridge?",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 16),
            buildIngredientFilter(),
            const SizedBox(height: 24),
            buildCategoryTabs(),
            const SizedBox(height: 16),
            buildRecipeList(context),
          ],
        ),
      ),
    );
  }

  Widget buildSearch() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: TextField(
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(16),
          hintText: 'Type ingredients...',
          hintStyle: TextStyle(
            color: Colors.grey[400],
            fontSize: 14,
          ),
          suffixIcon: const Icon(Icons.search),
          suffixIconColor: Colors.grey[400],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.grey[100],
        ),
      ),
    );
  }

  Widget buildIngredientFilter() {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            buildFilterChip("Chicken", isActive: true),
            buildFilterChip("Beef Meat"),
            buildFilterChip("Shrimp"),
            buildFilterChip("Fish"),
            buildFilterChip("Broccoli"),
            buildFilterChip("Egg"),
            buildFilterChip("Cucumber"),
          ],
        ),
      ),
    );
  }

  Widget buildFilterChip(String label, {bool? isActive = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Chip(
        label: Text(
          label,
          style: TextStyle(
            color: (isActive ?? false) ? Colors.white : Colors.grey[400],
          ),
        ),
        backgroundColor: (isActive ?? false) ? Colors.orange : Colors.grey[100],
      ),
    );
  }

  Widget buildCategoryTabs() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.0),
              child: Text("All"),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.0),
              child: Text("Popular"),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.0),
              child: Text("New"),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.0),
              child: Text("Trending"),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.0),
              child: Text("Recommended"),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildRecipeList(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            for (var recipe in recipes)
              buildRecipeCard(
                context,
                recipe['title'] ?? '',
                recipe['area'] ?? '',
                recipe['category'] ?? '',
                recipe['image'] ?? '',
              ),
          ],
        ),
      ),
    );
  }

  Widget buildRecipeCard(
    BuildContext context,
    String title,
    String area,
    String category,
    String imageUrl,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, AppRoutes.recipeDetail);
      },
      child: Container(
        width: 300,
        padding: const EdgeInsets.only(right: 16.0),
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
                child: Image.network(
                  imageUrl,
                  height: 150,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  Icons.restaurant_menu,
                                  size: 16,
                                  color: Colors.grey,
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  area,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.flag,
                                  size: 16,
                                  color: Colors.grey,
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  category,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        const Spacer(),
                        IconButton(
                          icon: const Icon(
                            Icons.bookmark_border,
                            size: 24,
                            color: Colors.grey,
                          ),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildBottomNavBar() {
    return BottomNavigationBar(
      currentIndex: 0,
      iconSize: 18,
      selectedFontSize: 12,
      unselectedFontSize: 12,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.orange,
      unselectedItemColor: Colors.grey[300],
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_filled),
          label: 'Home',
          tooltip: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Search',
          tooltip: 'Search',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.bookmark),
          label: 'Saved',
          tooltip: 'Saved',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
          tooltip: 'Profile',
        ),
      ],
    );
  }
}
