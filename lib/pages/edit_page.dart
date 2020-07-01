import 'package:flutter/material.dart';
import 'package:food_delivery/model/food_model.dart';
import 'package:provider/provider.dart';
import '../data/food_data.dart';

class EditProductScreen extends StatefulWidget {
  static const routeName = '/edit-product';

  @override
  _EditProductScreenState createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  final _priceFocusNode = FocusNode();
  final _discountFocusNode = FocusNode();
  final _ratingsFocusNode = FocusNode();
  final _imagePathController = TextEditingController();
  final _imagePathFocusNode = FocusNode();
  final _form = GlobalKey<FormState>();
  var _editedProduct = Food(
    id: null,
    name: '',
    price: 0,
    discount: 0,
    ratings: 0,
    imagePath: '',
  );
  var _initValues = {
    'name': '',
    'price': '',
    'discount': '',
    'ratings': '',
    'imagePath': '',
  };
  var _isInit = true;
  var _isLoading = false;

  @override
  void initState() {
    _imagePathFocusNode.addListener(_updateImageUrl);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      final productId = ModalRoute.of(context).settings.arguments as String;
      if (productId != null) {
        _editedProduct =
            Provider.of<Foods>(context, listen: false).findById(productId);
        _initValues = {
          'name': _editedProduct.name,
    'price': _editedProduct.price.toString(),
    'discount': _editedProduct.discount.toString(),
    'ratings': _editedProduct.ratings.toString(),
    'imagePath': '',
        };
        _imagePathController.text = _editedProduct.imagePath;
      }
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _imagePathFocusNode.removeListener(_updateImageUrl);
    _priceFocusNode.dispose();
    _discountFocusNode.dispose();
    _ratingsFocusNode.dispose();
    _imagePathController.dispose();
    _imagePathFocusNode.dispose();
    super.dispose();
  }

  void _updateImageUrl() {
    if (!_imagePathFocusNode.hasFocus) {
      if ((!_imagePathController.text.startsWith('http') &&
              !_imagePathController.text.startsWith('https')) ||
          (!_imagePathController.text.endsWith('.png') &&
              !_imagePathController.text.endsWith('.jpg') &&
              !_imagePathController.text.endsWith('.jpeg'))) {
        return;
      }
      setState(() {});
    }
  }

  Future<void> _saveForm() async {
    final isValid = _form.currentState.validate();
    if (!isValid) {
      return;
    }
    _form.currentState.save();
    // print(_editedProduct.name);
    // print(_editedProduct.ratings);
    // print(_editedProduct.discount);
    // print(_editedProduct.imagePath);
    setState(() {
      _isLoading = true;
    });
    if (_editedProduct.id != null) {
       Provider.of<Foods>(context, listen: false)
          .updateProduct(_editedProduct.id, _editedProduct);
          Navigator.of(context).pop();
          setState(() {
            _isLoading = false;
          });
    } else {
      try {
        await Provider.of<Foods>(context, listen: false)
            .addProducts(_editedProduct);
              // setState(() {
              //   _isLoading = false;
              // });
            // Navigator.of(context).pop();
      } catch (error) {
        await showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
                title: Text('An error occurred!'),
                content: Text('Something went wrong.'),
                actions: <Widget>[
                  FlatButton(
                    child: Text('Okay'),
                    onPressed: () {
                      Navigator.of(ctx).pop();
                    },
                  )
                ],
              ),
        );
      } finally {
        setState(() {
          _isLoading = false;
        });
        Navigator.of(context).pop();
      }
    
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Product', style: TextStyle(color: Colors.black, fontSize: 22),),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save, color: Colors.black,size: 25),
            onPressed: _saveForm,
          ),
        ],
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _form,
                child: ListView(
                  children: <Widget>[
                    TextFormField(
                     initialValue: _initValues['title'],
                      decoration: InputDecoration(labelText: 'Name'),
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (_) {
                        FocusScope.of(context).requestFocus(_priceFocusNode);
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please provide a value.';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _editedProduct = Food(
                            name: value,
                            price: _editedProduct.price,
                            discount: _editedProduct.discount,
                            ratings: _editedProduct.ratings,
                            imagePath: _editedProduct.imagePath,
                            id: _editedProduct.id,
                        );
                           // isFavorite: _editedProduct.isFavorite);
                      },
                    ),
                    TextFormField(
                      initialValue: _initValues['price'],
                      decoration: InputDecoration(labelText: 'Price'),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      focusNode: _priceFocusNode,
                      onFieldSubmitted: (_) {
                        FocusScope.of(context)
                            .requestFocus(_discountFocusNode);
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter a price.';
                        }
                        if (double.tryParse(value) == null) {
                          return 'Please enter a valid number.';
                        }
                        if (double.parse(value) <= 0) {
                          return 'Please enter a number greater than zero.';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _editedProduct = Food(
                            name: _editedProduct.name,
                            price: double.parse(value),
                            discount: _editedProduct.discount,
                            ratings: _editedProduct.ratings,
                            imagePath: _editedProduct.imagePath,
                            id: _editedProduct.id,
                        );
                           // isFavorite: _editedProduct.isFavorite);
                      },
                    ),
                    TextFormField(
                      initialValue: _initValues['discount'],
                      decoration: InputDecoration(labelText: 'Discount'),
                      //maxLines: 3,
                      keyboardType: TextInputType.number,
                      focusNode: _discountFocusNode,
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter a discount.';
                        }
                        if (double.tryParse(value) == null) {
                          return 'Please enter a valid number.';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _editedProduct = Food(
                          name: _editedProduct.name,
                          price: _editedProduct.price,
                          discount: _editedProduct.discount,
                          ratings: double.parse(value),
                          imagePath: _editedProduct.imagePath,
                          id: _editedProduct.id,
                          //isFavorite: _editedProduct.isFavorite,
                        );
                      },
                    ),
                    TextFormField(
                      initialValue: _initValues['ratings'],
                      decoration: InputDecoration(labelText: 'Ratings'),
                      //maxLines: 3,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      focusNode: _ratingsFocusNode,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter ratings.';
                        }
                        if (double.tryParse(value) == null) {
                          return 'Please enter a valid number.';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _editedProduct = Food(
                          name: _editedProduct.name,
                          price: _editedProduct.price,
                          discount: double.parse(value),
                          ratings: _editedProduct.ratings,
                          imagePath: _editedProduct.imagePath,
                          id: _editedProduct.id,
                          //isFavorite: _editedProduct.isFavorite,
                        );
                      },
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Container(
                          width: 100,
                          height: 100,
                          margin: EdgeInsets.only(
                            top: 8,
                            right: 10,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: Colors.grey,
                            ),
                          ),
                          child: _imagePathController.text.isEmpty
                              ? Text('Enter an image URL')
                              : FittedBox(
                                  child: Image.network(
                                    _imagePathController.text,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                        ),
                        Expanded(
                          child: TextFormField(
                           // initialValue: _initValues['imagePath'],
                            decoration: InputDecoration(labelText: 'Image URL'),
                            keyboardType: TextInputType.url,
                            textInputAction: TextInputAction.done,
                            controller: _imagePathController,
                            focusNode: _imagePathFocusNode,
                            onFieldSubmitted: (_) {
                              _saveForm();
                            },
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter an image URL.';
                              }
                              if (!value.startsWith('http') &&
                                  !value.startsWith('https')) {
                                return 'Please enter a valid URL.';
                              }
                              if (!value.endsWith('.png') &&
                                  !value.endsWith('.jpg') &&
                                  !value.endsWith('.jpeg')) {
                                return 'Please enter a valid image URL.';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _editedProduct = Food(
                                name: _editedProduct.name,
                          price: _editedProduct.price,
                          discount: _editedProduct.discount,
                          ratings: _editedProduct.ratings,
                          imagePath: value,
                          id: _editedProduct.id,
                               // isFavorite: _editedProduct.isFavorite,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}