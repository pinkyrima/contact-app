import 'package:final_contact_assignment_map/model/people.dart';
import 'package:final_contact_assignment_map/model/utils/helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InsertHero extends StatefulWidget {
  final Function() onSuccess;

  InsertHero({this.onSuccess});

  @override
  _InsertHeroState createState() => _InsertHeroState();
}

class _InsertHeroState extends State<InsertHero> {
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController emailController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 80,

        actions: [
          Container(
              margin: EdgeInsets.all(15),
              child: Icon(
                Icons.arrow_back_ios,
                color: Color(0xff412C2D),
              )),
          Container(
            margin: EdgeInsets.only(right: 70),
            alignment: Alignment.centerLeft,
            child: Text("Create Account",
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
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Center(
                  child: Text(
                    "Add Photo",
                    style: TextStyle(
                        fontSize: 17,color: Color(0xff535566),fontWeight: FontWeight.bold),
                  ),
                ),
              ),Container(
                margin: EdgeInsets.only(top: 15),
                child: Center(
                  child: Text(
                    "Will only be saved on the phone",
                    style: TextStyle(
                        fontSize: 17,color: Color(0xffC7C7CC),fontWeight: FontWeight.normal),
                  ),
                ),
              ),
              Container(margin: EdgeInsets.all(15),
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
            ],
          ),
          Container(
            margin: EdgeInsets.all(15),
            child: TextField(
              //controller: numberController,
                style: TextStyle(color: Color(0xffB4B4BC),
                    fontSize: 17,fontFamily: 'Bodoni Moda'),

                decoration: new InputDecoration(
                  fillColor: Colors.grey.shade100,
                  hintText: "Address",
                  isDense: true,
                  border: InputBorder.none,
                  prefixIcon: Container(
                    margin: EdgeInsets.all(10),
                    child: Icon(
                      Icons.location_on_outlined,
                      color: Color(0xffFFBAB3),
                      size: 26,
                    ),
                  ),
                )),
          ),
          Container(
            margin: EdgeInsets.all(15),
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
          ),Container(
            margin: EdgeInsets.all(15),
            child: TextField(
                controller: emailController ,
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
                      color: Color(0xff826DD7),
                      size: 26,
                    ),
                  ),
                )
            ),
          ),
          Container(
            alignment: Alignment.centerRight ,
            margin: EdgeInsets.only(top: 10),
            child: Text(
              "Add Other Field",
              style: TextStyle(
                  fontSize: 18,
                  color: Color(0xffFFBAB3),
                  fontWeight: FontWeight.bold,fontFamily: 'Bodoni Moda'),
            ),
          ),
          Container(
            margin: EdgeInsets.all( 20),
            child: RaisedButton(
              color: Color(0xffFF7163),
              onPressed: () {
                People hero = People(
                  id: Helper.getAllHeroes().first.id + 1,
                  name: nameController.text,
                  number: numberController.text,
                  email: emailController.text,


                );

                print(hero);
                if (Helper.createHero(hero)) {
                  Navigator.of(context).pop();
                  widget.onSuccess();
                } else {
                  print("Insert failed");
                }
              },
              textColor: Colors.white,
              padding: const EdgeInsets.all(2.0),
              child: Text(
                "Create Account",
                style:
                    TextStyle(fontWeight: FontWeight.normal,
                        fontSize: 18,fontFamily: 'Bodoni Moda'),
              ),

            ),
            height: 45,
            width: 30,
          )
        ],
      ),
    );
  }
}
