import 'dart:async';

import 'package:adopt_my_pet_dz/core/shared/app_bar.dart';
import 'package:adopt_my_pet_dz/core/shared/sizes.dart';
import 'package:adopt_my_pet_dz/core/widgets/error.dart';
import 'package:adopt_my_pet_dz/core/widgets/loading.dart';
import 'package:adopt_my_pet_dz/features/Lost/domain/entity/lost_animal_enity.dart';
import 'package:adopt_my_pet_dz/features/Lost/domain/entity/lost_entity.dart';
import 'package:adopt_my_pet_dz/features/Lost/presentation/blocs/initlostpagebloc/initlostpage_bloc.dart'
    as Init;
import 'package:adopt_my_pet_dz/features/Lost/presentation/widgets/main_interface_lost_page.dart';
import 'package:adopt_my_pet_dz/injections.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class FindPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(globalSizeClass.heightTopNavBar),
          child: MainAppBar().call(context),
        ),
        body: BuildBlocInit(),
      ),
    );
  }
}

class BuildBlocInit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<Init.InitlostpageBloc>(),
      child: BlocBuilder<Init.InitlostpageBloc, Init.InitlostpageState>(
          builder: (context, state) {
        if (state is Init.Empty) {
          BlocProvider.of<Init.InitlostpageBloc>(context)
              .add(Init.InitLostPageEvent());
          return Container();
        } else if (state is Init.Loading) {
          return LoadingWidget();
        } else if (state is Init.Error) {
          return ErrorPage(
            message: state.message,
          );
        } else if (state is Init.Loaded) {
          var lostEntity = state.data;

          return BuildBlocGetLost(lostEntity);
        }
        return Container();
      }),
    );
  }
}

// ignore: must_be_immutable
class BuildBlocGetLost extends StatefulWidget {
  LostEntity lostEntity;
  BuildBlocGetLost(this.lostEntity);

  @override
  _BuildBlocGetLostState createState() => _BuildBlocGetLostState();
}

class _BuildBlocGetLostState extends State<BuildBlocGetLost> {
  List<LostAnimalEntity> list = [];

  @override
  Widget build(BuildContext context) {
    globalSizeClass.recalcuate(MediaQuery.of(context));
    widget.lostEntity.stream.listen((event) {
      setState(() {
        list.clear();
        event.forEach((element) {
          Map map = element.get('position');
          GeoPoint point = map['geopoint'];
          list.add(LostAnimalEntity(
              shortDescription: element.get("shortDescription"),
              description: element.get("shortDescription"),
              name: element.get("name"),
              position: LatLng(point.latitude, point.longitude),
              imageUrl: element.get("imageUrl")));
        });
      });
    });
    return Column(
      children: [CreateColumnBody(list, widget.lostEntity)],
    );
  }
}

/*return StreamBuilder<List<DocumentSnapshot>>(
          initialData: [],
          stream: lostEntity.stream,
          builder: (context, AsyncSnapshot<List<DocumentSnapshot>> snapashot) {
            if (snapashot.hasError || snapashot == null) {
              return Center(
                child: Text("error"),
              );
            } else if (!snapashot.hasData) {
              return Center(
                child: Text("Vide"),
              );
            } else if (snapashot.hasData) {
              
            }

            /*return Column(
              children: [
                BlocProvider<GetlostanimalsBloc>(
                    create: (_) => sl<GetlostanimalsBloc>(),
                    child: BlocBuilder<GetlostanimalsBloc, GetlostanimalsState>(
                      builder: (context, state) {
                        if (state is Empty) {
                          BlocProvider.of<GetlostanimalsBloc>(context).add(
                              GetLostAnimals(documentList: snapashot.data));
                          return Container();
                        } else if (state is Loading) {
                          return LoadingWidget();
                        } else if (state is Error) {
                          return ErrorPage(
                            message: state.message,
                          );
                        } else if (state is Loaded) {
                          return CreateColumnBody(state.list, lostEntity);
                        }
                        return Container();
                      },
                    )),
              ],
            );*/
          });*/
