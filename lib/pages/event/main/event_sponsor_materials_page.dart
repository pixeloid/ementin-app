import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:eventapp/models/sponsor.dart';
import 'package:eventapp/utils/widgets/w_header.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'dart:io';
import 'package:permission_handler/permission_handler.dart';

class SponsorMaterialsPage extends StatelessWidget with HeaderDelegate {
  final Sponsor sponsor;

  const SponsorMaterialsPage({Key? key, required this.sponsor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        WHeader(
          title: sponsor.company!.name,
          isShowBackButton: true,
          delegate: this,
        ),
        Expanded(
            child: SponsorMaterialsViewer(
          sponsor: sponsor,
        ))
      ],
    );
  }

  @override
  void onBack(context) {
    AutoRouter.of(context).pop();
  }
}

class SponsorMaterialsViewer extends StatefulWidget {
  final Sponsor sponsor;

  const SponsorMaterialsViewer({required this.sponsor, Key? key})
      : super(key: key);

  @override
  State<SponsorMaterialsViewer> createState() => _SponsorMaterialsViewerState();
}

class _SponsorMaterialsViewerState extends State<SponsorMaterialsViewer> {
  String urlPDFPath = "";
  bool exists = true;
  int _totalPages = 0;
  int _currentPage = 0;
  bool pdfReady = false;
  late PDFViewController _pdfViewController;
  bool loaded = false;
  Future<File> getFileFromUrl(String url, {name}) async {
    var fileName = 'testonline';
    if (name != null) {
      fileName = name;
    }
    try {
      var data = await http.get(Uri.parse(url));
      var bytes = data.bodyBytes;
      var dir = await getApplicationDocumentsDirectory();
      File file = File("${dir.path}/$fileName.pdf");
      debugPrint(dir.path);
      File urlFile = await file.writeAsBytes(bytes);
      return urlFile;
    } catch (e) {
      throw Exception("Error opening url file");
    }
  }

  void requestPersmission() async {
    await Permission.storage.request();
  }

  @override
  void initState() {
    requestPersmission();
    getFileFromUrl(
            'https://home.ementin.hu${widget.sponsor.materialUrls!.first.toString()}')
        .then(
      (value) => {
        setState(() {
          urlPDFPath = value.path;
          loaded = true;
          exists = true;
        })
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (loaded) {
      return Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.chevron_left),
              iconSize: 50,
              color: Colors.black,
              onPressed: () {
                setState(() {
                  if (_currentPage > 0) {
                    _currentPage--;
                    _pdfViewController.setPage(_currentPage);
                  }
                });
              },
            ),
            Text(
              "${_currentPage + 1}/$_totalPages",
              style: const TextStyle(color: Colors.black, fontSize: 20),
            ),
            IconButton(
              icon: const Icon(Icons.chevron_right),
              iconSize: 50,
              color: Colors.black,
              onPressed: () {
                setState(() {
                  if (_currentPage < _totalPages - 1) {
                    _currentPage++;
                    _pdfViewController.setPage(_currentPage);
                  }
                });
              },
            ),
          ],
        ),
        Expanded(
          child: PDFView(
            filePath: urlPDFPath,
            autoSpacing: true,
            enableSwipe: true,
            pageSnap: true,
            swipeHorizontal: true,
            nightMode: false,
            onError: (e) {
              //Show some error message or UI
            },
            onRender: (pages) {
              setState(() {
                _totalPages = pages!;
                pdfReady = true;
              });
            },
            onViewCreated: (PDFViewController vc) {
              setState(() {
                _pdfViewController = vc;
              });
            },
            onPageChanged: (page, total) {
              setState(() {
                _currentPage = page!;
              });
            },
            onPageError: (page, e) {},
          ),
        )
      ]);
    } else {
      if (exists) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else {
        //Replace Error UI
        return Scaffold(
          appBar: AppBar(
            title: const Text("Hiba"),
          ),
          body: const Text(
            "A file nem létezi",
            style: TextStyle(fontSize: 20),
          ),
        );
      }
    }
  }
}
