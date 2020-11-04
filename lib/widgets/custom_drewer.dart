import 'package:flutter/material.dart';
import 'package:flutter_soical_ui/data/data.dart';
import 'package:flutter_soical_ui/screens/home_screen.dart';
import 'package:flutter_soical_ui/screens/login_screen.dart';
import 'package:flutter_soical_ui/screens/profile_screen.dart';

class CustomDrawer extends StatelessWidget {
  Widget _buildDrawerOption(Icon icon, String title, Function onTap) {
    return ListTile(
      leading: icon,
      title: Text(title, style: TextStyle(fontSize: 20.0),),
      onTap: onTap,
    );
  }
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Stack(
            children: [
              Image(
                height: 200.0,
                width: double.infinity,
                image: AssetImage(currentUser.backgroundImageUrl),
                fit: BoxFit.cover,
              ),
              Positioned(
                left: 20.0,
                bottom: 20.0,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      height: 100.0,
                      width: 100.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                            width: 3.0, color: Theme.of(context).primaryColor),
                      ),
                      child: ClipOval(
                        child: Image(
                          fit: BoxFit.cover,
                          image: AssetImage(currentUser.profileImageUrl),
                        ),
                      ),
                    ),
                    SizedBox(width: 10.0,),
                    Text(
                      currentUser.name,
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          _buildDrawerOption(Icon(Icons.home), 'Home', (){
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=> HomeScreen(),),);
          }),
          _buildDrawerOption(Icon(Icons.chat), 'Chat', (){}),
          _buildDrawerOption(Icon(Icons.location_on), 'Map', (){}),
          _buildDrawerOption(Icon(Icons.account_circle), 'Your Profile', (){
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=> ProfileScreen(user: currentUser,)));
          }),
          _buildDrawerOption(Icon(Icons.settings), 'Settings', (){}),
          Expanded(child: Align(
            alignment: FractionalOffset.bottomCenter,
            child:  _buildDrawerOption(Icon(Icons.directions_run), 'LogOut', (){
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=> LoginScreen(),),);
            }),
          )),
        ],
      ),
    );
  }
}
