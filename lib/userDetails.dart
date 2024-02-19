
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
    final userProvider = Provider.of<Userprovider>(context);
    final user = userProvider.user;
print(user!.username);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.username),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: _isLoading
          ? Center(
        child: CircularProgressIndicator(),
      )
          : user != null
          ? Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Username: ${user!.username}', // Add null check (!)
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8),
            Text(
              'Followers: ${user.followers}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8),
            Text(
              'Following: ${user.followings}',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      )
          : Center(
        child: Text('User not found.'),
      ),
    );
  }


}