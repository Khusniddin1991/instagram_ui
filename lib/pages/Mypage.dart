import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:instagram_app/Model/Post_Model.dart';
import 'package:instagram_app/Model/Story_Model.dart';

class FeedPage extends StatefulWidget {
  @override
  _FeedPageState createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {

  List<Story> _stories = [
    Story("assets/images/user_1.jpeg", "Jazmin"),
    Story("assets/images/user_2.jpeg", "Sylvester"),
    Story("assets/images/user_3.jpeg", "Lavina"),
    Story("assets/images/user_1.jpeg", "Jazmin"),
    Story("assets/images/user_2.jpeg", "Sylvester"),
    Story("assets/images/user_3.jpeg", "Lavina"),
  ];

  List<PostStory> _posts = [
    PostStory(
        username: "Brianne",
        userimage: "assets/images/user_1.jpeg",
        postimage: "assets/images/feed_1.jpeg",
        caption: "Consequatur nihil aliquid omnis consequatur."),
    PostStory(
        username: "Henri",
        userimage: "assets/images/user_2.jpeg",
        postimage: "assets/images/feed_2.jpeg",
        caption: "Consequatur nihil aliquid omnis consequatur."),
    PostStory(
        username: "Mariano",
        userimage: "assets/images/user_3.jpeg",
        postimage: "assets/images/feed_3.jpeg",
        caption: "Consequatur nihil aliquid omnis consequatur."),

  ];





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Theme.of(context).primaryColor,
      body:ListView(
        children: [
          Divider(),
          // Stories
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child:Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Text('Stories',style: TextStyle(color: Colors.grey,fontSize: 14),),
              Text('Watch All',style: TextStyle(color: Colors.grey,fontSize: 14),)
            ],),

          ),
          // story list
          Container(
            width: MediaQuery.of(context).size.width,
            color: Theme.of(context).primaryColor,
            height: 110,
            margin: EdgeInsets.symmetric(vertical: 10),
            // color: Colors.green,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
            itemCount:_stories.length ,
              itemBuilder: (ctx,index)=>Container(
                margin: EdgeInsets.symmetric(horizontal: 20)
                ,child: Column(children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(70),
                      border: Border.all(
                        width: 3,
                        color: Color(0xFF8e44ad),
                      ),
                    ),child: Container(
                    padding: EdgeInsets.all(
                      2,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(70),
                      child: Image(
                        image: AssetImage(_stories[index].userimage),
                        width: 70,
                        height: 70,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  ),
                SizedBox(height: 5,),
                Text(_stories[index].username,style:TextStyle(color: Colors.grey,fontSize: 16))
              ],),

              ),

            ),
          ),
          // post list
          Container(
            width: MediaQuery.of(context).size.width,
            child:Column(children:List.generate(_posts.length, (index){
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 5,vertical: 5),
                color: Theme.of(context).primaryColor,
                child: Column(
                  children: [
                    ListTile(
                      leading:CircleAvatar(backgroundImage:AssetImage( _posts[index].userimage),),
                      title: Text(_posts[index].username,style:TextStyle(color: Theme.of(context).buttonColor),),
                      trailing: Icon(SimpleLineIcons.options,color:Theme.of(context).buttonColor ,),
                    ),
                    FadeInImage(placeholder:AssetImage('assets/images/placeholder.png'),
                        image:AssetImage(_posts[index].postimage)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      Row(
                        children: [
                          IconButton(icon: Icon(FontAwesome.heart_o,color:Theme.of(context).buttonColor), onPressed: (){}),
                          IconButton(icon: Icon(FontAwesome.comment_o,color:Theme.of(context).buttonColor), onPressed: (){}),
                          IconButton(icon: Icon(FontAwesome.send_o,color:Theme.of(context).buttonColor), onPressed: (){})
                        ],
                      ),
                        IconButton(icon: Icon(FontAwesome.bookmark_o,color:Theme.of(context).buttonColor), onPressed: (){})
                    ],),
                    // tags
                    Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 14,vertical: 14),
                      child: RichText(
                        softWrap: true,
                        overflow:TextOverflow.visible ,
                        text:TextSpan(children: [
                          TextSpan(
                            text: "Liked By ",
                            style: TextStyle(color:Theme.of(context).buttonColor),
                          ),
                          TextSpan(
                            text: "Sigmund,",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          TextSpan(
                            text: " Yessenia,",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          TextSpan(
                            text: " Dayana",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          TextSpan(
                            text: " and",
                            style: TextStyle(
                              color:Theme.of(context).buttonColor,
                            ),
                          ),
                          TextSpan(
                            text: " 1263 others",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),



                        ]),

                      ),

                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 14,vertical: 5),
                      child: RichText(
                        softWrap: true,
                        overflow:TextOverflow.visible ,
                        text:TextSpan(children: [
                          TextSpan(
                            text: "${_posts[index].username}",
                            style: TextStyle(color: Colors.white),
                          ),
                          TextSpan(
                            text: "${_posts[index].caption} ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).buttonColor),
                          ),

                        ]),

                      ),

                    ),
              Container(
              margin: EdgeInsets.symmetric(
              horizontal: 14,
              ),
              alignment: Alignment.topLeft,
              child: Text(
              "Febuary 2020",

              textAlign: TextAlign.start,
              style: TextStyle(
              color: Colors.grey,
              ),))


                  ],
                ),
              );
            }))


          )
        ],
      ),
    );
  }
}
// _stories[index].userimage