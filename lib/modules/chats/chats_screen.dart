import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../layouts/cubit/cubit.dart';
import '../../layouts/cubit/state.dart';

class ChatsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: Text('Chats'),
        );
        // ConditionalBuilder(
        //   condition: HomeCubit.get(context).users.length > 0,
        //   builder: (context) => ListView.separated(
        //     physics: BouncingScrollPhysics(),
        //     itemBuilder: (context, index) => buildChatItem(HomeCubit.get(context).users[index]),
        //     separatorBuilder: (context, index) => myDivider(),
        //     itemCount: HomeCubit.get(context).users.length,
        //   ),
        //   fallback: (context) => Center(child: CircularProgressIndicator()),
        // );
      },
    );
  }

  // Widget buildChatItem(HomeUserModel model) => InkWell(
  //       onTap: () {},
  //       child: Padding(
  //         padding: const EdgeInsets.all(20.0),
  //         child: Row(
  //           children: [
  //             CircleAvatar(
  //               radius: 25.0,
  //               backgroundImage: NetworkImage(
  //                 '${model.image}',
  //               ),
  //             ),
  //             SizedBox(
  //               width: 15.0,
  //             ),
  //             Text(
  //               '${model.name}',
  //               style: TextStyle(
  //                 height: 1.4,
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //     );
}
