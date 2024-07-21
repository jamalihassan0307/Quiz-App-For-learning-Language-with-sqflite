import 'package:flutter/material.dart';
// import 'package:quiz_app/DB/database_querys.dart';
import 'package:quiz_app/models/result_model.dart';
import 'package:quiz_app/themes/color.dart';
import 'package:quiz_app/themes/staticdata.dart';

class OldResultPage extends StatefulWidget {
  const OldResultPage({Key? key}) : super(key: key);

  @override
  State<OldResultPage> createState() => _OldResultPageState();
}

class _OldResultPageState extends State<OldResultPage> {
  @override
  void initState() {
    getdata();
    super.initState();
  }

  getdata() {
    StaticData.gettheresult();
    Future.delayed(const Duration(milliseconds: 200), () {
      setState(() {});
    });
  }

  var height, width;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
//     SQLQuery.deletedata("Drop table ResultModel").then((value) {
//       print("dsbsdf");
//     });
//     SQLQuery.createTabledata('''
// CREATE TABLE IF NOT EXISTS ResultModel (
//         id VARCHAR(255) NOT NULL PRIMARY KEY,
//         result VARCHAR(255) NOT NULL,
//         award VARCHAR(255) NOT NULL,
//         percentage VARCHAR(255) NOT NULL,
//         language VARCHAR(255) NOT NULL,
//         image VARCHAR(255) NOT NULL,
//         time VARCHAR(255) NOT NULL
//       );
// ''').then((value) {
//       print("dsbsdf");
//     });
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: ThemeColor.white),
        backgroundColor: ThemeColor.lightPrimary,
        title: const Text('Old Results',
            style: TextStyle(
              color: ThemeColor.white,
            )),
      ),
      body: Container(
        color: ThemeColor.lightPrimary,
        height: height,
        width: width,
        child: StaticData.result_model_list.isEmpty
            ? Center(
                child: RichText(
                  text: TextSpan(
                    children: [
                      for (var i = 0; i < "NO Data Present".length; i++) ...[
                        TextSpan(
                          text: "NO Data Present"[i],
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(
                                fontSize: 18 + i.toDouble(),
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                              ),
                        ),
                      ]
                    ],
                  ),
                ),
              )
            : ListView.builder(
                itemCount: StaticData.result_model_list.length,
                itemBuilder: (context, index) {
                  ResultModel result = StaticData.result_model_list[index];
                  print(
                      "aaaaaa ${result.language.replaceAll(" ", "").toLowerCase()} aaaa");
                  var language =
                      result.language.replaceAll(" ", "").toLowerCase();
                  return Card(
                    margin: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        children: [
                          SizedBox(
                            width: width * 0.6,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${result.result} in $language',
                                  style: TextStyle(
                                    fontSize: width * 0.04,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  'Award: ${result.award}',
                                  style: TextStyle(
                                    fontSize: width * 0.035,
                                  ),
                                ),
                                Text(
                                  'Percentage: ${result.percentage}',
                                  style: TextStyle(
                                    fontSize: width * 0.035,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Column(
                                  children: [
                                    Image.asset(
                                      language
                                                  .replaceAll(" ", "")
                                                  .toLowerCase() ==
                                              "english"
                                          ? "assets/english.png"
                                          : language == "urdu"
                                              ? "assets/urdu.png"
                                              : language == "bengali"
                                                  ? "assets/bengali.png"
                                                  : language == "german"
                                                      ? "assets/german.png"
                                                      : language == "hindi"
                                                          ? "assets/hindi.png"
                                                          : language == "sindhi"
                                                              ? "assets/sind.png"
                                                              : "assets/punjabi.png",
                                      width: width * 0.4,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: width * 0.2,
                            child: Column(
                              children: [
                                Text(
                                  result.time,
                                  style: TextStyle(
                                    overflow: TextOverflow.visible,
                                    fontSize: width * 0.035,
                                  ),
                                ),
                                Image.asset(
                                  result.image,
                                  width: width * 0.2,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
