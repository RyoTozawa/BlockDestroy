//ブロック破壊時落下アイテム
float item_1x = 120;
float item_1y = 222;
float item_dy = 0.01;
float item_2x = 150;
float item_2y = 198;
float item_2dy = 0.02;
float item_3x = 250;
float item_3y = 174;
float item_3dy = 0.02;
//特定のブロックが破壊された時の処理
void set_item(){
  if(hit[2][7] == 0 || hit[6][7] == 0){
    fill(0,0,255);
    ellipse(item_1x,item_1y,10,10);
    item_1y += item_dy;
    Ball_R = 0;
    Ball_G = 0;
    Ball_B = 255;
    set_dummy();
  }
 
  if(hit[3][6]==0 || hit[4][6]==0 || hit[6][6]==0 || hit[7][6]==0){
    fill(255,0,0);
    ellipse(item_2x,item_2y,10,10);
    item_2y += item_2dy;
    Ball_R = 255;
    Ball_G = 0;
    Ball_B = 0;
    set_dummy2();
    if(millis() % 50.0 == 0){
        PLAY_Ba_R = 255;
        PLAY_Ba_G = 255;
        PLAY_Ba_B = 0;
      }else{
        PLAY_Ba_R = 0;
        PLAY_Ba_G = 0;
        PLAY_Ba_B = 0;
      }
  }
 
 if(hit[3][5]==0 || hit[4][5]==0 || hit[6][5]==0 || hit[7][5]==0){
   fill(255,0,0);
   ellipse(item_3x,item_3y,10,10);
   item_3y += item_3dy;
   set_dummy3();
 }

 if(hit[3][4]==0 || hit[4][4]==0 || hit[6][4]==0 || hit[7][4]==0){
   if(millis() % 50.0 == 0){
     PLAY_Ba_R = 162;
     PLAY_Ba_G = 215;
     PLAY_Ba_B = 212;
  }else{
     PLAY_Ba_R = 162;
     PLAY_Ba_G = 215;
     PLAY_Ba_B = 212;
  }
 }
     
 if (checkHit(item_1x, item_1y)) {
    P_w = 80;
    Ball_dx = 3;
    Ball_dy = -5;
    Ball_x = 200;
    Ball_y = 100;
  }
  
 if (checkHit(item_2x, item_2y)) {
    P_w = 50;
    } 
    
 if (checkHit(item_3x, item_3y)) {
    GameCondition = GAME_CLEAR;
   }   
 }
  
  
   
  
  
  