import 'package:final_contact_assignment_map/model/people.dart';
import 'package:final_contact_assignment_map/model/utils/constraints.dart';
import 'package:final_contact_assignment_map/model/utils/helper.dart';
import 'package:final_contact_assignment_map/model/view/favorite_details.dart';
import 'package:final_contact_assignment_map/model/view/screen_hero_details.dart';
import 'package:final_contact_assignment_map/model/view/widget/widget_insert_hero.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';





class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  List<People> heroList = [];
  @override
  void initState() {
    heroList = Helper.getAllHeroes();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(

        appBar: AppBar(
          toolbarHeight: 100
          ,
            backgroundColor: Color(0xffFAFAFA),
          elevation: 0,
            title: Container(
              margin: EdgeInsets.only(left: 20),
              child: Text("Contacts",style: TextStyle(
                  fontSize: 25,color: Color(0xff1D1F35),
                  fontFamily: 'Bodoni Moda',fontWeight: FontWeight.bold),),
            ),

            actions: [
             Container(
                margin: EdgeInsets.only(right: 20),
                child:
                //Icon(Icons.add,color: Color(0xffC24A3E),size: 30,),
               IconButton(icon: Icon(Icons.add,color: Color(0xffC24A3E),size: 30,),
                 onPressed: (){
                   Navigator.of(context).push(MaterialPageRoute(
                       builder: (context) => InsertHero(onSuccess: (){
                         setState(() {
                           heroList=Helper.getAllHeroes();
                           print("Called Successfull");
                           print("${heroList.length}");

                         });
                       },)));
                 },)

              ),
              //SizedBox(height: 0,width: 180,),


            ],

          ),


          /*floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add,color: Colors.white,),
            onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => InsertHero(onSuccess: (){
                    setState(() {
                      heroList=Helper.getAllHeroes();
                      print("Called Successfull");
                      print("${heroList.length}");

                    });
                  },)));
            },
          ),*/
        //backgroundColor: Color(0xffFBEFF8),
        //backgroundColor: Colors.white,
          body: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            physics: ScrollPhysics(),
            children: [
          Padding(
          padding: const EdgeInsets.all(25.0),

              child: TextField(
                onChanged: (key){
                  setState(() {
                    if(key.isNotEmpty){
                      heroList=Helper.searchHero(key);
                    }else{
                      heroList=Helper.getAllHeroes();
                    }
                  });

                },
                decoration: InputDecoration(
                  fillColor: Color(0xfff7fdff),
                  filled: true,
                  hintText: "Search",
                  isDense: true,
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey,
                    size: 26,
                  ),
                  contentPadding: EdgeInsets.all(15),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
          ),

              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  physics: ScrollPhysics(),
                  itemBuilder :(context,index) {
                    People hero= heroList[index];
                    return Card(
                      elevation: 0,
                      child: ListTile(
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => HeroDetails(id: hero.id,number:hero.number,onRefresh: (){
                                setState(() {
                                  heroList = Helper.getAllHeroes();


                                });
                              },
                              )
                          )
                          );
                        },


                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(3),
                          child: Image.asset(hero.image ?? 'assets/images/unknown.jpg', fit: BoxFit.cover, height: 55,width: 54,
                          ),
                          /*child: CircleAvatar(
                        backgroundColor: Colors.teal.shade50,
                        child: Image.asset(hero.image, fit: BoxFit.cover,)
                        //Text(hero.name,style: TextStyle(fontSize: 9),),
                      ),*/
                        ),

                        title: Text(hero.name,style: TextStyle(fontWeight: FontWeight.bold,
                            fontSize: 17,
                            color: Color(0xff412C2D),
                            fontFamily: 'Bodoni Moda'),
                        ),
                        subtitle: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(hero.subtitle?? '',style: TextStyle(fontSize: 15,color: Colors.grey.shade500),),





                          ],
                        ),
                        trailing: IconButton(
                            icon: Icon(hero.isFavorite ? Icons.favorite : Icons.favorite_border,
                              color: Colors.deepOrange,),
                            onPressed: (){
                              Navigator.of(context).push(MaterialPageRoute(builder:(context)=>FavoriteContact()) );
                              setState(() {
                                heroes[hero.id].isFavorite=!heroes[hero.id].isFavorite;
                              });



                            }),
                      ),
                    );

                  },
                  itemCount: heroList.length,
                  shrinkWrap: true,

                  ),
              ),


            ],

          ),






      ),

    );
  }
}
