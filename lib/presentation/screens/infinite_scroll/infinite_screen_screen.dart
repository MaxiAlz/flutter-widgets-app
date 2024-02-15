import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InfiniteScrollScreen extends StatefulWidget {
  static String name = 'infinite_scroll_screen';
  const InfiniteScrollScreen({super.key});

  @override
  State<InfiniteScrollScreen> createState() => _InfiniteScrollScreenState();
}

class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {
  List<int> imagesIds = [1, 2, 3, 4, 5];
  bool isLoading = false;
  bool isMounted = true;

  void addFileImages() {
    final int lastId = imagesIds.last;
    imagesIds.addAll([1, 2, 3, 4, 5].map((e) => lastId + e));
    // setState(() {});
  }

  final ScrollController scrollControler = ScrollController();

  @override
  void initState() {
    super.initState();

    scrollControler.addListener(() {
      if ((scrollControler.position.pixels + 500) >=
          scrollControler.position.maxScrollExtent) {
        //Load next page
        loadNextPage();
      }
      // scrollControler.position.pixels
      // scrollControler.position.maxScrollExtent
    });
  }

  Future<void> onRefresh() async {
    isLoading = true;
    setState(() {});
    await Future.delayed(const Duration(milliseconds: 300));
    if (!isMounted) return;

    isLoading = false;
    setState(() {});

    final lastId = imagesIds.last;

    imagesIds.clear();
    imagesIds.add(lastId + 1);
    addFileImages();

    setState(() {});
  }

  Future loadNextPage() async {
    if (isLoading) return;
    isLoading = true;
    setState(() {});
    await Future.delayed(const Duration(milliseconds: 300));

    addFileImages();
    isLoading = false;

    //revisar si esta montado el componente
    if (!isMounted) return setState(() {});
  }

  @override
  void dispose() {
    scrollControler.dispose();
    isMounted = false;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: Text('Infinite scroll'),
        // ),
        body: MediaQuery.removePadding(
          context: context,
          // removeBottom: true,
          removeTop: false,
          child: RefreshIndicator(
            edgeOffset: 50,
            strokeWidth: 2,
            onRefresh: onRefresh,
            child: ListView.builder(
              controller: scrollControler,
              itemCount: imagesIds.length,
              itemBuilder: (context, index) {
                return FadeInImage(
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 300,
                    placeholder:
                        const AssetImage('assets/images/jar-loading.gif'),
                    image: NetworkImage(
                        'https://picsum.photos/id/${imagesIds[index]}/500/300'));
              },
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () => context.pop(),
            child: isLoading
                ? const CircularProgressIndicator()
                : const Icon(Icons.arrow_back_ios_new_outlined)));
  }
}
