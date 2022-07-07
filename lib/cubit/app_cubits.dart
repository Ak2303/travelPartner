import 'package:bloc/bloc.dart';
import 'package:travel_partner/cubit/app_cubit_state.dart';
import 'package:travel_partner/model/data_model.dart';
import 'package:travel_partner/services/data_services.dart';

class AppCubits extends Cubit<CubitStates> {
  AppCubits({required this.data}) : super(InitialState()) {
    emit(WelcomeState());
  }

  final DataServices data;
  late final places;
  void getData() async {
    try {
      emit(LoadingState());
      places = await data.getInfo();
      emit(LoadedState(places: places));
    } catch (e) {}
  }

  detailPage(DataModel data) {
    emit(DetailState(place: data));
  }

  goHome() {
    emit(LoadedState(places: places));
  }
}
