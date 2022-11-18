import 'package:eventapp/pages/event/main/widgets/qa/message_bar.dart';
import 'package:eventapp/providers/qa_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'chat_bubble.dart';

class QA extends StatefulWidget {
  const QA({
    super.key,
    required this.qaSessionId,
  });

  final int? qaSessionId;

  @override
  State<QA> createState() => _QAState();
}

class _QAState extends State<QA> {
  final ScrollController scrollController = ScrollController();

  late Future<void> myFuture;

  @override
  void initState() {
    super.initState();
    myFuture = getQaSession();
  }

  Future<void> getQaSession() async {
    return Provider.of<QAProvider>(context, listen: false)
        .getQASession(widget.qaSessionId!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          FutureBuilder(
            future: myFuture,
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                final qASession = Provider.of<QAProvider>(context).qaSession;
                if (qASession!.qAEntries?.isEmpty ?? true == false) {
                  WidgetsBinding.instance
                      .addPostFrameCallback((_) => scrollToEnd());
                }

                return Expanded(
                  child: qASession.qAEntries?.isEmpty ?? true
                      ? const Center(
                          child: Text('Start your conversation now :)'),
                        )
                      : ListView.builder(
                          controller: scrollController,
                          reverse: true,
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: qASession.qAEntries!.length,
                          itemBuilder: (context, index) {
                            final message =
                                qASession.qAEntries!.reversed.toList()[index];

                            return ChatBubble(
                              message: message,
                            );
                          },
                        ),
                );
              }
            },
          ),
          const MessageBar(),
        ],
      ),
    );
  }

  Future<void> scrollToEnd() async {
    scrollController.animateTo(
      0,
      curve: Curves.easeOut,
      duration: const Duration(milliseconds: 300),
    );
  }
}
