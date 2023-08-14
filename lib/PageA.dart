import 'package:flutter/material.dart';
import 'package:flutter_app/state.dart';
import 'package:provider/provider.dart';
import 'logic.dart';

class PageA extends StatefulWidget {
  const PageA({super.key});

  @override
  _PageAState createState() => _PageAState();
}

class _PageAState extends State<PageA> {
  final ScrollController _controller = ScrollController();

  List<Post> _postList = [];

  var postList = [];

  void getData() async {
    _postList =
        await fetchData(); //.then((value) => {print(value), _postList = value});
    Provider.of<TestState>(context, listen: false).setPostList(_postList);
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    var postList = Provider.of<TestState>(context, listen: true).postList;
    return Scaffold(
      appBar: AppBar(
        title: Text("PAGE A"),
      ),
      body: Container(
        margin: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              "${context.watch<TestState>().ilTesto}",
            ),

            // Provider.of<TestState>(context, listen: true).postList.isEmpty
            postList.isEmpty
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Expanded(
                    child: ListView.builder(
                      physics: const AlwaysScrollableScrollPhysics(),
                      controller: _controller,
                      shrinkWrap: true,
                      itemCount: _postList.length,
                      itemBuilder: (context, index) {
                        final post = _postList[index];
                        return ListTile(
                          title: Text("Title: " + post.title!),
                          subtitle: Text("Description: \n" + post.body!),
                          onTap: () => {
                            Provider.of<TestState>(context, listen: false)
                                .setNewState(post),
                            showDialog<String>(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Text("${post.id!} - ${post.title}"),
                                content: Text(post.body!),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: Text('Close'),
                                  )
                                ],
                              ),
                            ),
                          },
                        );
                      },
                    ),
                  ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Provider.of<TestState>(context, listen: false).setNewState("MAMT");
        },
        child: const Icon(Icons.accessibility_new),
      ),
    );
  }
}
