

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../RestApi/RestClient.dart';
import '../Style/Style.dart';

class ProductCreateScreen extends StatefulWidget {
  @override
  State<ProductCreateScreen> createState() => _ProductCreateScreenState();
}

class _ProductCreateScreenState extends State<ProductCreateScreen> {
  Map<String,String> Formvalues = {"Img":"", "ProductCode":"", "ProductName":"", "Qty":"", "TotalPrice":"", "UnitPrice":""};
  var Loading = false;
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
      await ProductCreateRequest(Formvalues);
      setState(() {
        Loading = false;
      });
      // Formvalues.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Product Creation"),),
      body: Stack(
        children: [
          ScreenBackground(context),
          Container(
            child: (Loading) ? (Center(child: CircularProgressIndicator(),)):((SingleChildScrollView(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  TextFormField(
                    onChanged: (value){
                      InputOnChange("ProductName", value);
                    },
                    decoration: AppInputDecoration("Product Name"),
                  ),
                  SizedBox(height: 20,),
                  TextFormField(
                    onChanged: (value){
                      InputOnChange("Img", value);

                    },
                    decoration: AppInputDecoration("Product Image"),
                  ),
                  SizedBox(height: 20,),

                  TextFormField(
                    onChanged: (value){
                      InputOnChange("UnitPrice", value);

                    },
                    decoration: AppInputDecoration("Product Unit Price"),
                  ),
                  SizedBox(height: 20,),

                  TextFormField(
                    onChanged: (value){
                      InputOnChange("ProductCode", value);

                    },
                    decoration: AppInputDecoration("Product Code"),
                  ),
                  SizedBox(height: 20,),
                  TextFormField(
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
