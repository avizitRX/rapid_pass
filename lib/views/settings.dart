import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rapid_pass/components/add_card_number.dart';
import 'package:rapid_pass/providers/get_information_provider.dart';
import 'package:rapid_pass/providers/theme_provider.dart';
import 'package:rapid_pass/services/clear_all_information.dart';

class Settings extends StatefulWidget {
  Settings(GetInformationProvider this.infoData, {super.key});

  GetInformationProvider infoData;

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  int flag = 0;
  bool locked = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('সেটিংস'),
        ),
        body: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              widget.infoData.info?.cardNumber == ""
                  ? ElevatedButton(
                      onPressed: () => addCardNumber(context),
                      child: const Text('কার্ড নম্বর যোগ'),
                    )
                  : ElevatedButton(
                      onPressed: () => addCardNumber(context),
                      child: const Text('কার্ড নম্বর পরিবর্তন'),
                    ),
              const SizedBox(
                height: 10,
              ),
              // ElevatedButton(
              //   onPressed: () {
              //     context.read<ThemeProvider>().changeTheme();
              //   },
              //   child: const Text('থিম পরিবর্তন'),
              // ),
              // const SizedBox(
              //   height: 10,
              // ),
              // ElevatedButton(
              //   onPressed: () async {
              //     await clearAllInformation();
              //   },
              //   child: const Text('Clear All Information'),
              // ),

              // About Section
              TextButton(
                onPressed: () {
                  if (flag > 8) {
                    locked = false;
                  }
                  flag++;
                  print(flag);
                },
                onLongPress: () {
                  if (!locked) {
                    showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: const Text('Hello There'),
                        content: const Text('Yoooooooo!'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'OK'),
                            child: const Text('OK'),
                          ),
                        ],
                      ),
                    );
                  }
                },
                style: ButtonStyle(
                  overlayColor: WidgetStateProperty.all(Colors.transparent),
                ),
                child: Text(
                  'Developed with ❤️',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
