import 'package:file_picker/file_picker.dart';
import 'package:file_saver/file_saver.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:photo_view/photo_view.dart';
import 'package:rent_calculator/helpers/sizes_helpers.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class EnlargedView extends StatefulWidget {
  final List<PlatformFile> files;
  final int index;
  const EnlargedView({super.key, required this.files, required this.index});

  @override
  State<EnlargedView> createState() => _EnlargedViewState();
}

class _EnlargedViewState extends State<EnlargedView> {
  int index = 0;
  String title = '';

  Widget? currentSaveIcon;
  Widget saveIcon = Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: const [
      Icon(
        BoxIcons.bx_save,
        size: 25.0,
      ),
      Text('Save to disk'),
    ],
  );

  Widget savedIcon = Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: const [
      Icon(
        BoxIcons.bx_check,
        size: 25.0,
      ),
      Text('Saved'),
    ],
  );

  @override
  void initState() {
    super.initState();
    index = widget.index;
    title = widget.files[index].name;
    currentSaveIcon = saveIcon;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SizeHelper.displayWidth! * 0.8,
      height: SizeHelper.displayHeight! * 0.8,
      child: AlertDialog(
        titlePadding: const EdgeInsets.all(4),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(),
            Text(title),
            RawMaterialButton(
              fillColor: Theme.of(context).dividerColor,
              constraints: const BoxConstraints(minWidth: 30, minHeight: 30),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Icon(BoxIcons.bx_x),
            ),
          ],
        ),
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          SizedBox(
            width: 200.0,
            height: 50.0,
            child: ElevatedButton(
              onPressed: () async {
                setState(() {
                  currentSaveIcon = const CircularProgressIndicator();
                });
                await FileSaver.instance
                    .saveFile(widget.files[index].name,
                        widget.files[index].bytes!, '')
                    .whenComplete(() => setState(() {
                          currentSaveIcon = savedIcon;
                        }));
              },
              child: currentSaveIcon,
            ),
          ),
        ],
        content: Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: SizeHelper.displayHeight! * 0.5,
                  width: 30,
                  child: RawMaterialButton(
                      fillColor: Theme.of(context).dividerColor,
                      onPressed: () {
                        if (index != 0) {
                          index -= 1;
                        }
                        title = widget.files[index].name;
                        currentSaveIcon = saveIcon;
                        setState(() {});
                      },
                      child: const Icon(
                        BoxIcons.bx_chevron_left,
                      )),
                ),
                widget.files[index].extension == 'pdf'
                    ? SizedBox(
                        width: SizeHelper.displayWidth! * 0.7,
                        height: SizeHelper.displayHeight! * 0.7,
                        child: SfPdfViewer.memory(
                          widget.files[index].bytes!,
                          initialZoomLevel: 1,
                          enableDoubleTapZooming: true,
                        ),
                      )
                    : SizedBox(
                        width: SizeHelper.displayWidth! * 0.7,
                        height: SizeHelper.displayHeight! * 0.7,
                        child: PhotoView(
                          backgroundDecoration: const BoxDecoration(),
                          initialScale: PhotoViewComputedScale.contained * 0.8,
                          imageProvider: MemoryImage(
                            widget.files[index].bytes!,
                          ),
                        ),
                      ),
                SizedBox(
                  height: SizeHelper.displayHeight! * 0.5,
                  width: 30,
                  child: RawMaterialButton(
                      fillColor: Theme.of(context).dividerColor,
                      onPressed: () {
                        if (widget.files.length - 1 != index) {
                          index += 1;
                        }
                        title = widget.files[index].name;
                        currentSaveIcon = saveIcon;
                        setState(() {});
                      },
                      child: const Icon(BoxIcons.bx_chevron_right)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
