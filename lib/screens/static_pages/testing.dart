import 'package:flutter/material.dart';
import 'package:medica/shared/styles/AppColor.dart';

class Testing extends StatelessWidget {
  Testing({Key? key}) : super(key: key);

  int selected = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              surfaceTintColor: (AppColor.secondaryTextColor),
              shadowColor: AppColor.brawn,
              foregroundColor: AppColor.bink,
              pinned: true,
              floating: true,
              expandedHeight: 160,
              flexibleSpace: FlexibleSpaceBar(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      items[selected],
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      width: 20,
                    )
                  ],
                ),
                background: ColorFiltered(
                  colorFilter: ColorFilter.mode(
                    Colors.black
                        .withOpacity(0.4), // Adjust the opacity value as needed
                    BlendMode.srcOver,
                  ),
                  child: Image.network(
                    'https://s3-alpha-sig.figma.com/img/36ae/6eb2/98c0b431c7354f8478e01f9861b5985a?Expires=1711929600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=E0FRkSMj5zgkUUpK6ITARkhOhqSFjndrYXqPUuLZeLXM7XehYgAdD2DRh7k-oqkyUb68DEiI8mtag9FvVD60If~ZINPiqXVe0NcuiwX3mAG2IMfZYHuOtkKK-9Ojgp7zfknDMErmg~q22-sUJvlmEBJ24WNZFzmbuF7F9q9AkyVdAzXMWJcTpalmnqXLVMe1vom4dNCjtz4igP9tuom7iTtJW-TJ8Q6re6Rn~rfJKHAqAHP9YQA477zPUL0sx1OXUqlkQxWTeV-n70Hvk-Gmv-AgqpHjAWDTSCAK-5GGc2bmojhI4NGSIQPQM65ObzcGSRSe7FTyjosn2XQYd-ydYQ__',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                height: 50,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        // setState(() {
                        //   selected = index;
                        // });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: selected == index
                                ? AppColor.highlightColor
                                : AppColor.dividerColor),
                        width:
                            200, // Set width for each item in the horizontal list
                        margin:
                            EdgeInsets.all(8), // Add some margin between items
                        // Example background color
                        child: Center(
                          child: Text(items[index],
                              style: TextStyle(color: Colors.white)),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            if (selected == 0)
              test1()
            else
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return ListTile(
                      title: Text('count : $index'),
                    );
                  },
                  childCount: 20,
                ),
              ),
          ],
        ),
      ),
    );
  }

  SliverList test1() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return ListTile(
            title: Text('count : $index'),
          );
        },
        childCount: 2,
      ),
    );
  }
}

List<String> items = ['التحاليل', 'نتائج التحاليل', 'تحضيرات التحاليل'];
