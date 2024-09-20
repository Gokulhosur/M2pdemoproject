import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:itunesdemo/service/service.dart';

// class Media extends StatefulWidget {
//   const Media({Key? key}) : super(key: key);

//   @override
//   _MediaState createState() => _MediaState();
// }

// class _MediaState extends State<Media> {
//   @override
//   Widget build(BuildContext context) {
class Media extends ConsumerWidget {
  const Media({Key? key}) : super();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List tempdetils = [
      "Album",
      "Movieartist",
      "Ebook",
      "Movie",
      "Musicvideo",
      "Podcast",
      "song"
    ];

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Media"),
          centerTitle: true,
        ),
        body: ListView.builder(
            itemCount: tempdetils.length,
            itemBuilder: (BuildContext context, i) {
              return CheckboxListTile(
                activeColor: Colors.black,
                checkColor: Colors.white,
                value: ref.watch(medialist).contains(tempdetils[i]),
                onChanged: (val) {
                  if (val!) {
                    ref.read(medialist.notifier).addfun(tempdetils[i]);
                  } else {
                    ref.read(medialist.notifier).removefun(tempdetils[i]);
                  }
                  print(ref.watch(medialist));
                },
                title: Text(tempdetils[i]),
              );
            }),
      ),
    );
  }
}
