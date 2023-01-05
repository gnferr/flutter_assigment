import 'package:assigment_5/cubits/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:assigment_5/model/category_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ThisCategory extends StatelessWidget {
  const ThisCategory({super.key});

  @override
  Widget build(BuildContext context) {
    List<Category> categories = Category.categories;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Category'),
        actions: [
          IconButton(
              onPressed: () {
                context.read<LoginCubit>().logout();
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: ListView.builder(
          itemCount: categories.length,
          itemBuilder: ((context, index) {
            Category category = categories[index];
            return ListTile(
              title: Text(category.name),
              onTap: (() {
                return context.go(
                  context.namedLocation('product_list',
                      params: <String, String>{
                        'category': category.name
                      },
                      queryParams: <String, String>{
                        'sort': 'desc',
                        'filter': '0'
                      }),
                );
              }),
            );
          })),
    );
  }
}
