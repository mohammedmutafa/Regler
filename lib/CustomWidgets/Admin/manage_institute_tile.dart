import 'package:flutter/material.dart';
import 'package:flutter_app/Classes/functions.dart';
import 'package:flutter_app/Classes/strings.dart';
import 'package:flutter_app/CustomWidgets/Common/circular_image.dart';
import 'package:flutter_app/CustomWidgets/Common/expantion_tile.dart';
import 'package:flutter_app/Classes/institute.dart';

class ManageinstituteTile extends StatefulWidget {
  final ManageFunctions functions;
  final Institute institute;

  ManageinstituteTile(this.institute, this.functions);

  @override
  _ManageinstituteTileState createState() => _ManageinstituteTileState();
}

class _ManageinstituteTileState extends State<ManageinstituteTile> {
  String strblock;

  @override
  Widget build(BuildContext context) {
    if (widget.institute.isBlocked) {
      strblock = Strings.unblock;
    } else {
      strblock = Strings.block;
    }
    return InkWell(
      onTap: () {},
      child: Card(
        child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 2.0),
            child: AppExpansionTile(
              title: Row(
                children: <Widget>[
                  Icon(Icons.location_city, color: Colors.red),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(widget.institute.name)
                ],
              ),
              children: <Widget>[
                Row(
                  children: <Widget>[
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.35,
                      child: Column(
                        children: <Widget>[
                          Text(Strings.lbldirrector),
                        ],
                      ),
                    ),
                    SizedBox(
                      child: Row(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(10.0),
                            child: CircularImage(
                              NetworkImage(widget.institute.dirImgUrl),
                              width: 30,
                              height: 30,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(widget.institute.directorName),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    SizedBox(
                      width: 5.0,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: RawMaterialButton(
                        onPressed: () {
                          widget.functions.change(widget.institute);
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 5.0, horizontal: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.supervised_user_circle,
                                size: 15.0,
                              ),
                              SizedBox(
                                width: 2.0,
                              ),
                              Text(Strings.lblchDir),
                            ],
                          ),
                        ),
                        fillColor: Colors.blue,
                        splashColor: Colors.blueAccent,
                        shape: const StadiumBorder(),
                      ),
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: RawMaterialButton(
                        onPressed: () {
                          widget.functions.block(widget.institute);
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 5.0, horizontal: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.block,
                                size: 15.0,
                              ),
                              SizedBox(
                                width: 2.0,
                              ),
                              Text(strblock),
                            ],
                          ),
                        ),
                        fillColor: Colors.orange,
                        splashColor: Colors.orangeAccent,
                        shape: const StadiumBorder(),
                      ),
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: RawMaterialButton(
                        onPressed: () {
                          widget.functions.delete(widget.institute);
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 5.0, horizontal: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.delete,
                                size: 15.0,
                              ),
                              SizedBox(
                                width: 2.0,
                              ),
                              Text(Strings.delete),
                            ],
                          ),
                        ),
                        fillColor: Colors.red,
                        splashColor: Colors.redAccent,
                        shape: const StadiumBorder(),
                      ),
                    ),
                  ],
                )
              ],
            )),
      ),
    );
  }
}
