import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../auth/bloc/auth_bloc.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({Key? key}) : super(key: key);

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  late final _authBloc;

  @override
  void initState() {
    _authBloc = context.read<AuthBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: IconButton(
          onPressed: () {
            _authBloc.add(AuthLogOutEvent());
            setState(() {});
          },
          icon: Icon(Icons.add),
        ),
      ),
    );
  }
}
