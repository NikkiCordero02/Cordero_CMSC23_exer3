import 'package:flutter/material.dart';
import 'dart:math';


class Profile extends StatefulWidget {

@override
  _ProfileState createState() => _ProfileState();


}

class _ProfileState extends State <Profile>{
    

List<String> posts = [];

//Adds the first 14 images in order, then random after
  void addPost(){
    setState(() {
    
      if(posts.length <14){
        int nextIndex = posts.length + 1;
        posts.add("assets/images/plave$nextIndex.jpg");
      }else{
      posts.add(posts[Random().nextInt(posts.length)]);
      }
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink.shade100,
        title: const Text(
          "@plave_memez",
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
              Container( //icon
                width: 150,
                height: 150,
                decoration: BoxDecoration(   
                  shape: BoxShape.circle,
                  border: Border.all(color:Colors.pink.shade200, width: 2),
                  image: const DecorationImage(
                    image: AssetImage('assets/images/plave9.jpg'),
                    fit: BoxFit.cover,
                  )
                  ),
              ),
              const SizedBox(width: 20),

              Expanded(
                child: 
                Padding(padding: EdgeInsets.only(top:30.0),
                child:  Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [ 
                        Text( //Name
                           '.𖥔 ݁ ˖ִ ࣪⚝₊ ⊹˚Plave .𖥔 ݁ ˖ִ ࣪⚝₊ ⊹˚',
                           style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                      ),
                        ),
                        TextButton(onPressed: () {}, 
              style: TextButton.styleFrom(padding: const EdgeInsets.symmetric(horizontal: 8),
              minimumSize: Size.zero,),
              child: const Text(
                'Add Bio',
                style: TextStyle(color:Colors.blue, fontSize: 14,),
                ),
              ),
                      ]
  
                    ),
                Padding(padding: EdgeInsets.only(top:20.0),
                child:  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [ //Status
                    _buildStat(posts.length.toString(), 'Posts'),
                    _buildStat('123','Following'),
                    _buildStat('99999999','Followers'),
                  ],
                  ),
                ),
               
                  ],
                ) ,
                )
            
              ),
              
            ],
          )
          ),
          Padding(
            padding: EdgeInsets.only(top:20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [ //tabs
               _buildTab(Icons.grid_on, 'Posts', true,),
               _buildTab(Icons.movie_outlined, 'Reels', false),
               _buildTab(Icons.bookmark_border, 'Saved', false),
               _buildTab(Icons.local_offer_outlined, 'Tagged', false),
              ],
            ),
          ),

        const Divider(height: 20),

        Expanded(
          child: posts.isEmpty ?
          const Center(
            child: Text('No Post Yet.',
            style: TextStyle(
              color: Colors.grey,
              fontSize:  16,
            ),),
          ) 
          :
           GridView.builder( //Post Area
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
          color: isSelected ? Colors.pink.shade200:Colors.grey,
        ),
        const SizedBox(height: 4 ),
        Text(
          label,
          style: TextStyle(
            color:isSelected?Colors.pink.shade200:Colors.grey,
            fontSize: 12,
          ))
      ],),
    );
  }
}