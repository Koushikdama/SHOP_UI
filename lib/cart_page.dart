import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:third_app/cart_provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    // final cart = context.watch<CartProvider>().cart; both are working same
    final cart = context.watch<CartProvider>().cart;
    //final cart = Provider.of<CartProvider>(context).cart; //both are working same
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Cart',
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: cart.length,
          itemBuilder: (context, index) {
            final cartitem = cart[index];
            return ListTile(
              leading: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage(cartitem['imageUrl'] as String),
              ),
              trailing: IconButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("DELETE PRODUCT",
                                style: Theme.of(context).textTheme.titleMedium),
                            content: const Text("ARE YOU SURE !",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context)
                                        .pop(); // to remove alertdialog when click no
                                  },
                                  child: const Text(
                                    "NO",
                                    style: TextStyle(
                                        color: Colors.green,
                                        fontWeight: FontWeight.bold),
                                  )),
                              TextButton(
                                  onPressed: () {
                                    context.read()<
                                        CartProvider>(); // this is used when we use watch in above instaed of this:final cart = Provider.of<CartProvider>(context).cart;
                                    Provider.of<CartProvider>(context,
                                            listen: false)
                                        .removeProduct(cartitem);
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text("YES",
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontWeight: FontWeight.bold)))
                            ],
                          );
                        });
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                    // size: 25,
                  )),
              title: Text(
                cartitem['title'].toString(),
                style: Theme.of(context).textTheme.bodySmall,
              ),
              subtitle: Text("size : ${cartitem['size']}"),
            );
          }),
    );
  }
}
