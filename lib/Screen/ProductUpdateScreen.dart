

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../RestApi/RestClient.dart';
import '../Style/Style.dart';
import 'ProductGridViewScreen.dart';

class ProductUpdateScreen extends StatefulWidget {
  final Map productItem;
  const ProductUpdateScreen(this.productItem);

  @override
  State<ProductUpdateScreen> createState() => _ProductUpdateScreenState();
}

class _ProductUpdateScreenState extends State<ProductUpdateScreen> {
  Map<String,String> Formvalues = {"Img":"", "ProductCode":"", "ProductName":"", "Qty":"", "TotalPrice":"", "UnitPrice":""};
  var Loading = false;

  @override
  void initState(){
    setState(() {
      Formvalues.update("Img", (value) => widget.productItem['Img']);
      Formvalues.update("ProductCode", (value) => widget.productItem['ProductCode']);
      Formvalues.update("ProductName", (value) => widget.productItem['ProductName']);
      Formvalues.update("Qty", (value) => widget.productItem['Qty']);
      Formvalues.update("TotalPrice", (value) => widget.productItem['TotalPrice']);
      Formvalues.update("UnitPrice", (value) => widget.productItem['UnitPrice']);

    });

  }
  InputOnChange(mapKey,textValue){
    setState(() {
      Formvalues.update(mapKey, (value) => textValue);
      print(Formvalues);
    });
  }

  FormValidity() async {
    if(Formvalues['Img']!.length == 0){
      ErrorToast("Image URL Required !");
    }
    else if(Formvalues["ProductCode"]!.length == 0){
      ErrorToast("Product Code Required !");

    }
    else if(Formvalues["ProductName"]!.length == 0){
      ErrorToast("Product Name Required !");

    }
    else if(Formvalues["Qty"]!.length == 0){
      ErrorToast("Qunatity Required !");

    }
    else if(Formvalues["TotalPrice"]!.length == 0){
      ErrorToast("Total Price Required !");

    }
    else if(Formvalues["UnitPrice"]!.length == 0){
      ErrorToast("Unit Price Required !");

    }
    else{
      setState(() {
        Loading = true;
      });
      await ProductUpdateRequest(Formvalues,widget.productItem["_id"]);
      Navigator.pushAndRemoveUntil(
          context,
           MaterialPageRoute(builder: (builder)=>ProductGridViewScreen()),
          (route) => false
      );

      // Formvalues.clear();
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Product Update Screen"),),
      body: Stack(
        children: [
          ScreenBackground(context),
          Container(
            child: (Loading) ? (Center(child: CircularProgressIndicator(),)):((SingleChildScrollView(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  TextFormField(
                    initialValue : Formvalues["ProductName"],
                    onChanged: (value){
                      InputOnChange("ProductName", value);
                    },
                    decoration: AppInputDecoration("Product Name"),
                  ),
                  SizedBox(height: 20,),
                  TextFormField(
                    initialValue : Formvalues["Img"],

                    onChanged: (value){
                      InputOnChange("Img", value);

                    },
                    decoration: AppInputDecoration("Product Image"),
                  ),
                  SizedBox(height: 20,),

                  TextFormField(
                    initialValue : Formvalues["UnitPrice"],

                    onChanged: (value){
                      InputOnChange("UnitPrice", value);

                    },
                    decoration: AppInputDecoration("Product Unit Price"),
                  ),
                  SizedBox(height: 20,),

                  TextFormField(
                    initialValue : Formvalues["ProductCode"],

                    onChanged: (value){
                      InputOnChange("ProductCode", value);

                    },
                    decoration: AppInputDecoration("Product Code"),
                  ),
                  SizedBox(height: 20,),
                  TextFormField(
                    initialValue : Formvalues["TotalPrice"],

                    onChanged: (value){
                      InputOnChange("TotalPrice", value);

                    },
                    decoration: AppInputDecoration("Total Price"),
                  ),
                  SizedBox(height: 20,),

                  appDecoratedBox(

                      DropdownButton(
                          value: Formvalues['Qty'],
                          isExpanded: true,
                          underline: Container(),

                          items: [
                            DropdownMenuItem(child: Text("Select QT"),value: "",),
                            DropdownMenuItem(child: Text("1 pcs"),value: "1 pcs",),
                            DropdownMenuItem(child: Text("2 pcs"),value: "2 pcs",),
                            DropdownMenuItem(child: Text("3 pcs"),value: "3 pcs",),

                          ],
                          onChanged: (value){
                            InputOnChange("Qty", value);

                          }

                      )
                  ),
                  SizedBox(height: 20,),

                  Container(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: AppButtonStyle(),
                      onPressed: (){
                        FormValidity();
                      },
                      child: SuccessButtonChild("Add Item"),
                    ),
                  ),



                ],
              ),
            ))

            ),
          )
        ],
      ),
    );
  }
}
