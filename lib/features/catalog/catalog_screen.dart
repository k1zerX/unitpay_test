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
      centerTitle: false,
      title: Text('Меню',
        style: UPTextStyles.headline1,
      ),
      backgroundColor: UPColors.transparent,
      actions: [
        Center(
          child: UPButton(
            onPressed: () {
              context.read<CatalogBloc>().add(CatalogEvent.addItem());
            },
            child: Icon(Icons.add,
              size: 16.0,
            ),
          ),
        ),
        SizedBox(width: 16.0),
      ],
    );
  }

  Widget _buildBody(BuildContext context, {
    required CatalogState state,
    int viewportArea = 8,
    Axis direction = Axis.vertical,
  }) {
    return Builder(
      builder: (context) {
        final size = MediaQuery.of(context).size;
        final crossAxisRatio = size.crossRatio(direction);
        final squareArea = viewportArea * crossAxisRatio;
        final squareSide = sqrt(squareArea);
        return GridView.count(
          scrollDirection: direction,
          crossAxisCount: squareSide.round(),
          children: [
            for (final item in state.items)
              _buildItem(context,
                item: item,
              ),
          ],
        );
      },
    );
  }

  Widget _buildItem(BuildContext context, { required CatalogItem item }) {
    return Stack(
      children: [
        // image
        Positioned(
          top: 8.0,
          left: 32.0,
          right: 32.0,
          bottom: 56.0,
          child: Image.network(item.imgUrl,
            fit: BoxFit.fitHeight,
          ),
        ),

        // title
        Positioned(
          left: 16.0,
          right: 16.0,
          bottom: 8.0,
          child: Text(item.title,
            style: UPTextStyles.headline2,
            textAlign: TextAlign.left,
          ),
        ),

        // delete button
        Positioned(
          top: 8.0,
          right: 8.0,
          child: UPButton(
            onPressed: () {
              context.read<CatalogBloc>().add(CatalogEvent.deleteItem(item: item));
            },
            child: Icon(Icons.delete,
              size: 16.0,
            ),
          ),
        ),
      ],
    );
  }
}