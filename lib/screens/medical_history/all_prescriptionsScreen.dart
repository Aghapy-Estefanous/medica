import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:medica/shared/SharedWidget.dart';
import 'package:medica/shared/styles/AppColor.dart';

class prescriptionsScreen extends StatelessWidget {
  const prescriptionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBarWidget(context,"Patient Prescription"),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
                children: [
          Expanded(
            child: ListView.separated(
                itemCount: 3,
                separatorBuilder:(context, index) => SizedBox(height: 8,),
                itemBuilder: (context, index) {
                  return Container(
                    //color: AppColor.primaryColor,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      color:const Color.fromARGB(219, 2, 78, 154)
                      // gradient: LinearGradient(
                      //   begin: Alignment.topCenter,
                      //   end: Alignment.bottomCenter,
                      //   colors: [
                      // //    Color.fromARGB(255, 62, 136, 210),
                      //  Color.fromARGB(255, 214, 226, 238),
                     
                      // AppColor.primaryColor,   
                         
                      //   ],
                      // ),
                    ),
                    child: ListTile(
                        leading: Icon(
                          Icons.receipt,
                          color:Color.fromARGB(255, 230, 226, 226),
                          size: 44,
                        ),
                        title: Text("Serum Fibrinogen Test",style:Theme.of(context).textTheme.bodyLarge?.copyWith(color:AppColor.whiteColor,)),
                        subtitle: Column(
                          children: [
                            SizedBox(height: 6,),
                            Text(
                                'description ,fdtyfahb cxzjhghhfhgghfgghfhgfhghgghgh',style:Theme.of(context).textTheme.bodyMedium?.copyWith(color:Color.fromARGB(255, 221, 216, 216))),
                            Row(
                              children: [
                                Spacer(
                                  flex: 2,
                                ),
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.now_wallpaper,color: Colors.orange,)),
                                SizedBox(
                                  width: 20,
                                ),
                                IconButton(
                                    onPressed: () {}, icon: Icon(Icons.downloading,color: Colors.orange,)),
                              ],
                            ),
                          ],
                        )),
                  );
                }),
          )
                ],
              ),
        ));
  }
}

