
import 'package:crud_app/Screen/ProductCreateScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../RestApi/RestClient.dart';
import '../Style/Style.dart';
import 'ProductUpdateScreen.dart';

class ProductGridViewScreen extends StatefulWidget {

  @override
  State<ProductGridViewScreen> createState() => _ProductGridViewScreenState();
}

class _ProductGridViewScreenState extends State<ProductGridViewScreen> {
  List ProductList = [];
  bool isLoading = true;

  @override
  void initState() {
    CallData();
    super.initState();
  }


  CallData() async {
    isLoading = true;
    var data = await ProductGridViewListRequest();
    setState(() {
      ProductList = data;
      isLoading = false;
    });
    // print(ProductList);
  }

  onDeleteButton(id) async {
    showDialog(context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Delete"),
            actions: [
              OutlinedButton(onPressed: () async {
                Navigator.pop(context);
                setState(() {
                  isLoading = true;
                });
                await ProductDeleteRequest(id);
                await CallData();
              }, child: Text("YES")),
              OutlinedButton(onPressed: () {
                Navigator.pop(context);
              }, child: Text("No")),
            ],
          );
        }
    );
  }
  GotoUpdate(context,selectedUpdateItem){
    Navigator.push(context, MaterialPageRoute(builder: (builder)=>ProductUpdateScreen(selectedUpdateItem)));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("List Product"),),
      body: Stack(

        children: [
          ScreenBackground(context),
          Container(
            child: (isLoading)
                ? (Center(child: CircularProgressIndicator(),))
                : (
                RefreshIndicator(
                  onRefresh: () async {
                    await CallData();
                  },
                  child: GridView.builder(
                      itemCount: ProductList.length,
                      gridDelegate: ProducGridViewStyle(),
                      itemBuilder: (context, index) {
                        return Card(
                          child: Column(

                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [

                              Expanded(child: Image.network(
                                ProductList[index]["Img"]!, fit: BoxFit.fill,)),
                              Text(ProductList[index]["ProductName"]),
                              SizedBox(height: 7),
                              Text("Price : " +
                                  ProductList[index]["TotalPrice"] + " BDT"),
                              Row(

                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [

                                  OutlinedButton(onPressed: () {
                                    GotoUpdate(context,ProductList[index]);
                                  },
                                      child: Icon(
                                        CupertinoIcons.ellipsis_vertical_circle,
                                        size: 18, color: colorGreen,)),
                                  SizedBox(width: 4,),
                                  OutlinedButton(onPressed: () {
                                    // print(ProductList[index]);
                                    onDeleteButton(ProductList[index]["_id"]);
                                  },
                                      child: Icon(
                                        CupertinoIcons.delete, size: 18,
                                        color: colorRed,)),
                                  SizedBox(width: 5,),
                                  SizedBox(height: 35,),
                                ],
                              ),

                            ],
                          ),
                        );
                      }
                  ),

                )

            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (builder) => ProductCreateScreen()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
