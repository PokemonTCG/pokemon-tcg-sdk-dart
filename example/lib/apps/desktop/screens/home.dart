import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:pokemon_tcg/pokemon_tcg.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final api = PokemonTcgApi(apiKey: '168a0f54-2d37-4070-b145-77ac370b0b42');
  late final paginatedCardsAll = PaginatedPokemonCards([], api);
  late final paginatedCardsSwsh5 = PaginatedPokemonCards([], api);

  late Future<List<PokemonCard>> latestSet = api.getCardsForSet('swsh5');

  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MoveWindow(
      child: MacosScaffold(
        sidebar: Sidebar(
          builder: (context, scrollController) {
            return SidebarItems(
              currentIndex: pageIndex,
              onChanged: (value) {
                setState(() => pageIndex = value);
              },
              items: [
                SidebarItem(
                  label: Text('Latest Set'),
                ),
              ],
            );
          },
          minWidth: 200,
          isResizable: false,
        ),
        children: [
          ContentArea(
            builder: (context, scrollController) => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FutureBuilder<List<PokemonCard>>(
                    future: latestSet,
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return Center(
                          child: ProgressCircle(),
                        );
                      } else {
                        final size = MediaQuery.of(context).size;
                        return Expanded(
                          child: GridView.builder(
                            itemCount: snapshot.data!.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                            ),
                            itemBuilder: (context, index) {
                              return Image.network(
                                snapshot.data![index].images.small,
                              );
                            },
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
