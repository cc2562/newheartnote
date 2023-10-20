import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' as fluq;
import 'package:iconsax/iconsax.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class viewPage extends StatefulWidget {
  const viewPage({super.key});

  @override
  State<viewPage> createState() => _viewPageState();
}

class _viewPageState extends State<viewPage> {
  fluq.QuillController _controller = fluq.QuillController.basic();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Theme.of(context).secondaryHeaderColor,
      body: SafeArea(
        child: Container(
          width: 100.w,
            height: 100.h,
            child: Stack(
              children: [
                Flex(
                  direction: Axis.horizontal,
                  children: [
                    Expanded(child: IconButton(onPressed: (){},icon:Icon(Iconsax.arrow_left,color: Colors.white,),)),
                    Expanded(child: TextButton(onPressed: (){
                      showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(1900), lastDate: DateTime(2100));
                    },child:Text("2023.3.10",style: TextStyle(color: Colors.white),),),flex: 5,),
                    Expanded(child: IconButton(onPressed: (){},icon: Icon(Icons.edit,color: Colors.white,),))
                  ],
                ),
                Flex(
                  direction: Axis.vertical,
                  children: [
                    Expanded(
                      child:Container(
                        margin: EdgeInsets.fromLTRB(0, 6.h, 0, 0),
                        padding: EdgeInsets.fromLTRB(4.w, 1.h, 4.w, 5.h),
                        width: 100.w,
                        // height: size.height-20.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Theme.of(context).cardColor
                        ),
                        child: Column(
                          children: [
                            fluq.QuillEditor.basic(
                              controller: _controller,
                              autoFocus: false,
                              focusNode: FocusNode(canRequestFocus: false),
                              readOnly: true, // true for view only mode
                            ),
                            Container(
                              child: GridView(
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                    mainAxisSpacing: 1.h,
                                    crossAxisCount: 2, //横轴三个子widget
                                    childAspectRatio: 1//宽高比为1时，子widget
                                ),
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            ),
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0, 0, 2.w, 0),
                                    width: 45.w,
                                    height: 45.w,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        image: DecorationImage(
                                          image: NetworkImage("https://img2.baidu.com/it/u=1448498779,518156696&fm=253&app=138&size=w931&n=0&f=JPEG&fmt=auto?sec=1694970000&t=0f2b2f07c50bc01ce7270aaa7cddb98c"),
                                          fit: BoxFit.cover,
                                        )
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0, 0, 2.w, 0),
                                    width: 45.w,
                                    height: 45.w,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        image: DecorationImage(
                                          image: NetworkImage("https://img2.baidu.com/it/u=1448498779,518156696&fm=253&app=138&size=w931&n=0&f=JPEG&fmt=auto?sec=1694970000&t=0f2b2f07c50bc01ce7270aaa7cddb98c"),
                                          fit: BoxFit.cover,
                                        )
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0, 0, 2.w, 0),
                                    width: 45.w,
                                    height: 45.w,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        image: DecorationImage(
                                          image: NetworkImage("https://img2.baidu.com/it/u=1448498779,518156696&fm=253&app=138&size=w931&n=0&f=JPEG&fmt=auto?sec=1694970000&t=0f2b2f07c50bc01ce7270aaa7cddb98c"),
                                          fit: BoxFit.cover,
                                        )
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0, 0, 2.w, 0),
                                    width: 45.w,
                                    height: 45.w,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        image: DecorationImage(
                                          image: NetworkImage("https://img2.baidu.com/it/u=1448498779,518156696&fm=253&app=138&size=w931&n=0&f=JPEG&fmt=auto?sec=1694970000&t=0f2b2f07c50bc01ce7270aaa7cddb98c"),
                                          fit: BoxFit.cover,
                                        )
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0, 0, 2.w, 0),
                                    width: 45.w,
                                    height: 45.w,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        image: DecorationImage(
                                          image: NetworkImage("https://img2.baidu.com/it/u=1448498779,518156696&fm=253&app=138&size=w931&n=0&f=JPEG&fmt=auto?sec=1694970000&t=0f2b2f07c50bc01ce7270aaa7cddb98c"),
                                          fit: BoxFit.cover,
                                        )
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0, 0, 2.w, 0),
                                    width: 45.w,
                                    height: 45.w,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        image: DecorationImage(
                                          image: NetworkImage("https://img2.baidu.com/it/u=1448498779,518156696&fm=253&app=138&size=w931&n=0&f=JPEG&fmt=auto?sec=1694970000&t=0f2b2f07c50bc01ce7270aaa7cddb98c"),
                                          fit: BoxFit.cover,
                                        )
                                    ),
                                  ),
                                ],
                              ),
                            ),
                           SizedBox(height: 1.h,),
                            Row(
                              children: [
                                Expanded(
                                  child:  Container(
                                    padding: EdgeInsets.all(3.w),
                                    decoration: BoxDecoration(
                                        color: Theme.of(context).secondaryHeaderColor,
                                        borderRadius: BorderRadius.circular(10)
                                    ),
                                    child: Text("我的录音1"),
                                  ),

                                )
                              ],
                            ),
                            SizedBox(height: 1.h,),
                            Row(
                              children: [
                                Expanded(
                                  child:  Container(
                                    padding: EdgeInsets.all(3.w),
                                    decoration: BoxDecoration(
                                        color: Colors.grey.shade300,
                                        borderRadius: BorderRadius.circular(10)
                                    ),
                                    child: Text("留下新的评论~"),
                                  ),

                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),

              ],
            )
        ),
      )
    );
  }
}
