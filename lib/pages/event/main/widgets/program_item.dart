import 'package:easy_pdf_viewer/easy_pdf_viewer.dart';
import 'package:ementin_flutter/models/schedule_model.dart';
import 'package:ementin_flutter/providers/event_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'program_item_hero.dart';

class ScheduleEventWidget extends StatelessWidget {
  final String? prefix;
  final bool showDayName;
  final ScheduleEvent scheduleEvent;

  const ScheduleEventWidget({
    super.key,
    required this.scheduleEvent,
    this.prefix,
    this.showDayName = false,
  });

  @override
  Widget build(BuildContext context) {
    var mediaUrl = scheduleEvent.media != null
        ? 'https://home.ementin.hu${scheduleEvent.media}'
        : null;

    final checkedIn = Provider.of<EventProvider>(context, listen: true)
        .selectedEvent!
        .checkedIn;

    return Column(
      children: [
        ProgramItemHero(
          scheduleEvent: scheduleEvent,
          showDayName: showDayName,
          showBody: false,
          prefix: prefix,
          showLoveButton: true,
          onTap: mediaUrl != null
              ? () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => PDFViewerPage(
                      pdfUrl: mediaUrl,
                      title: scheduleEvent.title,
                    ),
                  ));
                }
              : scheduleEvent.body != null
                  ? () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Scaffold(
                                body: ProgramItemFullHeroPage(
                                  presentation: scheduleEvent,
                                  showBody: true,
                                  showLoveButton: checkedIn,
                                  onTap: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              )));
                    }
                  : () {},
        ),
      ],
    );
  }
}

class PDFViewerPage extends StatefulWidget {
  final String pdfUrl;
  final String title;

  const PDFViewerPage({super.key, required this.pdfUrl, required this.title});

  @override
  State<PDFViewerPage> createState() => _PDFViewerPageState();
}

class _PDFViewerPageState extends State<PDFViewerPage> {
  PDFDocument? _document;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadPDF();
  }

  Future<void> _loadPDF() async {
    try {
      PDFDocument document = await PDFDocument.fromURL(widget.pdfUrl);
      setState(() {
        _document = document;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      debugPrint("Error loading PDF: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator()) // Preloader
          : _document != null
              ? PDFViewer(
                  document: _document!,
                )
              : const Center(child: Text("Failed to load PDF")),
    );
  }
}
