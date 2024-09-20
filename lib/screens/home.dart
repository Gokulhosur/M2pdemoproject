import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:itunesdemo/models/apicall.dart';
import 'package:itunesdemo/screens/media.dart';
import 'package:itunesdemo/screens/serchresult_page.dart';
import 'package:itunesdemo/service/service.dart';

TextEditingController serchtext = TextEditingController();

class Home extends ConsumerWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 50),
                child: Image.asset(
                  "assets/itunes logo.png",
                  scale: 2,
                ),
              ),
              const Text(
                "Search for a variety of content form the iTunes store including iBooks, movies, podcost, music, music videos, and audiobooks",
                style: TextStyle(fontSize: 16),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 20),
                child: TextFormField(
                  controller: serchtext,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const Text(
                "Specify the parameter for the content to be searched",
                style: TextStyle(fontSize: 16),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 40),
                child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const Media()));
                  },
                  child: Container(
                    width: width,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade800,
                        borderRadius: BorderRadius.circular(5)),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Wrap(
                        children: [
                          for (int i = 0; i < ref.watch(medialist).length; i++)
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 10, bottom: 10),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.black26,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Text(ref.watch(medialist)[i]),
                                ),
                              ),
                            )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              InkWell(
                  onTap: () async {
                    if (serchtext.text != "") {
                      var result = await servercall.search(
                          serchtext.text, ref.watch(medialist));

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  SerchresultPage(result: result)));
                    }
                  },
                  child: Container(
                      width: width,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade800,
                          borderRadius: BorderRadius.circular(10)),
                      child: const Padding(
                        padding: EdgeInsets.all(20),
                        child: Center(child: Text("Submit")),
                      )))
            ],
          ),
        ),
      ),
    );
  }
}
