import 'package:flutter/material.dart';
import 'package:mini_ecommerce_app/constant/appbar.dart';
import 'package:mini_ecommerce_app/constant/colors.dart';
import 'package:mini_ecommerce_app/provider/cart.dart';
import 'package:provider/provider.dart';

class CheckOut extends StatelessWidget {
  const CheckOut({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appbarGreen,
        title: const Text('Checkout'),
        actions: const [
          MyAppBar(),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 550,
            child: ListView.builder(
              itemCount: cart.selectedItems.length,
              itemBuilder: (BuildContext context, index) {
                return Card(
                  child: ListTile(
                    subtitle: Row(
                      children: [
                        Text(
                          "\$ ${cart.selectedItems[index].price}",
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Text("${cart.selectedItems[index].location}")
                      ],
                    ),
                    leading: CircleAvatar(
                      backgroundImage:
                          AssetImage(cart.selectedItems[index].imgPath),
                    ),
                    title: Text(cart.selectedItems[index].name),
                    trailing: IconButton(
                        onPressed: () {
                          // remove the selected product from the cart
                          cart.deletFromCart(index, cart.selectedItems[index]);
                        },
                        icon: const Icon(Icons.remove)),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 20,),
          ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
              backgroundColor: const MaterialStatePropertyAll(BTNgreen),
              padding: MaterialStateProperty.all(
                const EdgeInsets.all(12),
              ),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            child:  Text(
              'Pay \$${cart.price}',
              style: const TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
