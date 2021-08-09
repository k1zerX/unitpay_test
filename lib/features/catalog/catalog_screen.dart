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
          backgroundColor: UPColors.black,
          appBar: _buildAppBar(context),
          body: _buildBody(context,
            state: state,
          ),
        );
      }
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      title: Text('Меню',
        style: UPTextStyles.headline1,
      ),
      actions: [
        UPButton(
          onPressed: () {
            context.read<CatalogBloc>().add(CatalogEvent.addItem());
          },
          child: Icon(Icons.add),
        ),
      ],
    );
  }

  Widget _buildBody(BuildContext context, { required CatalogState state }) {
    return GridView.count(
      crossAxisCount: 2,
      children: [
        for (final item in state.items)
          _buildItem(context,
            item: item,
          ),
      ],
    );
  }

  Widget _buildItem(BuildContext context, { required CatalogItem item }) {
    return Stack(
      children: [
        // delete button
        Positioned(
          top: 8.0,
          right: 8.0,
          child: UPButton(
            onPressed: () {},
            child: Icon(Icons.delete),
          ),
        ),

        // image
        Positioned(
          top: 8.0,
          left: 32.0,
          right: 32.0,
          bottom: 56.0,
          child: Image.network(item.imgUrl),
        ),

        // title
        Positioned(
          left: 16.0,
          right: 16.0,
          bottom: 8.0,
          child: Text('',
            style: UPTextStyles.headline2,
            textAlign: TextAlign.left,
          ),
        ),
      ],
    );
  }
}