import 'package:flutter/material.dart';
import 'package:learning_bloc/bloc/product_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  void initState() {
    context.read<ProductBloc>().add(ProductsLoadedEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Screen"),
      ),
      // body: BlocBuilder<ProductBloc, ProductState>(
      //   builder: (context, state) {
      //     if (state is ProductLoadingState) {
      //       return const Center(
      //         child: CircularProgressIndicator.adaptive(),
      //       );
      //     } else if (state is ProductLoadedState) {
      //       return ListView.builder(
      //           itemCount: state.productsModel.length,
      //           itemBuilder: (context, index) {
      //             return ListTile(
      //               leading:
      //                   Text(state.productsModel[index].category.toString()),
      //             );
      //           });
      //     } else if (state is ProductErrorState) {
      //       return Center(
      //         child: Text(state.errorMessage),
      //       );
      //     } else {
      //       return const SizedBox();
      //     }
      //   },
      // ),
      // body: BlocListener<ProductBloc, ProductState>(
      //   //listenWhen: (previous, current) => ,
      //   listener: (context, state) {
      //     if (state is ProductLoadedState) {
      //       VxToast.show(context,
      //           msg: "Data Loaded", position: VxToastPosition.center);
      //       ScaffoldMessenger.of(context)
      //           .showSnackBar(const SnackBar(content: Text("Product Loaded")));
      //     } else if (state is ProductErrorState) {
      //       VxToast.show(context,
      //           msg: "Product Not Loaded", position: VxToastPosition.center);
      //       ScaffoldMessenger.of(context)
      //           .showSnackBar(const SnackBar(content: Text("Data Not Loaded")));
      //     }
      //   },
      //   child: const Center(
      //       child: Text(
      //     "Bloc Listner",
      //     style: TextStyle(fontSize: 22),
      //   )),
      // ),
      body: BlocConsumer<ProductBloc, ProductState>(
        listener: (context, state) {
          if (state is ProductLoadedState) {
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text("Product Loaded")));
          } else if (state is ProductErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Product Not Loaded")));
          }
        },
        builder: (context, state) {
          if (state is ProductLoadingState) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          } else if (state is ProductLoadedState) {
            return ListView.builder(
                itemCount: state.productsModel.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading:
                        Text(state.productsModel[index].category.toString()),
                  );
                });
          } else if (state is ProductErrorState) {
            return Center(
              child: Text(state.errorMessage),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
