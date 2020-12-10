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
