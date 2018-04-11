//ARROW使用時にキーで方向変更
void set_key(){
  if(key == ' '){
    if(ArrowCondition == Center){
      GameCondition = GAME_PLAY;
      Ball_x = Arrow_Cx;
      Ball_y = Arrow_Cy;
      Ball_dx = 0;
      Ball_dy = -2;
      menu.close();
  }
  if(key == ' '){
    if(ArrowCondition == Left){
      GameCondition = GAME_PLAY;
      Ball_x = Arrow_Lx;
      Ball_y = Arrow_Ly;
      Ball_dx = -1;
      Ball_dy = -2;
      menu.close();
  }
  if(key == ' '){
    if(ArrowCondition == Right){
      GameCondition = GAME_PLAY;
      Ball_x = Arrow_Rx;
      Ball_y = Arrow_Ry;
      Ball_dx = 1;
      Ball_dy = -2;
      menu.close();
  }
  }
  }
  }
}


  