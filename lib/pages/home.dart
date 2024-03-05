import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mini_ecommerce_app/classes/items.dart';
import 'package:mini_ecommerce_app/constant/appbar.dart';
import 'package:mini_ecommerce_app/constant/colors.dart';
import 'package:mini_ecommerce_app/pages/checkout.dart';
import 'package:mini_ecommerce_app/pages/details.dart';
import 'package:mini_ecommerce_app/provider/cart.dart';
import 'package:mini_ecommerce_app/provider/google_sign_in.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    final googleSingIn = Provider.of<GoogleSignInProvider>(context);
    final user = FirebaseAuth.instance.currentUser!;
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
                        onPressed: () {
                          cart.addToCart(items[index]);
                        },
                        icon: const Icon(Icons.add)),
                    leading: Container(
                      margin: const EdgeInsets.only(left: 22),
                      child: Text("\$ ${items[index].price.toString()}"),
                    ),
                    title: const Text(
                      "",
                    ),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => Details(
                            item: items[index],
                          ),
                        ),
                      );
                    },
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
               UserAccountsDrawerHeader(
                // currentAccountPictureSize: Size.square(50),
                decoration:const  BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/backgroundmod.jpg',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                currentAccountPicture: CircleAvatar(
                  radius: 100,
                  backgroundImage: NetworkImage(
                      user.photoURL!),
                ),

                accountName: Text(user.displayName!),
                accountEmail: Text(user.email!),
              ),
              ListTile(
                  title: const Text("Home"),
                  leading: const Icon(Icons.home),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const Home(),
                      ),
                    );
                  }),
              ListTile(
                  title: const Text("My products"),
                  leading: const Icon(Icons.add_shopping_cart),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const CheckOut(),
                      ),
                    );
                  }),
              ListTile(
                  title: const Text("About"),
                  leading: const Icon(Icons.help_center),
                  onTap: () {}),
              ListTile(
                  title: const Text("Logout"),
                  leading: const Icon(Icons.exit_to_app),
                  onTap: () async {
                    await FirebaseAuth.instance.signOut();
                    await googleSingIn.signOutGoogle();
                  }),
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
          actions: const [
            MyAppBar(),
          ],
        ),
      ),
    );
  }
}
