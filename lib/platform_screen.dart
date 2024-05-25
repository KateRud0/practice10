import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'platform_cubit.dart';

class PlatformScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Platform Demo'),
      ),
      body: Container(
        color: Colors.green[200],
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Running on:', style: Theme.of(context).textTheme.headline6),
              SizedBox(height: 20),
              BlocBuilder<PlatformCubit, String>(
                builder: (context, platform) {
                  return Text(
                    platform,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  );
                },
              ),
              SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  context.read<PlatformCubit>().showPlatformInfo();
                  _showPlatformDialog(context);
                },
                child: Text('Show Platform Info'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showPlatformDialog(BuildContext context) {
    final platform = context.read<PlatformCubit>().state;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Platform Info', style: TextStyle(color: Colors.indigo)),
          content: Text('Running on: $platform', style: TextStyle(color: Colors.black87)),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }
}
