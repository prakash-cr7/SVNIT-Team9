import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black87,
        leading: GestureDetector(
               onTap: () { /* Write listener code here */ },
               child: Icon(
               Icons.arrow_back,  // add custom icons also
    ),
  ),
        ),
      body: Column(children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            child: Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                padding: const EdgeInsets.fromLTRB(10,0, 0, 5),
                child: Text("APPL PRICE",style: TextStyle(color: Colors.grey,fontSize: 10) ,),
          ),
          Padding(
                padding: const EdgeInsets.fromLTRB(10,0, 0, 5),
                child: Text("\$153",style: TextStyle(color: Colors.grey,fontSize: 30) ,),
          ),
          Padding(
                padding: const EdgeInsets.fromLTRB(10,0, 0, 5),
                child: Text("+1.2%",style: TextStyle(color: Colors.green,fontSize: 10,), textAlign: TextAlign.left,),
          ),
                  ],
                ),

                Padding(
                  padding: const EdgeInsets.fromLTRB(220, 0, 0, 0),
                  child: CircleAvatar(backgroundColor: Colors.white,radius: 25,),
                )
              ],
            ),
          ),
        ),
        SizedBox(height: 3,),
        Container(
          height: MediaQuery.of(context).copyWith().size.height / 2,
           decoration: BoxDecoration(
    border: Border.all(color: Colors.white)
        )),
        SizedBox(height: 3,),
        Row(
          children: [
            FlatButton(onPressed: (){}, child: Text("1H",style: TextStyle(color: Colors.amber[900],) ,)),
            FlatButton(onPressed: (){}, child: Text("1D",style: TextStyle(color: Colors.white,) ,)),
            FlatButton(onPressed: (){}, child: Text("1M",style: TextStyle(color: Colors.white) ,)),
            FlatButton(onPressed: (){}, child: Text("1Y",style: TextStyle(color: Colors.white) ,)),
          ],
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
          child: Text("About The Company" ,style: TextStyle(color: Colors.white,fontSize: 20),),
        ),
      ],),
    );
  }

}