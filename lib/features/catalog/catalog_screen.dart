part of 'this.dart';

class CatalogScreen extends StatelessWidget {
  CatalogScreen({
    Key? key,
  }) : super (key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CatalogBloc, CatalogState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Меню'),
          ),
        );
      }
    );
  }
}