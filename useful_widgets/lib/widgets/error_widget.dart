class ErrorPage extends StatelessWidget {
  final IconData iconData;
  final String? error;
  

  const ErrorPage(
      {Key? key,
      this.iconData = Icons.error,
      this.error})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              iconData,
              size: 40,
              color: Colors.grey.shade400,
            ),
            Container(
              margin: const EdgeInsets.only(
                top: 12,
              ),
              child: Text(
                error ?? "",
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
