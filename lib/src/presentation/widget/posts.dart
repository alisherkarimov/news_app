import 'package:flutter/material.dart';

class BuildPost extends StatelessWidget {
  String title, image, info, time,art;

   BuildPost(this.title, this.image, this.info, this.time,this.art, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List date = [
      'yanvar',
      'fevral',
      'mart',
      'aprel',
      'may',
      'iyun',
      'iyul',
      'avgust',
      'sentabr',
      'oktabr',
      'noyabr',
      'dekabr',
    ];
    return InkWell(
        onTap: () {},
        child: Container(
          width: double.infinity,
          color: Colors.white,
          margin: const EdgeInsets.only(bottom: 0.5, top: 0.5),
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                 SizedBox(
                   width: 200,
                   child: Expanded(child: Text(
                     "source:  ${art.isNotEmpty?art:' unknown'}",
                     style:
                     const TextStyle(color: Colors.amber, fontWeight: FontWeight.w300),
                   )),
                 ),
                Row(
                  children: [

                    Text('$time ',
                        style: const TextStyle(color: Colors.grey, fontSize: 12)),

                  ],
                ),
              ]),
              const SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      height: 80,
                      width: 120,
                      margin: const EdgeInsets.only(right: 10),
                      child: Image.network(image, fit: BoxFit.fill)),
                  Expanded(
                      child: Text(
                        title,
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w500),
                      )),
                ],
              ),
            ],
          ),
        ));
  }
}


