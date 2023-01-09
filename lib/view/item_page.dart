import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/department.dart';
import 'package:todo_app/models/items.dart';
import 'package:todo_app/view_model/list_table_view.dart';
import 'package:todo_app/widgets/dialog_items.dart';

class ItemPage extends StatelessWidget {
  const ItemPage({
    super.key,
  });
  static const routeItems = '/itemPage';

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Department;
    // final argsD = ModalRoute.of(context)!.settings.arguments as Items;
    return Consumer<ListTableView>(
      builder: (context, listTableView, child) => Scaffold(
        appBar: AppBar(
          title: Text(
            '${args.titleDepartment}',
          ),
          centerTitle: true,
        ),
        body: FutureBuilder<List<Items>>(
          future: listTableView.getItems(args.idDepartment!),
          builder: (context, AsyncSnapshot<List<Items>> snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            }
            return snapshot.data!.isEmpty
                ? const Center(
                    child: Text('Nenhum item adicionado'),
                  )
                : ListView(
                    children: snapshot.data!
                        .map(
                          (e) => Center(
                            child: ListTile(
                              title: Text(e.titleItems!),
                              subtitle: Text(e.descriptionItems!),
                              trailing: Text(e.priceItems.toString()),
                            ),
                          ),
                        )
                        .toList(),
                  );
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => DialogItems(),
            );
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
