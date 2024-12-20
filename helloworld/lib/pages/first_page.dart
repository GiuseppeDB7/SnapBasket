import 'package:flutter/material.dart';
import 'package:helloworld/models/home.dart';
import 'package:helloworld/models/item.dart';
import 'package:helloworld/pages/item_tile.dart';
import 'package:provider/provider.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => FirstPageState();
}

class FirstPageState extends State<FirstPage> {
  //add Item to cart
  void addItemToCart(Item item) {
    Provider.of<Cart>(context, listen: false).addItemToCart(item);

    //alert the user of success
    showDialog(
      context: context,
      builder: (context) => const AlertDialog(
        title: Text('Successfully added!'),
        content: Text('Check your cart'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) => Column(
        children: [
          //foto
          //const Row(
          //  children: [
          //    Expanded(
          //      child: Image(
          //        image: AssetImage('lib/assets/title.png'),
          //        fit: BoxFit.scaleDown,
          //        height: 10,
          //      ),
          //    ),
          //  ],
          //),

          //hot picks
          const Padding(
            padding: EdgeInsets.only(left: 25.0, right: 25.0, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Welcome, User!',
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: 4,
              scrollDirection: Axis.vertical,
              //padding: const EdgeInsets.symmetric(horizontal: 10),
              //get a Item from the shop list
              itemBuilder: (context, index) {
                Item item = value.getItemList()[index];

                //return the Item
                return ItemTile(item: item, onTap: () => addItemToCart(item));
              },
            ),
          ),
        ],
      ),
    );
  }
}
