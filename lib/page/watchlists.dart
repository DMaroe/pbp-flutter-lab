
import 'package:flutter/material.dart';
import 'package:labs/models/budget_models.dart';
import 'package:labs/models/watchList_models.dart';
import 'package:labs/page/watchlists_detail.dart';
import 'package:labs/src/watchlist_sources.dart';
import 'package:labs/widget/counter7.dart';
import 'package:labs/widget/watchlists_item.dart';


class WatchList extends StatefulWidget {
  final List<BudgetModel> data;
  const WatchList({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  State<WatchList> createState() => _WatchListState();
}

class _WatchListState extends State<WatchList> {
  late Future<List<Fields>> _futureWatchList;
  late Source _remoteDataSource;

  @override
  void initState() {
    _remoteDataSource = Source();
    _futureWatchList = _remoteDataSource.fecthWatchList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('My Watch List'),
          elevation: 0,
        ),
        drawer: TheDrawer(data: widget.data),
        body: Center(
          child: FutureBuilder(
            future: _futureWatchList,
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return !snapshot.hasData
                    ? Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          'You doesnt have any watch list yet :(',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.deepPurple.shade200,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    : ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
                          child: GestureDetector(
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => WatchItemDetail(
                                  data: widget.data,
                                  watchItem: snapshot.data[index],
                                ),
                              ),
                            ),
                            child: WatchItemCard(
                              watchItem: snapshot.data[index],
                            ),
                          ),
                        ),
                        padding: const EdgeInsets.only(bottom: 12),
                      );
              }
            },
          ),
        ),
      );
}
