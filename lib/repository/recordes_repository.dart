import 'package:hive/hive.dart';
import 'package:kioku_game/Modo/modo.dart';
import 'package:kioku_game/model/game_play.dart';
import 'package:mobx/mobx.dart';
part 'recordes_repository.g.dart';

class RecordesRepository = RecordesRepositoryBase with _$RecordesRepository;

abstract class RecordesRepositoryBase with Store {
  late final Box _recordes;
  late final GamePlay gamePlay;

  @observable
  Map recordesKoekoe = {};
  @observable
  Map recordesNormal = {};

  RecordesRepositoryBase() {
    _initRepository();
  }

  _initRepository() async {
    await _initDataBase();
    await loadRecordes();
  }

  _initDataBase() async {
    _recordes = await Hive.openBox('gamerecordes');
  }

  @action
  loadRecordes() {
    recordesNormal = _recordes.get(Modo.normal.toString()) ?? {};
    recordesKoekoe = _recordes.get(Modo.koekoe.toString()) ?? {};
  }

  updateRecordes({required GamePlay gamePlay, required int score}) {
    final key = gamePlay.modo.toString();
    if (gamePlay.modo == Modo.normal &&
        (recordesNormal[gamePlay.nivel] == null ||
            score < recordesNormal[gamePlay.nivel])) {
      recordesNormal[gamePlay.nivel] = score;
      _recordes.put(key, recordesNormal);
    } else if (gamePlay.modo == Modo.koekoe &&
        (recordesKoekoe[gamePlay.nivel] == null ||
            score > recordesKoekoe[gamePlay.nivel])) {
      recordesKoekoe[gamePlay.nivel] = score;
      _recordes.put(key, recordesKoekoe);
    }
  }
}
