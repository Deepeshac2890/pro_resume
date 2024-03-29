import 'dart:html' as html;

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../Constants/StringConstants.dart';

class ResumeViewer extends StatefulWidget {
  const ResumeViewer({Key? key}) : super(key: key);

  @override
  _ResumeViewerState createState() => _ResumeViewerState();
}

enum Roles { backendDeveloper, mobileDeveloper, none }

class _ResumeViewerState extends State<ResumeViewer> {
  bool isLoading = true;
  late Widget resume;
  String downloadURL = "";

  @override
  void initState() {
    super.initState();
  }

  void loadDocument(Roles role) async {
    if (role == Roles.backendDeveloper) {
      resume = SfPdfViewer.network(backendDeveloperResumeLink);
      downloadURL = backendDeveloperResumeLink;
    } else {
      resume = SfPdfViewer.network(mobileDeveloperResumeLink);
      downloadURL = mobileDeveloperResumeLink;
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(
              onPressed: () {
                loadDocument(Roles.backendDeveloper);
              },
              child: const Text(
                backendDeveloperRole,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            TextButton(
              onPressed: () {
                loadDocument(Roles.mobileDeveloper);
              },
              child: const Text(
                mobileDeveloperRole,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        Expanded(
          child: Card(
            child: isLoading
                ? const Center(
                    child: Text(
                      roleNotSelected,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic),
                    ),
                  )
                : Scaffold(
                    body: resume,
                    floatingActionButton: FloatingActionButton(
                        onPressed: () {
                          html.window.open(downloadURL, userName);
                        },
                        child: const Icon(Icons.download_for_offline_rounded)),
                  ),
          ),
        ),
      ],
    );
  }
}
