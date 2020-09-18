import 'package:flutter/material.dart';

class CartProducts extends StatefulWidget {
  @override
  _CartProductsState createState() => _CartProductsState();
}

class _CartProductsState extends State<CartProducts> {
  var productsOnTheCart = [
    {
      "name": "Blazer",
      "picture": "images/products/blazer1.jpeg",
      "price": 85,
      "size": "M",
      "color": "Red",
      "quantity": 1,
    },
    {
      "name": "Shoe",
      "picture": "images/products/hills1.jpeg",
      "price": 65,
      "size": "7",
      "color": "Wine",
      "quantity": 1,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
        itemCount: 2,
        itemBuilder: (context, index) {
          return SingleCartProduct(
            cartProdName: productsOnTheCart[index]["name"],
            cartProdColor: productsOnTheCart[index]["color"],
            cartProdQty: productsOnTheCart[index]["quantity"],
            cartProdSize: productsOnTheCart[index]["size"],
            cartProdPrice: productsOnTheCart[index]["price"],
            cartProdPicture: productsOnTheCart[index]["picture"],
          );
        });
  }
}

class SingleCartProduct extends StatelessWidget {
  final cartProdName;
  final cartProdPicture;
  final cartProdPrice;
  final cartProdSize;
  final cartProdColor;
  final cartProdQty;

  SingleCartProduct({
    this.cartProdName,
    this.cartProdColor,
    this.cartProdPrice,
    this.cartProdPicture,
    this.cartProdQty,
    this.cartProdSize,
  });
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        // ===========LEADING SECTION===========
        leading: new Image.asset(
          cartProdPicture,
          width: 80.0,
          height: 50.0,
        ),
        // =========== TITLE SECTION ===========
        title: new Text(cartProdName),
        // =========== SUBTITLE SECTION ===========
        subtitle: new Column(
          children: <Widget>[
            // ROW INSIDE THE COLUMN
            new Row(
              children: <Widget>[
                // this section is for the size of the product
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: new Text("Size:"),
                ),

                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: new Text(
                    cartProdSize,
                    style: TextStyle(color: Colors.red),
                  ),
                ),

// ====== This section is for the product color =======

                new Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 5.0, 5.0, 5.0),
                  child: new Text(
                    cartProdColor,
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ],
            ),
            // ============THIS SECTION IS THE PRODUCT PRICE============
            new Container(
              alignment: Alignment.topLeft,
              child: new Text(
                "\$$cartProdPrice",
                style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.red),
              ),
            ),
          ],
        ),
        trailing: FittedBox(
          fit: BoxFit.fill,
          child: Column(
            children: <Widget>[
              new IconButton(
                  icon: Icon(Icons.arrow_drop_up, color: Colors.red),
                  iconSize: 40,
                  onPressed: () {}),
              Text(
                "$cartProdQty",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              new IconButton(
                  icon: Icon(
                    Icons.arrow_drop_down,
                    color: Colors.red,
                  ),
                  iconSize: 40,
                  onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
