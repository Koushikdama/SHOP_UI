import 'package:flutter/material.dart';
import 'package:third_app/items_data.dart';
import 'package:third_app/product_card.dart';
import 'package:third_app/product_details.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({super.key});

  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
//////////////////////////////////////////////////
  final List<String> filters = const ['ALL', "Addidas", "Nike", "Bata"];
  late String selectedfilter;

  int currentPage = 1;
  @override
  void initState() {
    super.initState();
    selectedfilter = filters[0];
  }

  ////////////////////////////////////////////
  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;

////////////////////////////////////////////////////////
    const border = OutlineInputBorder(
        borderSide: BorderSide(
          color: Color.fromRGBO(225, 225, 225, 1),
        ),
        borderRadius: BorderRadius.horizontal(left: Radius.circular(50)));
///////////////////////////////////////////////////////

    return SafeArea(
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text("Shoes\nCOllection",
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge //TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
                    ),
              ),
              const Expanded(
                  child: SizedBox(
                      width: 200,
                      child: TextField(
                        style: TextStyle(fontWeight: FontWeight.bold),
                        decoration: InputDecoration(
                            hintText: 'search',
                            prefixIcon: Icon(Icons.search),
                            border: border,
                            enabledBorder: border,
                            focusedBorder: border),
                      )))
            ],
          ),
          SizedBox(
            height: 120,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: filters.length,
              itemBuilder: (context, index) {
                final filter = filters[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedfilter = filter;
                      });
                    },
                    child: Chip(
                      backgroundColor: selectedfilter == filter
                          ? Theme.of(context).colorScheme.primary
                          : const Color.fromRGBO(245, 247, 249, 1),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 15),
                      side: const BorderSide(
                          color: Color.fromRGBO(245, 247, 249, 1)),
                      label: Text(filter),
                      labelStyle: const TextStyle(fontSize: 15),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                    ),
                  ),
                );
              },
            ),
          ),
          // Expanded(
          //     child: GridView.builder(
          //         itemCount: products.length,
          //         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          //           crossAxisCount: 2,
          //         ),
          //         itemBuilder: (context, index) {
          //           final product = products[index];
          //           return GestureDetector(
          //             onTap: () {
          //               Navigator.of(context)
          //                   .push(MaterialPageRoute(builder: (context) {
          //                 return ProductDetailsPage(product: product);
          //               }));
          //             },
          //             child: ProductCard(
          //               //product_cart.dart in mainpage
          //               title: product['title'] as String,
          //               price: product['price'] as double,
          //               image: product['imageUrl'] as String,
          //               backgroundColor: index.isEven
          //                   ? const Color.fromRGBO(216, 240, 253, 1)
          //                   : const Color.fromRGBO(245, 247, 249, 1),
          //             ),
          //           );
          //         })),
          Expanded(
            child: LayoutBuilder(
              builder: (context, constrainst) {
                if (constrainst.maxWidth > 1080) {
                  return GridView.builder(
                      itemCount: products.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio:
                              2.0), // here crossAxiscount means how many items in a row and childaspectration means is length of row
                      itemBuilder: (context, index) {
                        final product = products[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return ProductDetailsPage(product: product);
                            }));
                          },
                          child: ProductCard(
                            //product_cart.dart in mainpage
                            title: product['title'] as String,
                            price: product['price'] as double,
                            image: product['imageUrl'] as String,
                            backgroundColor: index.isEven
                                ? const Color.fromRGBO(216, 240, 253, 1)
                                : const Color.fromRGBO(245, 247, 249, 1),
                          ),
                        );
                      });
                } else {
                  return ListView.builder(
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      final product = products[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return ProductDetailsPage(product: product);
                          }));
                        },
                        child: ProductCard(
                          //product_cart.dart in mainpage
                          title: product['title'] as String,
                          price: product['price'] as double,
                          image: product['imageUrl'] as String,
                          backgroundColor: index.isEven
                              ? const Color.fromRGBO(216, 240, 253, 1)
                              : const Color.fromRGBO(245, 247, 249, 1),
                        ),
                      ); //return const card_();
                    },
                  );
                }
              },
            ),
          ),
          // ListView.builder( to arrange the items to side by side
          //     itemCount: products.length,
          //     itemBuilder: (context, index) {
          //       final product = products[index];
          //       return GestureDetector(
          //         onTap: () {
          //           Navigator.of(context)
          //               .push(MaterialPageRoute(builder: (context) {
          //             return ProductDetailsPage(product: product);
          //           }));
          //         },
          //         child: ProductCard(
          //           //product_cart.dart in mainpage
          //           title: product['title'] as String,
          //           price: product['price'] as double,
          //           image: product['imageUrl'] as String,
          //           backgroundColor: index.isEven
          //               ? const Color.fromRGBO(216, 240, 253, 1)
          //               : const Color.fromRGBO(245, 247, 249, 1),
          //         ),
          //       ); //return const card_();
          //     },
          //   ),
          // )
        ],
      ),
    );
  }
}
