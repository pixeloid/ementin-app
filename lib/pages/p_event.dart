import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:eventapp/providers/event_provider.dart';
import 'package:eventapp/utils/extension/app_extension.dart';
import 'package:eventapp/app_define/app_enum.dart';
import 'package:eventapp/pages/base/p_material.dart';
import 'package:eventapp/utils/widgets/w_header.dart';
import 'package:eventapp/generated/l10n.dart';

import 'package:provider/provider.dart';

class PEvent extends StatefulWidget {
  const PEvent({Key? key}) : super(key: key);

  @override
  _PEventState createState() => _PEventState();
}

class _PEventState extends State<PEvent> with HeaderDelegate {
  ///TicketsProvider
  late EventProvider _provider;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) async {
      _provider = Provider.of<EventProvider>(context, listen: false);
      await _provider.getEvents();
    });
  }

  @override
  void onBack() {
    _provider.events = null;
    // context.navigator()?.pop();
  }

  @override
  Widget build(BuildContext context) {
    return PMaterial(child: Consumer<EventProvider>(
      builder: (BuildContext context, EventProvider provider, _) {
        final eventList = provider.events;
        return Container(
          color: Colors.white,
          child: Column(
            children: <Widget>[
              WHeader(
                  title: Tutorial.pagination.getName(),
                  isShowBackButton: true,
                  delegate: this),
              if (eventList == null)
                Container(
                    padding: EdgeInsets.only(top: 150.H),
                    child: CupertinoActivityIndicator(
                      radius: 16.SP,
                    ))
              else if (eventList.isEmpty)
                Container(
                    padding: EdgeInsets.only(top: 200.H),
                    child: Text(S.of(context).data_is_empty))
              else
                Expanded(
                  child: NotificationListener<ScrollNotification>(
                      child: SafeArea(
                        top: false,
                        child: SingleChildScrollView(
                          physics: const AlwaysScrollableScrollPhysics(
                              parent: BouncingScrollPhysics()),
                          child: Column(
                            children: <Widget>[
                              ListView.builder(
                                  physics: const ClampingScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: eventList.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Container(
                                        padding: EdgeInsets.all(50.SP),
                                        child: Row(
                                          children: <Widget>[
                                            Text("> ${eventList[index]?.name}"),
                                            const Spacer(),
                                            // Text("id${eventList[index]?.raceId}"),
                                          ],
                                        ));
                                  }),
                              Container(
                                  margin: EdgeInsets.only(bottom: 20.H),
                                  child: provider.isNoMoreData
                                      ? Text(S.of(context).no_more_data)
                                      : provider.isLoading
                                          ? CupertinoActivityIndicator(
                                              radius: 8.SP)
                                          : null)
                            ],
                          ),
                        ),
                      ),
                      onNotification: (ScrollNotification scroll) {
                        if (scroll.metrics.pixels >
                                scroll.metrics.maxScrollExtent &&
                            !provider.isLoading &&
                            !provider.isNoMoreData) {
                          provider.isLoading = true;
                          Future.delayed(const Duration(seconds: 1), () async {
                            await provider.getEvents();
                          });
                        }
                        return true;
                      }),
                ),
            ],
          ),
        );
      },
    ));
  }

  @override
  void deactivate() {
    _provider.resetState();
    super.deactivate();
  }
}
