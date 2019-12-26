part of 'test.dart';

Widget buildWidget(ViewModel viewModel) => GestureDetector(
      child: Text('${viewModel.refreshing}'),
      onTap: viewModel.onTap,
    );
