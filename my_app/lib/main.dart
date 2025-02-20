import 'package:flutter/material.dart';
import 'dart:math';

void main(){
  runApp(ProfilePage());
}

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Profile',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
        home: Profile(), 
    );
  }
}

class Profile extends StatefulWidget {

@override
  _ProfileState createState() => _ProfileState();


}

class _ProfileState extends State <Profile>{
    

List<String> posts = ["assets/images/plave1.jfif",
                      "assets/images/plave2.jfif",
                      "assets/images/plave3.jfif",
                      "assets/images/plave4.jfif",
                      "assets/images/plave5.jfif",
                      "assets/images/plave6.jfif",
                      "assets/images/plave7.jfif",
                      "assets/images/plave8.jfif",
                      "assets/images/plave10.jfif",
                      "assets/images/plave11.jfif",
                      "assets/images/plave12.jfif",
                      "assets/images/plave13.jfif",
                      "assets/images/plave14.jfif",
      ];
  


  void addPost(){
    setState(() {
      if(posts.length <14){
        int nextIndex = posts.length + 1;
        posts.add("assets/image/plave$nextIndex.jfif");
      }else{
      posts.add(posts[Random().nextInt(posts.length)]);
      }
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "@plave_asterum",
          style: TextStyle(color:Colors.black),
        ),
        ),
      backgroundColor: Colors.white,
      body: SafeArea (
        child: Column(
        children:[
          Padding(
          padding: const EdgeInsets.all(16.0),
          child: 
          
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 80,
                height: 90,
                decoration: BoxDecoration(   
                  shape: BoxShape.circle,
                  border: Border.all(color:Colors.blue.shade100, width: 2),
                  image: const DecorationImage(
                    image: AssetImage('assets/images/plave9.jfif'),
                    fit: BoxFit.cover,
                  )
                  ),
              ),
              const SizedBox(width: 20),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'plaveplave',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildStat(posts.length.toString(), 'Posts'),
                    _buildStat('123','Following'),
                    _buildStat('99999999','Followers'),
                  ],
                  ),
                  ],
                ) 

            
              ),
              TextButton(onPressed: () {}, 
              style: TextButton.styleFrom(padding: const EdgeInsets.symmetric(horizontal: 8),
              minimumSize: Size.zero,),
              child: const Text(
                'Add Bio',
                style: TextStyle(color:Colors.blue, fontSize: 14,),
                ),
              ),
            ],
          )
          ),
          Padding(
            padding: EdgeInsets.only(top:20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
               _buildTab(Icons.grid_on, 'Posts', true),
               _buildTab(Icons.movie_outlined, 'Reels', false),
               _buildTab(Icons.bookmark_border, 'Saved', false),
               _buildTab(Icons.local_offer_outlined, 'Tagged', false),
              ],
            ),
          ),

        const Divider(height: 20),

        Expanded(
          child: GridView.builder(
            padding: const EdgeInsets.all(1),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,
              crossAxisSpacing: 1,
              mainAxisSpacing: 1,
            ),
            itemCount: posts.length,
            itemBuilder: (context,index){
              return Image.asset(
                posts[index],
                fit: BoxFit.cover,
              );
            },
          ),
          ),
        ],
        
      ),
      ),
       floatingActionButton: FloatingActionButton(onPressed: addPost,
      child: const Icon(Icons.add),
      ),
    );
  }
  Widget _buildStat(String value, String label){
    return Column(
      children: [
        Text(value,
         style:const TextStyle(
          fontSize: 18, 
          fontWeight: FontWeight.bold, ),
          ),
          Text(label,style:const TextStyle(color:Colors.grey)),
      ],
      );
  }

  Widget _buildTab(IconData icon, String label, bool isSelected){
    return Expanded(
      child: Column(children: [
        Icon(
          icon,
          size: 24,
          color: isSelected ? Colors.blue:Colors.grey,
        ),
        const SizedBox(height: 4 ),
        Text(
          label,
          style: TextStyle(
            color:isSelected?Colors.blue:Colors.grey,
            fontSize: 12,
          ))
      ],),
    );
  }
}