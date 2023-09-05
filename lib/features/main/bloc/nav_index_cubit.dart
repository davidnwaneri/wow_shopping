import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wow_shopping/features/main/widgets/bottom_nav_bar.dart';

class NavIndexCubit extends Cubit<NavItem> {
  NavIndexCubit() : super(NavItem.home);

  void setIndex(NavItem item) => emit(item);
}
