import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:vv_oa/constant/global_config.dart';


const double _kPickerSheetHeight = 216.0;
const double _kPickerItemHeight = 32.0;

const List<String> coolColorNames = <String>[
  'Sarcoline', 'Coquelicot', 'Smaragdine', 'Mikado', 'Glaucous', 'Wenge',
  'Fulvous', 'Xanadu', 'Falu', 'Eburnean', 'Amaranth', 'Australien',
  'Banan', 'Falu', 'Gingerline', 'Incarnadine', 'Labrador', 'Nattier',
  'Pervenche', 'Sinoper', 'Verditer', 'Watchet', 'Zaffre',
];

class AttendanceTravel extends StatefulWidget {
  static const String routeName = '/cupertino/picker';

  @override
  _AttendanceTravelState createState() => _AttendanceTravelState();
}

class _AttendanceTravelState extends State<AttendanceTravel> {
  int _selectedColorIndex = 0;

  Duration timer = const Duration();

  // Value that is shown in the date picker in date mode.
  DateTime date = DateTime.now();

  // Value that is shown in the date picker in time mode.
  DateTime time = DateTime.now();

  // Value that is shown in the date picker in dateAndTime mode.
  DateTime dateTime = DateTime.now();

  Widget _buildMenu(List<Widget> children) {
    return Container(
      decoration: BoxDecoration(
        color:CupertinoColors.inactiveGray,
        border: const Border(
          top: BorderSide(color: Color(0xFFBCBBC1), width: 0.0),
          bottom: BorderSide(color: Color(0xFFBCBBC1), width: 0.0),
        ),
      ),
      height: 44.0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SafeArea(
          top: false,
          bottom: false,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: children,
          ),
        ),
      ),
    );
  }

  Widget _buildBottomPicker(Widget picker) {
    return Container(
      height: _kPickerSheetHeight,
      padding: const EdgeInsets.only(top: 6.0),
      color: CupertinoColors.white,
      child: DefaultTextStyle(
        style: const TextStyle(
          color: CupertinoColors.black,
          fontSize: 22.0,
        ),
        child: GestureDetector(
          // Blocks taps from propagating to the modal sheet and popping.
          onTap: () {},
          child: SafeArea(
            top: false,
            child: picker,
          ),
        ),
      ),
    );
  }

  Widget _buildDateAndTimePicker(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showCupertinoModalPopup<void>(
          context: context,
          builder: (BuildContext context) {
            return _buildBottomPicker(
              CupertinoDatePicker(
                mode: CupertinoDatePickerMode.dateAndTime,
                initialDateTime: dateTime,
                onDateTimeChanged: (DateTime newDateTime) {
                  if (mounted) {
                    setState(() => dateTime = newDateTime);
                  }
                },
              ),
            );
          },
        );
      },
      child: _buildMenu(
        <Widget>[
          const Text('Date and Time'),
          Text(
            DateFormat.yMMMd().add_jm().format(dateTime),
            style: const TextStyle(color: CupertinoColors.inactiveGray),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height:MediaQuery.of(context).size.height,
        child:CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: const Text('出差'),
          previousPageTitle: '返回'
          ),
          child: DefaultTextStyle(
          style: TextStyle(),
          child: DecoratedBox(
          decoration: BoxDecoration(
          color: CupertinoColors.inactiveGray
          ),
          child: ListView(
            children: <Widget>[
//              const Padding(padding: EdgeInsets.only(top: 32.0)),
              _buildDateAndTimePicker(context),
              ],
            ),
          ),
        ),
      )
    );

  }
}
