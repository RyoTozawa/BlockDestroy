//動作確認用モード
void set_debug(){
  if(key =='c'){
    Ball_x = mouseX;
    Ball_y = mouseY;
    GameCondition = GAME_PLAY;
    menu.close();
  }
}