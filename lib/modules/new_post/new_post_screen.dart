import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../layouts/cubit/cubit.dart';
import '../../layouts/cubit/state.dart';

class NewPostScreen extends StatelessWidget {
  var textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: Text('New post'),
        );
        // return Scaffold(
        //   appBar: defaultAppBar(
        //     context: context,
        //     title: 'Create Post',
        //     actions: [
        //       defaultTextButton(
        //         function: ()
        //         {
        //           var now = DateTime.now();

        //           if (HomeCubit.get(context).postImage == null)
        //           {
        //             HomeCubit.get(context).createPost(
        //               dateTime: now.toString(),
        //               text: textController.text,
        //             );
        //           } else
        //             {
        //               HomeCubit.get(context).uploadPostImage(
        //                 dateTime: now.toString(),
        //                 text: textController.text,
        //               );
        //             }
        //         },
        //         text: 'Post',
        //       ),
        //     ],
        //   ),
        //   body: Padding(
        //     padding: const EdgeInsets.all(20.0),
        //     child: Column(
        //       children: [
        //         if(state is HomeCreatePostLoadingState)
        //           LinearProgressIndicator(),
        //         if(state is HomeCreatePostLoadingState)
        //           SizedBox(
        //           height: 10.0,
        //         ),
        //         Row(
        //           children: [
        //             CircleAvatar(
        //               radius: 25.0,
        //               backgroundImage: NetworkImage(
        //                 'https://image.freepik.com/free-photo/skeptical-woman-has-unsure-questioned-expression-points-fingers-sideways_273609-40770.jpg',
        //               ),
        //             ),
        //             SizedBox(
        //               width: 15.0,
        //             ),
        //             Expanded(
        //               child: Text(
        //                 'Abdullah Mansour',
        //                 style: TextStyle(
        //                   height: 1.4,
        //                 ),
        //               ),
        //             ),
        //           ],
        //         ),
        //         Expanded(
        //           child: TextFormField(
        //             controller: textController,
        //             decoration: InputDecoration(
        //               hintText: 'what is on your mind ...',
        //               border: InputBorder.none,
        //             ),
        //           ),
        //         ),
        //         SizedBox(
        //           height: 20.0,
        //         ),
        //         if(HomeCubit.get(context).postImage != null)
        //           Stack(
        //           alignment: AlignmentDirectional.topEnd,
        //           children: [
        //             Container(
        //               height: 140.0,
        //               width: double.infinity,
        //               decoration: BoxDecoration(
        //                 borderRadius: BorderRadius.circular(4.0,),
        //                 image: DecorationImage(
        //                   image: FileImage(HomeCubit.get(context).postImage),
        //                   fit: BoxFit.cover,
        //                 ),
        //               ),
        //             ),
        //             IconButton(
        //               icon: CircleAvatar(
        //                 radius: 20.0,
        //                 child: Icon(
        //                   Icons.close,
        //                   size: 16.0,
        //                 ),
        //               ),
        //               onPressed: ()
        //               {
        //                 HomeCubit.get(context).removePostImage();
        //               },
        //             ),
        //           ],
        //         ),
        //         SizedBox(
        //           height: 20.0,
        //         ),
        //         Row(
        //           children: [
        //             Expanded(
        //               child: TextButton(
        //                 onPressed: ()
        //                 {
        //                   HomeCubit.get(context).getPostImage();
        //                 },
        //                 child: Row(
        //                   mainAxisAlignment: MainAxisAlignment.center,
        //                   children: [
        //                     Icon(
        //                       IconBroken.Image,
        //                     ),
        //                     SizedBox(
        //                       width: 5.0,
        //                     ),
        //                     Text(
        //                       'add photo',
        //                     ),
        //                   ],
        //                 ),
        //               ),
        //             ),
        //             Expanded(
        //               child: TextButton(
        //                 onPressed: () {},
        //                 child: Text(
        //                   '# tags',
        //                 ),
        //               ),
        //             ),
        //           ],
        //         ),
        //       ],
        //     ),
        //   ),
        // );
      },
    );
  }
}
