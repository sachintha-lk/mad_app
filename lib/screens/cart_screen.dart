import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../components/cards/cart_item_card.dart';
import 'package:intl/intl.dart';

import '../components/drawer.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> with TickerProviderStateMixin {
  List<CartItem> cartItems = [];

  double cartTotal = 0;

  var formattedCartTotal = '';

  @override
  void initState() {
    super.initState();
    // deleteCartBox();
    // EmpyCartItems();
    // addDummyCartItems();
    fetchCartItems();
  }

  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }

  String formatPrice(double price) {
    final formatter = NumberFormat.currency(decimalDigits: 2, symbol: '');
    return formatter.format(price);
  }

  void fetchCartItems() async {
    final cartBox = await Hive.openBox('cart');

    List<CartItem> fetchedItems = cartBox.values.map((item) {
      return item as CartItem;
    }).toList();

    setState(() {
      cartItems = fetchedItems;
      calculateCartTotal();
    });
  }

  // void fetchCartItems() async {
  //   // TODO check this later
  //   Database database = await openDatabase('path_to_your_database.db');
  //   List<Map<String, dynamic>> items = await database.query('cart');

  //   // Convert the fetched data into CartItem objects
  //   List<CartItem> fetchedItems = items.map((item) {
  //     return CartItem(
  //       productName: item['productName'],
  //       unitPrice: item['unitPrice'],
  //       quantity: item['quantity'],
  //     );
  //   }).toList();

  //   setState(() {
  //     cartItems = fetchedItems;
  //     calculateCartTotal();
  //   });
  // }

  void calculateCartTotal() {
    double newTotal = 0;
    for (CartItem item in cartItems) {
      newTotal += item.unitPrice * item.quantity;
    }

    setState(() {
      cartTotal = newTotal;
    });

    formattedCartTotal = formatPrice(cartTotal);
  }

  void updateCartItemQuantity(int index, int newQuantity) {
    setState(() {
      cartItems[index].quantity = newQuantity;
      cartItems[index].save(); // hive save
      calculateCartTotal();
    });
  }

  void remove_cart_item(int index, String productName) {
    // confirm delete
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Remove $productName from cart?'),
          content:
              Text('Do you really want to remove $productName from your cart?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                cartItems[index].delete(); // hive delete
                cartItems.removeAt(index);
                calculateCartTotal();
              },
              child: Text('Remove'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var formattedCartTotal = formatPrice(cartTotal);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
        centerTitle: true,
      ),
      drawer: MyDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              child: ListView.builder(
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  return CartItemCard(
                    productName: cartItems[index].productName,
                    unitPrice: cartItems[index].unitPrice,
                    quantity: cartItems[index].quantity,
                    productImage: cartItems[index].image,
                    onQuantityUpdated: (newQuantity) {
                      updateCartItemQuantity(index, newQuantity);
                    },
                    onRemoveItem: (productName) {
                      remove_cart_item(index, productName);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomSheet: BottomSheet(
        animationController: AnimationController(
          vsync: this,
          duration: Duration(milliseconds: 500),
        ),
        onClosing: () {},
        builder: (context) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.15,
            width: MediaQuery.of(context).size.width,
            child: Flex(
              direction:
                  MediaQuery.of(context).orientation == Orientation.portrait
                      ? Axis.vertical
                      : Axis.horizontal,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 25, right: 15, top: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total',
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).orientation ==
                                Orientation.landscape
                            ? 30
                            : 0,
                      ),
                      Text(
                        'LKR $formattedCartTotal',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Center(
                  child: SizedBox(
                    width: 300,
                    child: FilledButton(
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      )),
                      onPressed: () {
                        // alert box hello world
                      },
                      child: const Text(
                        'Checkout',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

@HiveType(typeId: 0)
class CartItem extends HiveObject {
  @HiveField(0)
  final String productName;

  @HiveField(1)
  final double unitPrice;

  @HiveField(2)
  int quantity;

  @HiveField(3)
  String image;

  CartItem({
    required this.productName,
    required this.unitPrice,
    required this.quantity,
    required this.image,
  });
}

class CartItemAdapter extends TypeAdapter<CartItem> {
  @override
  final typeId = 0;

  @override
  CartItem read(BinaryReader reader) {
    return CartItem(
      productName: reader.read(),
      unitPrice: reader.read(),
      quantity: reader.read(),
      image: reader.read(),
    );
  }

  @override
  void write(BinaryWriter writer, CartItem obj) {
    writer.write(obj.productName);
    writer.write(obj.unitPrice);
    writer.write(obj.quantity);
    writer.write(obj.image);
  }
}

void addDummyCartItems() async {
  final cartBox = await Hive.openBox('cart');

  CartItem item1 = CartItem(
    productName: 'Product 1',
    unitPrice: 10.99,
    quantity: 2,
    image: 'lib/images/product_imgs/nike.png',
  );

  CartItem item2 = CartItem(
    productName: 'Product 2',
    unitPrice: 15.99,
    quantity: 3,
    image: 'lib/images/product_imgs/nike.png',
  );

  cartBox.add(item1);
  cartBox.add(item2);
}

void EmpyCartItems() async {
  final cartBox = await Hive.openBox('cart');
  cartBox.clear();
}

void deleteCartBox() async {
  await Hive.deleteBoxFromDisk('cart');
}
