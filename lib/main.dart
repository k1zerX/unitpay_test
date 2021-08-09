import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unitpay_test/features/catalog/this.dart';

void main() {
  runApp(UPApp());
}

class UPApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CatalogBloc>(
      create: (context) => CatalogBloc(),
      child: MaterialApp(
        home: CatalogScreen(),
      ),
    );
  }
}