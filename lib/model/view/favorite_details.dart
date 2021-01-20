

import 'package:final_contact_assignment_map/model/people.dart';

import 'package:final_contact_assignment_map/model/utils/helper.dart';
import 'package:final_contact_assignment_map/model/view/widget/widget_insert_hero.dart';
import 'package:flutter/material.dart';
class FavoriteContact extends StatefulWidget {
  final int id;
  final Function onRefresh;
  final String title;
  final String subtitle;


  FavoriteContact({@required this.id, this.onRefresh,this.title,this.subtitle});
  @override
  _FavoriteContactState createState() => _FavoriteContactState();
}

class _FavoriteContactState extends State<FavoriteContact> {
  List<People> heroList = [];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    People hero = Helper.getHeroById(widget.id);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Colors.white,
        elevation: 0,



        actions: [
          Container(

            margin: EdgeInsets.only(right: 120),
            child: Container(
              margin: EdgeInsets.only(top: 30),
              child: Text("Favourites",style: TextStyle(
                  fontSize: 25,color: Color(0xff1D1F35),
                  fontFamily: 'Bodoni Moda',
                  fontWeight: FontWeight.bold),),
            ),
          ),

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
          backgroundColor: Colors.white,
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: TextField(onChanged: (key){
                  setState(() {
                    if(key.isNotEmpty){
                      heroList=Helper.searchHero(key);
                    }else{
                      heroList=Helper.getAllHeroes();
                    }
                  });

                },
                  decoration: InputDecoration(
                    fillColor: Color(0xffF9F8FC),
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
              Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35),
                    child: GridView.builder(
                itemCount: Helper.getFavoriteContact().length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    childAspectRatio: 0.80),
                    itemBuilder: (context,index){
                  People p=Helper.getFavoriteContact()[index];
                      return GridTile(
                        child: ClipRRect(
                          child: Image.asset(p.image,height: 100,
                          fit: BoxFit.cover,),
                          borderRadius: BorderRadius.circular(3),
                        ),
                          footer: Container(
                            color: Colors.white,padding: EdgeInsets.symmetric(vertical: 6),
                              child: Column(
                                children: [
                                  Text(p.name,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                   color: Color(0xff1C1311),
                                        fontFamily: 'Bodoni Moda'),),
                                  Text(p.subtitle,style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      color: Color(0xff000000),
                                      fontFamily: 'Bodoni Moda'),),
                                ],
                              ),
                          ),

                    );
                    }
                    ),
                  )),
              //Text(hero?.name??'')
            ],
          ),

    );

  }

}

/*
class ItemCard extends StatelessWidget {
  final People hero;
  final Function press;
  const ItemCard({
    Key key,
    @required this.hero, this.press,
  }) : super(key: key);

  //final People hero;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(20),
          */
/*height: 180,
          width: 160,*//*

          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Image.asset(hero?.image ?? 'assets/images/unknown.jpg',fit: BoxFit.cover,),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Text(hero.name ?? "",
            style: TextStyle(color: Color(0xff898A96)),),
        ),
        Text(hero.subtitle,style: TextStyle(
            fontWeight: FontWeight.bold,color: Color(0xff8D8E99) ),)
      ],
    );
  }
}
*/
