import 'package:flutter/material.dart';
import 'package:mod2/userDetails.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _usernameControl=new TextEditingController();
  final GlobalKey<FormState> _formKey=GlobalKey();

  void submit(){
    if(!_formKey.currentState!.validate()){
      return;
    }
    Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>UserDetailsScreen(username: _usernameControl.text,
    )));
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title:const Text("GIT-HUB"),centerTitle:true,
        backgroundColor: Colors.black,
      ),


      body:SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(left: 10,right: 10,bottom: 10,top: 70),
          child:Form(
          key: _formKey,
          child:Column(children: <Widget>[
            Image.asset('assets/images/github--v1.png'),
            SizedBox(height:50,),
            Container(
              decoration: BoxDecoration(color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10)),
            child: TextFormField(
              controller: _usernameControl,
              style: TextStyle(color: Colors.grey),

              validator: (value){
                if(value!.isEmpty){
                  return 'NULL';
                }
              },
              onFieldSubmitted: (ctx){
                submit();
              },

              decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10),
                  hintStyle:TextStyle(color:Colors.grey),
                  hintText: "Username",
                  border: InputBorder.none),
            ),
        ),
    SizedBox(height:20),
          Container(
          width:double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Color(0xff330033),
          ),
          child:FilledButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
            ),
                onPressed:(){
                  submit();
                },
                child: Text(
                  'check',style: TextStyle(color: Colors.white,fontSize: 18),
                  ),
              ),
            )
            ],
          )),
        ),
      ),
    );
  }
}
