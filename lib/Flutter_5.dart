//https://blog.csdn.net/hekaiyou/article/details/53088815
import 'package:flutter/material.dart';

class Product{
  final String name;
  const Product({this.name});
}

typedef void CartChangedCallback(Product product, bool inCart);

class ShoppingListItem extends StatelessWidget{

  final Product product;
  final bool inCart;
  final CartChangedCallback onCartChanged;

  ShoppingListItem({this.product, this.inCart, this.onCartChanged})
      : super(key: new ObjectKey(product));

  Color _getColor(BuildContext context){
    return inCart ? Colors.black54 : Theme.of(context).primaryColor;
  }

  TextStyle _getTextStyle(BuildContext context){
    if(!inCart) return null;
    return new TextStyle(
        color: Colors.black54,
        decoration: TextDecoration.lineThrough
    );
  }

  @override
  Widget build(BuildContext context) {
    return new ListTile(
      onTap: (){
        onCartChanged(product, !inCart);
      },
      leading: new CircleAvatar(
        backgroundColor: _getColor(context),
        child: new Text(product.name[0]),
      ),
      title: new Text(product.name, style: _getTextStyle(context),),
    );
  }
}


class ShoppingList extends StatefulWidget {

  List<Product> products;
  ShoppingList({Key key,  List<Product> products}) :  super(key: key){
    this.products = products;
    if(this.products == null || this.products.isEmpty){
      this.products = _kProducts;
    }
  }

  @override
  _ShoppingListState createState() {
    return new _ShoppingListState();
  }
}

class _ShoppingListState extends State<ShoppingList> {

  Set<Product> _shoppingCart = new Set<Product>();

  void _handleCartChanged(Product product, bool inCart) {
    setState(
            (){
          if (inCart)
            _shoppingCart.add(product);
          else
            _shoppingCart.remove(product);
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("应用实例_购物清单"),
      ),
      body: new ListView(
          children: widget.products.map(
              (Product product){
                return new ShoppingListItem(
                  product: product,
                  inCart: _shoppingCart.contains(product),
                  onCartChanged: _handleCartChanged,
                );
              }
          ).toList()
      ),
    );
  }
}

 final List<Product> _kProducts = <Product>[
  new Product(name: "鸡蛋"),
  new Product(name: "面包"),
  new Product(name: "牛奶"),
  new Product(name: "鸡蛋"),
  new Product(name: "面包"),
  new Product(name: "牛奶"),
  new Product(name: "鸡蛋"),
  new Product(name: "面包"),
  new Product(name: "牛奶"),
  new Product(name: "鸡蛋"),
  new Product(name: "面包"),
  new Product(name: "牛奶"),
  new Product(name: "鸡蛋"),
  new Product(name: "面包"),
  new Product(name: "牛奶"),
  new Product(name: "鸡蛋"),
  new Product(name: "面包"),
  new Product(name: "牛奶"),

];

void main(){
  runApp(
    new MaterialApp(
      home: new ShoppingList(products: _kProducts,),
    )
  );
}