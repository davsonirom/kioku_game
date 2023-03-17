import 'package:kioku_game/Modo/modo.dart';
import 'package:kioku_game/model/game_opacao.dart';
import 'package:kioku_game/model/game_play.dart';
import 'package:kioku_game/settings/game_settigs.dart';
import 'package:mobx/mobx.dart';
part 'game_controller.g.dart';

class GameController = GameControllerBase with _$GameController;

abstract class GameControllerBase with Store {
  @observable
  List<GameOpacao> gameCards = [];
  @observable
  int score = 0;
  @observable
  bool venceu = false;
  @observable
  bool perdeu = false;

  late GamePlay _gamePlay;
  List<GameOpacao> _escolha = [];
  List<Function> _escolhaCallBack = [];
  int _acertos = 0;
  int _numPares = 0;

  @computed
  bool get jogadaCompleta => (_escolha.length == 2);

  startGame({required GamePlay gamePlay}) {
    _gamePlay = gamePlay;
    _acertos = 0;
    _numPares = (_gamePlay.nivel / 2).round();
    venceu = false;
    perdeu = false;
    _resetScore();
    _generateCards();
  }

  _resetScore() {
    _gamePlay.modo == Modo.normal ? score = 0 : score * _gamePlay.nivel;
  }

  _generateCards() {
    List<int> cardOpcoes = GameSettigs.cardOpcoes.sublist(0)..shuffle();
    cardOpcoes = cardOpcoes.sublist(0, _numPares);
    gameCards = [...cardOpcoes, ...cardOpcoes]
        .map((opcao) =>
            GameOpacao(opcao: opcao, matched: false, selected: false))
        .toList();

    gameCards.shuffle();
  }

  escolher(GameOpacao opacao, Function resetCard) async {
    opacao.selected = true;
    _escolha.add(opacao);
    _escolhaCallBack.add(resetCard);
    await _compararEscolhas();
  }

  _compararEscolhas() async {
    if (jogadaCompleta) {
      if (_escolha[0].opcao == _escolha[1].opcao) {
        _acertos++;
        _escolha[0].matched = true;
        _escolha[1].matched = true;
      } else {
        await Future.delayed(const Duration(seconds: 1), () {
          for (var i in [0, 1]) {
            _escolha[i].selected = false;
            _escolhaCallBack[i]();
          }
        });
      }
      _resetJogada();
      _updateScore();
      _checkGameResult();
    }
  }

  _resetJogada() {
    _escolha = [];
    _escolhaCallBack = [];
  }

  _updateScore() {
    _gamePlay.modo == Modo.normal ? score++ : score--;
  }

  _checkGameResult() async {
    bool allMatched = _acertos == _numPares;
    if (_gamePlay.modo == Modo.normal) {
      await _checkResultModoNormal(allMatched);
    } else {
      await _checkResultModoKoekoe(allMatched);
    }
  }

  _checkResultModoNormal(bool allMatched) async {
    await Future.delayed(const Duration(seconds: 1), () => venceu = allMatched);
  }

  _checkResultModoKoekoe(bool allMatched) async {
    if (_chancesAcabaram()) {
      await Future.delayed(
          const Duration(milliseconds: 400), () => perdeu = true);
    }
    if (allMatched && score >= 0) {
      await Future.delayed(
          const Duration(seconds: 1), () => venceu = allMatched);
    }
  }

  _chancesAcabaram() {
    return score < _numPares - _acertos;
  }

  restarGame() {
    startGame(gamePlay: _gamePlay);
  }

  nextLevel() {
    int nivelIndex = 0;
    if (_gamePlay.nivel != GameSettigs.niveis.last) {
      nivelIndex = GameSettigs.niveis.indexOf(_gamePlay.nivel) + 1;
    }
    _gamePlay.nivel = GameSettigs.niveis[nivelIndex];
    startGame(gamePlay: _gamePlay);
  }
}
