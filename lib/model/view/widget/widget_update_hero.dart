import 'package:final_contact_assignment_map/model/people.dart';
import 'package:final_contact_assignment_map/model/utils/helper.dart';
import 'package:flutter/material.dart';

class UpdateHero extends StatefulWidget {
  final int id;
  final Function() onSuccess;

  UpdateHero({this.id, this.onSuccess, String number, String email});

  @override
  _UpdateHeroState createState() => _UpdateHeroState();
}

class _UpdateHeroState extends State<UpdateHero> {
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController emailController = TextEditingController();



  People hero;

  @override
  void initState() {
    hero = Helper.getHeroById(widget.id);
    nameController.text = hero.name;
    numberController.text = "${hero.number}";
    emailController.text = hero.email;


    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 80,
        automaticallyImplyLeading: true,


        actions: [
          Container(
              margin: EdgeInsets.all(13),
              child: Icon(
                Icons.arrow_back_ios,
                color: Color(0xff412C2D),
              )),
          Container(
            margin: EdgeInsets.only(right: 67),
            alignment: Alignment.centerLeft,
            child: Text("Update Account",
                style: TextStyle(
                  fontSize: 25,
                  color: Color(0xff412C2D),
                  fontWeight: FontWeight.normal,
                  fontFamily: 'Bodoni Moda',
                ),
                textAlign: TextAlign.start),
          ),
          Container(
              margin: EdgeInsets.all(10),
              child: Icon(
                Icons.more_vert,
                color: Color(0xff412C2D),
              ))
        ],

      ),
      backgroundColor: Colors.white,

      body: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        physics: ScrollPhysics(),
        padding: EdgeInsets.all(16.0),
        children: [
          Column(
            children: [
              InkWell(
                child: Container(
                    decoration: BoxDecoration(
                        color: Color(0xffFFF8F7),
                        borderRadius: BorderRadius.all(Radius.circular(2))),
                    height: 100,
                    width: 100,
                    child: Icon(
                      Icons.local_see_outlined,
                      size: 40,
                      color: Color(0xffFF9186),
                    )),
              ),
              SizedBox(height: 10,),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Center(
                  child: Text(
                    "Add Photo",
                    style: TextStyle(
                        fontSize: 17,color: Color(0xff535566),fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Container(
                margin: EdgeInsets.only(top: 15),
                child: Center(
                  child: Text(
                    "Will only be saved on the phone",
                    style: TextStyle(
                        fontSize: 17,color: Color(0xffC7C7CC),fontWeight: FontWeight.normal),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 15,),
          Container(
            margin: EdgeInsets.all(10),
            child: TextField(
              controller: nameController,
                style: TextStyle(color: Color(0xffB4B4BC),
                    fontSize: 17,fontFamily: 'Bodoni Moda'),
                decoration: new InputDecoration(
                  hintText: "Add Name",
                  isDense: true,
                  border: InputBorder.none,
                  prefixIcon: Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: Icon(
                      Icons.person_outline_rounded,
                      color: Color(0xffFFA49B),
                      size: 26,
                    ),
                  ),
                )
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextField(
              controller: numberController,
                style: TextStyle(color: Color(0xffB4B4BC),
                    fontSize: 17,fontFamily: 'Bodoni Moda'),
                decoration: new InputDecoration(
                  hintText: "Mobile Number",
                  isDense: true,
                  border: InputBorder.none,
                  prefixIcon: Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: Icon(
                      Icons.phone,
                      color: Color(0xff826DD7),
                      size: 26,
                    ),
                  ),
                )
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextField(
              controller: emailController,
                style: TextStyle(color: Color(0xffB4B4BC),
                    fontSize: 17,fontFamily: 'Bodoni Moda'),
                decoration: new InputDecoration(
                  hintText: "Email Address" ,
                  isDense: true,
                  border: InputBorder.none,
                  prefixIcon: Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: Icon(
                      Icons.email,
                      color: Color(0xffE57674),
                      size: 26,
                    ),
                  ),
                )
            ),
          ),


          SizedBox(
            height: 12,
          ),
          Container(
            margin: EdgeInsets.all( 20),
            child: RaisedButton(
                color: Color(0xffFF7163),
                onPressed: () {
                  hero.name = nameController.text;
                  hero.number = numberController.text;
                  hero.email=emailController.text;

                  if (Helper.updateHero(hero)) {
                    widget.onSuccess();
                    Navigator.of(context).pop();
                  } else {
                    print("Update failed");
                  }
                },
                textColor: Colors.white,
                padding: const EdgeInsets.all(0.0),
                child:  Text(
                  "Update",
                  style: TextStyle(fontSize: 20),
                )
            ),
          ),
        ],
      ),
    );
  }
}
