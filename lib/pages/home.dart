import 'package:flutter/material.dart';
import 'package:mini_ecommerce_app/classes/items.dart';
import 'package:mini_ecommerce_app/constant/colors.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Item> items = [
    Item(price: 12.99, imgPath: "assets/2.webp"),
    Item(price: 12.99, imgPath: "assets/3.webp"),
    Item(price: 12.99, imgPath: "assets/4.webp"),
    Item(price: 12.99, imgPath: "assets/5.webp"),
    Item(price: 12.99, imgPath: "assets/6.webp"),
    Item(price: 12.99, imgPath: "assets/7.webp"),
    Item(price: 12.99, imgPath: "assets/8.webp"),
    Item(price: 12.99, imgPath: "assets/1.webp"),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 3 / 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 33),
              itemCount: items.length,
              itemBuilder: (BuildContext context, int index) {
                return GridTile(
                  footer: GridTileBar(
                    // backgroundColor: const Color.fromARGB(66, 73, 127, 110),
                    trailing: IconButton(
                        color: const Color.fromARGB(255, 62, 94, 70),
                        onPressed: () {},
                        icon: const Icon(Icons.add)),
                    leading: Container(
                      margin: const EdgeInsets.only(left: 22),
                      child:  Text("\$ ${items[index].price.toString()}"),
                    ),
                    title: const Text(
                      "",
                    ),
                  ),
                  child: GestureDetector(
                    onTap: () {},
                    // use ClipRRect & Positioned
                    child: Stack(
                      children: [
                        Positioned(
                          bottom: -9,
                          top: -3,
                          right: 0,
                          left: 0,
                          child: ClipRRect(
                            // clipBehavior: Clip.antiAliasWithSaveLayer,
                            borderRadius: BorderRadius.circular(55),
                            child: Image.asset(items[index].imgPath),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
        ),
        drawer: Drawer(
          child: Column(
            children: [
              const UserAccountsDrawerHeader(
                // currentAccountPictureSize: Size.square(50),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/backgroundmod.jpg',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                currentAccountPicture: CircleAvatar(
                  radius: 100,
                  backgroundImage: AssetImage(
                      'assets/pngtree-user-icon-png-image_1796659.jpg'),
                ),

                accountName: Text('Chadi Jawad'),
                accountEmail: Text('chadi@gmail.com'),
              ),
              ListTile(
                  title: const Text("Home"),
                  leading: const Icon(Icons.home),
                  onTap: () {}),
              ListTile(
                  title: const Text("My products"),
                  leading: const Icon(Icons.add_shopping_cart),
                  onTap: () {}),
              ListTile(
                  title: const Text("About"),
                  leading: const Icon(Icons.help_center),
                  onTap: () {}),
              ListTile(
                  title: const Text("Logout"),
                  leading: const Icon(Icons.exit_to_app),
                  onTap: () {}),
              const Spacer(),
              const Padding(
                padding: EdgeInsets.all(18),
                child: Text('developed by Chadi Jawad 2024'),
              )
            ],
          ),
        ),
        appBar: AppBar(
          backgroundColor: appbarGreen,
          title: const Text("Home"),
          actions: [
            Row(
              children: [
                Stack(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(211, 164, 255, 193),
                          shape: BoxShape.circle),
                      child: const Text(
                        "8",
                        style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.add_shopping_cart),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 12),
                  child: Text("\$ 128"),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}