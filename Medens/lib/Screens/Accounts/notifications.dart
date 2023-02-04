import 'package:flutter/material.dart';
void main(){
  runApp(
    MaterialApp(
      home: notify(),
    ),
  );
}

class notify extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: ListView(),
    );

        }
  Widget listView(){
        return ListView().separated(
            itemBuilder: (context, index) {
              return listViewItem(index);
            },
            separatorBuilder: (context, index){
              return Divider(height: 0);
            },
          ItemCount: 15
      );
    }
  Widget listViewItem(int index){
    return Container(
      margin: EdgeInsets.only(left: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  message(index),
                  timeAndDate(int, index),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget prefixIcon(){
    return Container(
      height: 50,
      width: 50,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey.shade300,
      ),
      child: Icon(
        Icons.notification_important_rounded,
        size: 25,
        color: Colors.grey.shade700,
      ),
    );
}
  Widget message(int index){
    double textSize = 14;
    return Container(
      child: RichText(
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
        text: TextSpan(
          text: "",
          style: TextStyle(
           fontSize: textSize,
           color: Colors.black87,
            fontWeight: FontWeight.bold,
          ),
            children: [
              text: "Praesent justo dolor, malesuada sit amet arcu sit amet, fringilla faucibus augue. Integer in magna quis tortor consequat imperdiet. Proin sit ",
              style: TextStyle(
                fontWeight: FontWeight.w400,
              ),
            ],

        ),
      ),
    );
  }

  Widget timeAndDate(int, index){
    return Container(
      margin: EdgeInsets.only(top: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'lorem',
            style: TextStyle(
              fontSize: 10,
            ),
          ),
      Text(
    'ipsum',
    style: TextStyle(
    fontSize: 10,
    ),
      ),
    ],
    )
    );
  }

}