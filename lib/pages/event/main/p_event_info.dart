import 'package:auto_route/auto_route.dart';
import 'package:eventapp/models/event_model.dart';
import 'package:flutter/material.dart';
import 'package:eventapp/providers/event_provider.dart';
import 'package:eventapp/pages/base/p_material.dart';
import 'package:eventapp/utils/widgets/w_header.dart';

import 'package:provider/provider.dart';

class PEventInfo extends StatefulWidget {
  const PEventInfo({Key? key, this.event}) : super(key: key);

  final EventModel? event;

  @override
  _PEventInfoState createState() => _PEventInfoState();
}

class _PEventInfoState extends State<PEventInfo> with HeaderDelegate {
  @override
  void onBack() {
    AutoRouter.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return PMaterial(child: Consumer<EventProvider>(
      builder: (BuildContext context, EventProvider provider, _) {
        return Container(
          color: Colors.white,
          child: Column(
            children: <Widget>[
              WHeader(
                title: widget.event!.name,
                isShowBackButton: true,
                delegate: this,
              ),
              Container(
                padding: const EdgeInsets.only(top: 200),
                child: Text(widget.event!.name),
              )
            ],
          ),
        );
      },
    ));
  }

  @override
  void deactivate() {
    // _provider.resetState();
    super.deactivate();
  }
}
