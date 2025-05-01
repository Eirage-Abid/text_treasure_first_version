import 'package:flutter/material.dart';
import 'package:text_treasure_first_version/Screens/my_library.dart';
import 'package:text_treasure_first_version/Screens/home_screen.dart';

class LibraryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Home',
          style: TextStyle(color: Colors.black),
        ),
        actions: const [
          Padding(
            //Gaps between the cards
            padding: EdgeInsets.only(right: 16.0),
            child: Icon(Icons.search, color: Colors.black),
          ),
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Icon(Icons.notifications_none, color: Colors.black),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Hello,',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                    Text(
                      'Eirage Abid',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      'Congratulations!! you have',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 16.0,
                      ),
                    ),
                    Text(
                      'finished 2 books.',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20.0),
              _buildHorizontalFeatureSection(
                title: 'Quick Access',
                items: [
                  Padding(
                    padding: const EdgeInsets.only(right: 12.0),
                    child: _buildFeatureCard(Icons.home_outlined, 'Home', () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      );
                      // Handle Home tap
                    }),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 12.0),
                    child: _buildFeatureCard(Icons.book_outlined, 'My library', () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MyLibraryScreen()),
                      );
                      // Handle My library tap
                    }),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 12.0),
                    child: _buildFeatureCard(Icons.explore_outlined, 'Discover', () {
                      // Handle Discover tap
                    }),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 12.0),
                    child: _buildFeatureCard(Icons.tablet_outlined, 'Reading Goals', () {
                      // Handle Reading Goals tap
                    }),
                  ),
                  _buildFeatureCard(Icons.bookmark_border, 'Bookmarks', () {
                    // Handle Bookmarks tap
                  }),
                ],
              ),

              const SizedBox(height: 24.0),
              _buildHorizontalBookProgressSection(
                title: 'Reading Progress',
                books: [
                  Padding(
                    padding: const EdgeInsets.only(right: 12.0),
                    child: _buildBookProgressCard('assets/images/sin_eater.png', 'Sin Eater', 0.75, () {
                      // Handle Sin Eater tap
                    }),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 12.0),
                    child: _buildBookProgressCard('assets/images/hide_and_seek.png', 'Hide and Seek', 0.3, () {
                      // Handle Hide and Seek tap
                    }),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 12.0),
                    child: _buildBookProgressCard('assets/images/sin_eater.png', 'Sin Eater', 0.9, () {
                      // Handle Sin Eater tap
                    }),
                  ),
                  _buildBookProgressCard('assets/images/hide_and_seek.png', 'Hide and Seek', 0.5, () {
                    // Handle Hide and Seek tap
                  }),
                ],
              ),
              const SizedBox(height: 24.0),
              _buildHorizontalBookListSection(
                title: 'Most Popular',
                books: [
                  Padding(
                    padding: const EdgeInsets.only(right: 12.0),
                    child: _buildBookCoverWithAuthor('assets/images/into_the_shadow.png', 'Into The Shadow', 'Kolin Groover', () {
                      // Handle Into The Shadow tap
                    }),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 12.0),
                    child: _buildBookCoverWithAuthor('assets/images/really_good_actually.png', 'Really Good Actually', 'Martin Michael', () {
                      // Handle Really Good Actually tap
                    }),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 12.0),
                    child: _buildBookCoverWithAuthor('assets/images/a_million_to_one.png', 'A Million to One', 'Thomas Shelby', () {
                      // Handle A Million to One tap
                    }),
                  ),
                  _buildBookCoverWithAuthor('assets/images/beyond_the_ocean_door.png', 'Beyond Ocean Door', 'Liouss Vetawn', () {
                    // Handle Beyond Ocean Door tap
                  }),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'History',
          ),
        ],
      ),
    );
  }

  Widget _buildHorizontalFeatureSection({required String title, required List<Widget> items}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextButton(
              onPressed: () {
                // Handle View all for $title
              },
              child: Row(
                children: const [
                  Text('View all'),
                  Icon(Icons.arrow_forward_ios, size: 14.0),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 12.0),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(children: items),
        ),
      ],
    );
  }

  Widget _buildHorizontalBookProgressSection({required String title, required List<Widget> books}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextButton(
              onPressed: () {
                // Handle View all for $title
              },
              child: Row(
                children: const [
                  Text('View all'),
                  Icon(Icons.arrow_forward_ios, size: 14.0),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 12.0),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(children: books),
        ),
      ],
    );
  }

  Widget _buildHorizontalBookListSection({required String title, required List<Widget> books}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextButton(
              onPressed: () {
                // Handle View all for $title
              },
              child: Row(
                children: const [
                  Text('View all'),
                  Icon(Icons.arrow_forward_ios, size: 14.0),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 12.0),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(children: books),
        ),
      ],
    );
  }

  Widget _buildFeatureCard(IconData icon, String label, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 80.0,
        height: 80.0,
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 28.0, color: Colors.black),
            const SizedBox(height: 8.0),
            Text(
              label,
              style: const TextStyle(fontSize: 12.0, color: Colors.black),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBookProgressCard(String imagePath, String title, double progress, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 90.0,
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(8.0),
        ),
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6.0),
              child: Image.asset(
                imagePath,
                height: 120.0,
                width: 80.0,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12.0),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 4.0),
            LinearProgressIndicator(
              value: progress,
              backgroundColor: Colors.grey[300],
              valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
              minHeight: 4.0,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBookCoverWithTitle(String imagePath, String title, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        width: 100.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                imagePath,
                height: 140.0,
                width: 100.0,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBookCoverWithAuthor(String imagePath, String title, String author, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        width: 120.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                imagePath,
                height: 160.0,
                width: 120.0,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 4.0),
            Text(
              author,
              style: const TextStyle(color: Colors.grey, fontSize: 12.0),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}

/**import 'package:flutter/material.dart';

class LibraryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
       /* title: const Text(
          'Home',
          style: TextStyle(color: Colors.black),
        ),*/
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Icon(Icons.search, color: Colors.black),
          ),
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Icon(Icons.notifications_none, color: Colors.black),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hello,',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                    Text(
                      'Eirage Abid',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      'Congratulations!! you have',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 16.0,
                      ),
                    ),
                    Text(
                      'finished 2 books.',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20.0),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildFeatureCard(Icons.home_outlined, 'Home', () {
                      // Handle Home tap
                    }),
                    const SizedBox(width: 12.0),
                    _buildFeatureCard(Icons.book_outlined, 'My library', () {
                      // Handle My library tap
                    }),
                    const SizedBox(width: 12.0),
                    _buildFeatureCard(Icons.explore_outlined, 'Discover', () {
                      // Handle Discover tap
                    }),
                    const SizedBox(width: 12.0),
                    _buildFeatureCard(Icons.tablet_outlined, 'Reading Goals', () {
                      // Handle Reading Goals tap
                    }),
                    const SizedBox(width: 12.0),
                    _buildFeatureCard(Icons.bookmark_border, 'Bookmarks', () {
                      // Handle Bookmarks tap
                    }),
                  ],
                ),
              ),
              const SizedBox(height: 24.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Reading Progress',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // Handle View all Reading Progress
                    },
                    child: Row(
                      children: const [
                        Text('View all'),
                        Icon(Icons.arrow_forward_ios, size: 14.0),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12.0),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildBookCoverWithTitle('assets/images/sin_eater.png', 'Sin Eater', () {
                      // Handle Sin Eater tap
                    }),
                    const SizedBox(width: 16.0),
                    _buildBookCoverWithTitle('assets/images/hide_and_seek.png', 'Hide and Seek', () {
                      // Handle Hide and Seek tap
                    }),
                    const SizedBox(width: 16.0),
                    _buildBookCoverWithTitle('assets/images/sin_eater.png', 'Sin Eater', () {
                      // Handle Sin Eater tap
                    }),
                    const SizedBox(width: 16.0),
                    _buildBookCoverWithTitle('assets/images/hide_and_seek.png', 'Hide and Seek', () {
                      // Handle Hide and Seek tap
                    }),
                  ],
                ),
              ),
              const SizedBox(height: 24.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Most Popular',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // Handle View all Most Popular
                    },
                    child: Row(
                      children: const [
                        Text('View all'),
                        Icon(Icons.arrow_forward_ios, size: 14.0),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12.0),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildBookCoverWithAuthor('assets/images/into_the_shadow.png', 'Into The Shadow', 'Kolin Groover', () {
                      // Handle Into The Shadow tap
                    }),
                    const SizedBox(width: 16.0),
                    _buildBookCoverWithAuthor('assets/images/really_good_actually.png', 'Really Good Actually', 'Martin Michael', () {
                      // Handle Really Good Actually tap
                    }),
                    const SizedBox(width: 16.0),
                    _buildBookCoverWithAuthor('assets/images/a_million_to_one.png', 'A Million to One', 'Thomas Shelby', () {
                      // Handle A Million to One tap
                    }),
                    const SizedBox(width: 16.0),
                    _buildBookCoverWithAuthor('assets/images/beyond_the_ocean_door.png', 'Beyond Ocean Door', 'Liouss Vetawn', () {
                      // Handle Beyond Ocean Door tap
                    }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'History',
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureCard(IconData icon, String label, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 80.0,
        height: 80.0,
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 28.0, color: Colors.black),
            const SizedBox(height: 8.0),
            Text(
              label,
              style: const TextStyle(fontSize: 12.0, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBookCoverWithTitle(String imagePath, String title, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        width: 100.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                imagePath,
                height: 140.0,
                width: 100.0,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBookCoverWithAuthor(String imagePath, String title, String author, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        width: 120.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                imagePath,
                height: 160.0,
                width: 120.0,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 4.0),
            Text(
              author,
              style: const TextStyle(color: Colors.grey, fontSize: 12.0),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}**/
