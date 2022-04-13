// ignore_for_file: prefer_const_constructors

import 'package:eventapp/widgets/event_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:eventapp/providers/event_provider.dart';
import 'package:eventapp/utils/extension/app_extension.dart';
import 'package:eventapp/pages/base/p_material.dart';
import 'package:eventapp/utils/widgets/w_header.dart';
import 'package:eventapp/generated/l10n.dart';

import 'package:provider/provider.dart';

class PEventList extends StatefulWidget {
  const PEventList({Key? key}) : super(key: key);

  @override
  _PEventListState createState() => _PEventListState();
}

class _PEventListState extends State<PEventList> with HeaderDelegate {
  ///TicketsProvider
  late EventProvider _provider;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) async {
      _provider = context.read<EventProvider>();
      await _provider.getEvents();
    });
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
                  title: 'Rendezvényeink',
                  isShowBackButton: false,
                  delegate: this),
              if (eventList == null)
                Container(
                    child: CupertinoActivityIndicator(
                  radius: 16.SP,
                ))
              else if (eventList.isEmpty)
                Container(child: Text(S.of(context).data_is_empty))
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
                                        child: Row(
                                      children: <EventCard>[
                                        EventCard(event: eventList[index]),
                                      ],
                                    ));
                                  }),
                              Container(
                                  child: provider.isNoMoreData
                                      ? Text(S.of(context).no_more_data)
                                      : provider.isLoading
                                          ? CupertinoActivityIndicator(
                                              radius: 8)
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

  @override
  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
