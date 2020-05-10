import 'package:flutter/material.dart';
import 'package:proj_planos/app/modules/admin/components/admin_widget.dart';
import 'package:proj_planos/app/shared/styles/cores.dart';

class AdminPage extends StatefulWidget {
  final String title;
  const AdminPage({Key key, this.title = "Administrador"}) : super(key: key);

  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(widget.title),
         backgroundColor: Cores.segunda,
          elevation: 0,
            bottom: PreferredSize(
            child: Container(
              padding: EdgeInsets.all(5),
            ),
            preferredSize: Size.fromHeight(0),
          ),
      ),
      body: AdminWidget()
    );
  }
}
