import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SerchresultPage extends StatefulWidget {
  const SerchresultPage({Key? key, this.result}) : super(key: key);
  final result;
  @override
  _SerchresultPageState createState() => _SerchresultPageState();
}

class _SerchresultPageState extends State<SerchresultPage> {
  var isgrid = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("iTunes"),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: !isgrid ? Colors.black : Colors.grey.shade800,
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          isgrid = !isgrid;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color:
                                !isgrid ? Colors.black : Colors.grey.shade800,
                            borderRadius: BorderRadius.circular(10)),
                        child: const Padding(
                          padding: EdgeInsets.all(20),
                          child: Center(child: Text("Grid Layout")),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          isgrid = !isgrid;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: isgrid ? Colors.black : Colors.grey.shade800,
                            borderRadius: BorderRadius.circular(10)),
                        child: const Padding(
                          padding: EdgeInsets.all(20),
                          child: Center(child: Text("List Layout")),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            !isgrid
                ? Expanded(
                    child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          childAspectRatio: 0.5,
                        ),
                        shrinkWrap: true,
                        itemCount: widget.result.length,
                        itemBuilder: (context, i) {
                          return InkWell(
                            onTap: () {},
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  Expanded(
                                    flex: 4,
                                    child: widget.result[i]["artworkUrl30"] ==
                                            null
                                        ? SizedBox()
                                        : Image.network(
                                            widget.result[i]["artworkUrl30"],
                                            scale: 0.3,
                                          ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(widget.result[i]["artistName"]),
                                          // Text(
                                          //   widget.result[i]["trackName"],
                                          //   softWrap: true,
                                          // ),
                                          // Text(widget.result[i]["kind"])
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                  )
                : Expanded(
                    child: ListView.builder(
                        itemCount: widget.result.length,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext, i) {
                          return InkWell(
                            onTap: () {},
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: widget.result[i]["artworkUrl30"] ==
                                            null
                                        ? SizedBox()
                                        : Image.network(
                                            widget.result[i]["artworkUrl30"],
                                            scale: 0.3,
                                          ),
                                  ),
                                  Expanded(
                                    flex: 4,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(widget.result[i]["artistName"]),
                                          Text(
                                            widget.result[i]["trackName"],
                                            softWrap: true,
                                          ),
                                          Text(widget.result[i]["kind"])
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                  )
          ],
        ),
      ),
    );
  }
}
