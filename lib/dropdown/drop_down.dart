import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../model/current_item.dart';

List<CurrentItem> list = <CurrentItem>[
  CurrentItem(
      color: 0xFF41B631,
      title: 'Driving',
      subtitle: 'Working and driving right now'),
  CurrentItem(
      color: 0xFF1872F6,
      title: 'On',
      subtitle: 'At work but not on the road at the moment'),
  CurrentItem(
      color: 0xFF75869C, title: 'Off', subtitle: 'I am not working right now'),
  CurrentItem(
      color: 0xFF1C293E,
      title: 'Sleep',
      subtitle: 'Get behind the wheel well-rested')
];

class CustomDropDownButton extends StatefulWidget {
  const CustomDropDownButton({super.key});

  @override
  State<CustomDropDownButton> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDownButton> {
  OverlayEntry? overlayEntry;
  final layerLink = LayerLink();

  CurrentItem dropdownValue = list.first;
  bool state = false;
  String bottomIcon = "assets/images/bottom_green.svg";

  void createHighlightOverlay() {
    // Remove the existing OverlayEntry.
    removeHighlightOverlay();

    assert(overlayEntry == null);

    final renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;

    overlayEntry = OverlayEntry(
        // Create a new OverlayEntry.
        builder: (BuildContext context) => (Positioned(
              width: size.width,
              child: CompositedTransformFollower(
                link: layerLink,
                offset: Offset(0, -310),
                child: Column(
                  children: [
                    if (state)
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 8, left: 16, right: 16),
                        child: TextButton(
                            onPressed: () {
                              setState(() {
                                CurrentItem currentValue = dropdownValue;
                                dropdownValue = list[3];
                                list[3] = currentValue;
                                state = false;
                                removeHighlightOverlay();
                              });
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Color(list[3].color)),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        list[3].title,
                                        style: const TextStyle(
                                            fontSize: 36,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                      width: 150,
                                      child: Text(
                                        list[3].subtitle,
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600),
                                      ))
                                ],
                              ),
                            )),
                      ),
                    if (state)
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 8, left: 16, right: 16),
                        child: TextButton(
                            onPressed: () {
                              setState(() {
                                CurrentItem currentValue = dropdownValue;
                                dropdownValue = list[2];
                                list[2] = currentValue;
                                state = false;
                                removeHighlightOverlay();
                              });
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Color(list[2].color)),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        list[2].title,
                                        style: const TextStyle(
                                            fontSize: 36,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                      width: 150,
                                      child: Text(
                                        list[2].subtitle,
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600),
                                      ))
                                ],
                              ),
                            )),
                      ),
                    if (state)
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 8, left: 16, right: 16),
                        child: TextButton(
                            onPressed: () {
                              setState(() {
                                CurrentItem currentValue = dropdownValue;
                                dropdownValue = list[1];
                                list[1] = currentValue;
                                state = false;
                                removeHighlightOverlay();
                              });
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Color(list[1].color)),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        list[1].title,
                                        style: const TextStyle(
                                            fontSize: 36,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                      width: 150,
                                      child: Text(
                                        list[1].subtitle,
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600),
                                      ))
                                ],
                              ),
                            )),
                      ),
                  ],
                ),
              ),
            )));

    // Add the OverlayEntry to the Overlay.
    Overlay.of(context, debugRequiredFor: widget).insert(overlayEntry!);
  }

  void removeHighlightOverlay() {
    overlayEntry?.remove();
    overlayEntry = null;
  }

  @override
  void dispose() {
    removeHighlightOverlay();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (state) {
      bottomIcon = "assets/images/top_button.svg";
    } else {
      bottomIcon = "assets/images/bottom_green.svg";
    }

    return CompositedTransformTarget(
      link: layerLink,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
            child: TextButton(
                onPressed: () {
                  setState(() {});
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Color(dropdownValue.color)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Current Status',
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          Text(
                            dropdownValue.title,
                            style: const TextStyle(
                                fontSize: 36,
                                color: Colors.white,
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                      TextButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40),
                            ),
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            if (!state) {
                              state = true;
                              createHighlightOverlay();
                            } else {
                              state = false;
                              removeHighlightOverlay();
                            }
                          });
                        },
                        child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 20),
                            child: SvgPicture.asset(
                              bottomIcon,
                              color: Color(dropdownValue.color),
                            )),
                      )
                    ],
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
