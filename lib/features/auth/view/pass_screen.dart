// ignore_for_file: prefer_typing_uninitialized_variables, no_leading_underscores_for_local_identifiers

part of 'sign_in_screen.dart';

class PassScreen extends StatefulWidget {
  static const String id = 'pass_screen';

  const PassScreen({Key? key}) : super(key: key);

  @override
  State<PassScreen> createState() => _PassScreenState();
}

class _PassScreenState extends State<PassScreen> {
  final _formKey = GlobalKey<FormState>();

  late final FocusNode _repassFocusNode;

  Map<String, String>? dataUser;

  late final _authBloc;
  late final _passController = TextEditingController();

  late final _repassController = TextEditingController();

  void _submit(BuildContext context) {
    FocusScope.of(context).unfocus();

    if (!_formKey.currentState!.validate()) {
      //Invalid
      return;
    }
    if (_passController.text != _repassController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Пароли не совпадают'),
        ),
      );
      return;
    }

    print("Password - ${_passController.text}");
    print("Repass - ${_repassController.text}");

    String? mail = dataUser!['login'];
    String? name = dataUser!['username'];

    _formKey.currentState!.save();

    final listMail = mail!.split('@');
    final _uniqueId = listMail[0];

    UserSignUp user = UserSignUp(
      mail: mail,
      password: _passController.text,
      username: name!, uniqueId: '@$_uniqueId',
    );

    _authBloc.add(AuthSignUpEvent(
      user: user,
    ));
    int count = 0;
    Navigator.of(context).popUntil((_) => count++ >= 2);
  }

  @override
  void didChangeDependencies() {
    final args = ModalRoute.of(context)!.settings.arguments;
    assert(args != null && args is Map<String, String>,
        'The arguments do not match the required type');
    dataUser = args as Map<String, String>;
    super.didChangeDependencies();
  }

  @override
  void initState() {
    _authBloc = context.read<AuthBloc>();
    _repassFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _passController.dispose();
    _repassController.dispose();
    _repassFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: TitleForApp(
            theme: theme.titleSmall!,
          ),
        ),
        body: SafeArea(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListView(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                children: [
                  const SizedBox(
                    height: 35,
                  ),
                  //password
                  PassField(
                    controller: _passController,
                    theme: theme,
                    focusNode: _repassFocusNode,
                    error: 'Введите пароль',
                    name: 'Пароль',
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  //repass
                  PassField(
                    controller: _repassController,
                    theme: theme,
                    focusNode: _repassFocusNode,
                    error: 'Введите пароль ещё раз',
                    name: 'Повторите пароль',
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  //Регистриция
                  ButtonForAuthScreen(
                    name: 'Зарегистрироваться',
                    theme: theme.labelMedium!,
                    type: false,
                    color: Colors.white,
                    voidCallback: () {
                      _submit(context);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
