import 'package:finsight/presentation/register/register_view_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../../presentation/dashboard/dashboard_view_model.dart';
import '../../presentation/login/login_view_model.dart';

List<SingleChildWidget> providerList = [
  ChangeNotifierProvider(
    create: (context) => RegisterViewModel(),
  ),
  ChangeNotifierProvider(
    create: (context) => DashboardViewModel(),
  ),
  ChangeNotifierProvider(create: (context) => LoginViewModel()),
];
