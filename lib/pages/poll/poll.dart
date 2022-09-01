import 'package:eventapp/models/poll_model.dart';
import 'package:eventapp/pages/poll/poll_option.dart';
import 'package:eventapp/pages/poll/poll_question.dart';
import 'package:eventapp/providers/poll_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Poll extends StatelessWidget {
  const Poll({
    Key? key,
    required this.poll,
  }) : super(key: key);

  final PollModel? poll;

  @override
  Widget build(BuildContext context) {
    final pollProvider = Provider.of<PollProvider>(context, listen: true);

    final poll = pollProvider.poll;

    return Column(
      children: [
        PollQuestion(
          poll!.title,
        ), //Question
        if (pollProvider.answered == null)
          ...(poll.pollOptions).asMap().entries.map((option) {
            return PollOption(
              onChanged: () => pollProvider.selected = option.value,
              text: option.value.text,
              label: option.key.toString(),
              value: option.value.iri,
              selected: option.value.selected,
            );
          }).toList()
        else
          const Text('Answered'),
        if (pollProvider.answered == null && pollProvider.selected != null)
          ElevatedButton(
              onPressed: () async {
                try {
                  await pollProvider.sendResponse();
                } catch (e) {
                  final snackBar = SnackBar(
                    content: Text(e.toString()),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              },
              child: const Text('Beküldés'))
      ],
    ); //Column

    // return Column(
    //   children: [
    //     Center(
    //       child: Padding(
    //         padding: const EdgeInsets.all(28.0),
    //         child: Column(
    //           children: [
    //             Text(poll!.title),
    //             ListView.separated(
    //               padding: const EdgeInsets.all(16),
    //               separatorBuilder: (BuildContext context, int index) {
    //                 return const SizedBox(
    //                   height: 16,
    //                 );
    //               },
    //               itemCount: poll.pollOptions.length,
    //               shrinkWrap: true,
    //               itemBuilder: (BuildContext context, int index) {
    //                 return Text(poll.pollOptions[index].text);
    //               },
    //             ),
    //           ],
    //         ),
    //       ),
    //     ),
    //     ElevatedButton(
    //       onPressed: () => pollProvider.reset(),
    //       child: const Text('Reset'),
    //     ),
    //   ],
    // );
  }
}
