import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:instagram_app/pages/Mypage.dart';

class MyHomePage extends StatefulWidget {
  static final String id='MyHomePage';
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var currentIndex=0;
   var _pages=[
     FeedPage(),
     FeedPage(),
     FeedPage(),
     FeedPage(),
   ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar:AppBar(
        leading: IconButton(icon: Icon(Feather.camera,color:Theme.of(context).buttonColor),onPressed: (){},),
        brightness: Brightness.dark,

        elevation: 0,
        centerTitle: true,
        title: Text("Instagram",style: TextStyle(color:Theme.of(context).buttonColor,fontSize:20),),
        backgroundColor:Theme.of(context).primaryColor,
        actions: [
          IconButton(icon: Icon(Feather.tv,color:Theme.of(context).buttonColor),onPressed: (){},),
          IconButton(icon: Icon(FontAwesome.send_o),color:Theme.of(context).buttonColor,onPressed: (){},),
        ],
      ) ,
      body: _pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (i){setState(() {
          currentIndex=i;
        });},
        type: BottomNavigationBarType.fixed,
        showSelectedLabels:false,
          showUnselectedLabels:false,
        selectedItemColor: Colors.black,
          items: [
            BottomNavigationBarItem(icon:Icon(Foundation.home,),
              title:Text('Feed')
            ),
            BottomNavigationBarItem(icon:Icon(Feather.search),
                title:Text('search')
            ),
            BottomNavigationBarItem(icon:Icon(Feather.plus_square,),
                title:Text('square')
            ),
            BottomNavigationBarItem(icon:Icon(Feather.heart,),
                title:Text('Likes')
            ),
            BottomNavigationBarItem(icon:GestureDetector(onTap: (){},
              child: Container(
                height: 30,
                  width: 30,
                  child: CircleAvatar(backgroundImage: AssetImage('assets/images/feed_2.jpeg',),)),
            ),
                title:Text('Account')
            ),

          ],

      ),
    );

  }
}
