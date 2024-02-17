
import 'package:flutter/material.dart';
import 'package:mod2/user_prov.dart';
import 'package:provider/provider.dart';


class UserDetailsScreen extends StatefulWidget {
  String username;
  UserDetailsScreen({required this.username});

  @override
  _UserDetailsScreenState createState() => _UserDetailsScreenState();

}

class _UserDetailsScreenState extends State<UserDetailsScreen> {
  var _init = true;
  var _isLoading = false;


  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    if (_init) {
      setState(() {
        _isLoading = true;
      });

      Provider.of<Userprovider>(context).getUserprofile(widget.username);
      setState(() {
        _isLoading = false;
      });
    }
    _init = false;
  }

  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.username),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
    );
  }


}