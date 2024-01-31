import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'nextpage.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverAppBar(
              backgroundColor: const Color.fromARGB(255, 255, 240, 187),
              expandedHeight: 70,
              floating: false,
              snap: false,
              pinned: false,
              flexibleSpace: FlexibleSpaceBar(
                title: null,
                background: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Karan", style: TextStyle(fontSize: 16)),
                            SizedBox(height: 4,),
                            Text("Jodhpur", style: TextStyle(fontSize: 12)),
                          ],
                        ),
                        Row(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.language),
                              onPressed: () {
                                // Handle language button press
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.person),
                              onPressed: () {
                                // Handle profile button press
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SliverSearchBar(), // Custom SliverSearchBar
          ],
          body: Container(
            color: Colors.blueAccent,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20), // Adjust spacing
                Expanded(
                  child: ListView.separated(
                    padding: const EdgeInsets.all(12),
                    separatorBuilder: (context, index) => const SizedBox(height: 50),
                    itemCount: 10,
                    itemBuilder: (context, index) => buildCard(context, index + 1),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SliverSearchBar extends StatelessWidget {
  const SliverSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      floating: false,
      pinned: true,
      delegate: _SearchBarDelegate(),
    );
  }
}

class _SearchBarDelegate extends SliverPersistentHeaderDelegate {
  @override
  double get minExtent => 60.0;
  @override
  double get maxExtent => 60.0;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: const Color.fromARGB(255, 255, 240, 187),
      padding: const EdgeInsets.all(8),
      child: const TextField(
        decoration: InputDecoration(
          hintText: 'Search',
          border: OutlineInputBorder(),
          suffixIcon: Icon(Icons.search),
        ),
      ),
    );
  }

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}

Widget buildCard(BuildContext context, int index) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>  NextPage(),
        ),
      );
    },
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 150,
              child: CarouselSlider(
                items: [
                  Image.asset(
                    "assets/images/1image.jpeg",
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    "assets/images/2image.jpeg",
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    "assets/images/category/ic_frame2.jpg",
                    fit: BoxFit.cover,
                  ),
                ],
                options: CarouselOptions(
                  autoPlay: true,
                  aspectRatio: 2.0,
                  enlargeCenterPage: true,
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            const Row(
              children: [
                Icon(Icons.alarm, color: Colors.green),
                SizedBox(width: 5.0),
                Text("35-40 min ● 1 km"),
                Spacer(),
                Text("Rs150 for one"),
                SizedBox(width: 5.0),
              ],
            ),
            const SizedBox(height: 10.0),
            Row(
              children: [
                const Icon(Icons.favorite_outline, size: 20),
                const SizedBox(width: 5.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Rajdhani Restaurant",
                      style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        const Text("Gujarat ● North India ", style: TextStyle(color: Colors.black),),
                        const SizedBox(width: 100),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.green,
                          ),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5),
                            child: Text("4.0★", style: TextStyle(color: Colors.white),
                          ),
                        ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10.0),
          ],
        ),
      ),
    ),
  );
}



