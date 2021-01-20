
import 'package:final_contact_assignment_map/model/people.dart';
import 'package:final_contact_assignment_map/model/utils/constraints.dart';
import 'package:final_contact_assignment_map/model/utils/helper.dart';
import 'package:final_contact_assignment_map/model/view/favorite_details.dart';

import 'package:final_contact_assignment_map/model/view/widget/widget_update_hero.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HeroDetails extends StatefulWidget {
  final int id;
  final Function onRefresh;
  final String number;
  final String email;





   HeroDetails({this.id, this.onRefresh,this.number,this.email,});


  @override
  _HeroDetailsState createState() => _HeroDetailsState();
}

class _HeroDetailsState extends State<HeroDetails> {
  List<People> heroList = [];
  People hero;
  @override
  void initState() {
    heroList = Helper.getAllHeroes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    People hero = Helper.getHeroById(widget.id);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          automaticallyImplyLeading: true,
          iconTheme: IconThemeData(color: Colors.black, size: 24),
          actions: [
            myPopMenu()


          ],
        ),
        //backgroundColor: Colors.white,


        body: ListView(
          //shrinkWrap: true,
          scrollDirection: Axis.vertical,
          children: [
            Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 40),
                  child: ClipRRect(

                    borderRadius: BorderRadius.circular(3),
                    child: Image.asset(hero.image?? 'assets/images/unknown.jpg', fit: BoxFit.cover, height: 120,width: 120,
                    ),


                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 10),

              child: Center(

                  child: Text(hero.name,style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,color: Color(0xff27293E),
                      fontFamily: 'Bodoni Moda'
                  ),)
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),

              child: Center(

                  child: Text(hero.subtitle??'',style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,color: Color(0xffBABAC1),
                      fontFamily: 'Bodoni Moda'
                  ),)
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 110),
                    child: Text("Details",style: TextStyle(
                      shadows: [
                        Shadow(
                            color: Color(0xffFF8073),
                            offset: Offset(0, -5))
                      ],
                      fontSize: 16,
                      color: Colors.transparent,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Bodoni Moda',
                      decoration: TextDecoration.underline,
                      decorationColor: Color(0xffFF8073),
                      decorationThickness: 2,
                    ),),
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  Text("Call Log",style: TextStyle(fontSize: 16,
                      color: Color(0xffBABAC1),
                      fontFamily: 'Bodoni Moda'),)
                ],
              ),
            ),
            //Row(

              //children: [

                Container(
                  margin: EdgeInsets.all(5),
                  child: Card(
                    elevation: 0,
                    child: ListTile(
                      leading: Icon(Icons.phone,color: Color(0xff7E67D7),),
                      trailing: Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Color(0xffEFEDFB),
                          shape: BoxShape.circle
                        ),
                          child: IconButton(icon: Icon(Icons.phone,color: Color(0xff7E67D7)),
                            onPressed: _callNumber ),),
                      title: Text(hero.number,style: TextStyle(fontFamily: 'Bodoni Moda',fontSize: 17),),
                      subtitle:Text(hero.subtitle??'',style: TextStyle(fontFamily: 'Bodoni Moda',fontSize: 10),) ,
                    ),
                  ),
                ),


            Container(
              margin: EdgeInsets.all(5),
              child: Card(
                elevation: 0,
                child: ListTile(
                  leading: Icon(MdiIcons.skype,color: Color(0xff2FB7F5),size: 35,),
                  trailing: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: Color(0xffEFEDFB),
                        shape: BoxShape.circle
                    ),
                    child: IconButton(icon: Icon(Icons.phone,color: Color(0xff7E67D7)),
                        onPressed: _callNumber ),),
                  title: Text("live.bikerbisto",style: TextStyle(fontFamily: 'Bodoni Moda',fontSize: 17),),
                  subtitle:Text('Skype Account',style: TextStyle(fontFamily: "Bodoni Moda",fontSize: 10),) ,
                ),
              ),
            ),


            Container(
              margin: EdgeInsets.all(5),
              child: Card(
                elevation: 0,
                child: ListTile(
                  leading: Icon(Icons.email_outlined,color: Color(0xffE36D6A),),
                  trailing: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: Color(0xffEFEDFB),
                        shape: BoxShape.circle
                    ),
                    child: IconButton(icon: Icon(Icons.phone,color: Color(0xff7E67D7)),
                        onPressed: _callNumber ),),
                  title: Text(hero.email,style: TextStyle(fontFamily: 'Bodoni Moda',fontSize: 17),),
                  subtitle:Text(hero.subtitle??'',style: TextStyle(fontFamily: 'Bodoni Moda',fontSize: 10),) ,
                ),
              ),
            ),
                /*CircleAvatar(
                  radius: 30,
                  child: Icon(Icons.phone,color: Color(0xff745CD3),),
                ),
                CircleAvatar(
                  radius: 30,
                  child: Icon(Icons.message,color: Color(0xff745CD3),),
                ),*/
             // ],
            //),




          ],
        )
    );
  }

  Widget myPopMenu() {
    return PopupMenuButton(
        onSelected: (value) {
          print(value);
          if(value==1){
            //Navigator.push(context, route);
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => UpdateHero(
                    onSuccess: (){
                      widget.onRefresh();
                      setState(() {

                      });
                    }, id: widget.id, number:widget.number,email:widget.email)
            )
            );

          }
          else if(value==2){
            //Navigator.2 no er task
            if(Helper.deleteHero(widget.id)){
              Navigator.of(context).pop();
              widget.onRefresh();
              //print(widget.id);
            }
          }else{
            Navigator.of(context).push(MaterialPageRoute(builder:(context)=>
                FavoriteContact(id: widget.id,)) );
            setState(() {


             /* hero.isFavorite ? Icons.favorite : Icons.favorite_border;
              heroes[hero.id].isFavorite=!heroes[hero.id].isFavorite;*/
            });
            //
          }
        },
        itemBuilder: (context) => [
          PopupMenuItem(
            

              value: 1,
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(2, 2, 8, 2),
                    child: Icon(Icons.edit,color: Colors.blue),
                  ),
                  Text('Update'),

                ],
              )),
          PopupMenuItem(
              value: 2,
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(2, 2, 8, 2),
                    child: Icon(Icons.delete,color: Colors.blue),
                  ),
                  Text('Delete')
                ],
              )),
          PopupMenuItem(
              value: 3,
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(2, 2, 8, 2),
                    child: Icon(Icons.favorite_border,color: Colors.blue,),
                  ),
                  Text('Favorite')
                ],
              )),
        ]);
  }

  _callNumber() async{
     String number = widget.number; //set the number here
    bool res = await FlutterPhoneDirectCaller.callNumber(number);
  }
}
