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
  final fluq.QuillController _controller = fluq.QuillController(document: fluq.Document(), selection: const TextSelection.collapsed(offset: 0),readOnly: false
  );

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Theme.of(context).secondaryHeaderColor,
      body: SafeArea(
        child: SizedBox(
          width: 100.w,
            height: 100.h,
            child: Stack(
              children: [
                Flex(
                  direction: Axis.horizontal,
                  children: [
                    Expanded(child: IconButton(onPressed: (){},icon:const Icon(Iconsax.arrow_left,color: Colors.white,),)),
                    Expanded(flex: 5,child: TextButton(onPressed: (){
                      showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(1900), lastDate: DateTime(2100));
                    },child:const Text("2023.3.10",style: TextStyle(color: Colors.white),),),),
                    Expanded(child: IconButton(onPressed: (){},icon: const Icon(Icons.edit,color: Colors.white,),))
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
                        child: ListView(
                          children: [
                        fluq.QuillEditor.basic(
                          configurations: fluq.QuillEditorConfigurations(
                          controller: _controller,
                          autoFocus: false,
                        ),
                        ),
                            Container(
                              child: GridView(
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                    mainAxisSpacing: 1.h,
                                    crossAxisCount: 3, //横轴三个子widget
                                    childAspectRatio: 1//宽高比为1时，子widget
                                ),
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            ),
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0, 0, 2.w, 0),
                                    width: 45.w,
                                    height: 45.w,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        image: const DecorationImage(
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
                                        image: const DecorationImage(
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
                                        image: const DecorationImage(
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
                                        image: const DecorationImage(
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
                                        image: const DecorationImage(
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
                                        image: const DecorationImage(
                                          image: NetworkImage("https://img2.baidu.com/it/u=1448498779,518156696&fm=253&app=138&size=w931&n=0&f=JPEG&fmt=auto?sec=1694970000&t=0f2b2f07c50bc01ce7270aaa7cddb98c"),
                                          fit: BoxFit.cover,
                                        )
                                    ),
                                  ),
                                ],
                              ),
                            ),
                           SizedBox(height: 1.h,),
                            Container(
                              padding: EdgeInsets.all(3.w),
                              decoration: BoxDecoration(
                                  color: Theme.of(context).secondaryHeaderColor,
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child:  Container(
                                      decoration: BoxDecoration(
                                          color: Theme.of(context).secondaryHeaderColor,
                                          borderRadius: BorderRadius.circular(10)
                                      ),
                                      child: const Text("我的录音1"),
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
                                        color: Colors.grey.shade300,
                                        borderRadius: BorderRadius.circular(10)
                                    ),
                                    child: const Text("留下新的评论~"),
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
