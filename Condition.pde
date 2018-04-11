void set_GAME_Condition(){
  //ゲームの状態[START]
  if(GameCondition == START){
     //偶数奇数により画面が明滅
     if(int(millis())/1000 % 2 == 0){
       background(0);
       fill(255);
       textSize(20);
       text("Press [s] START!!",135,520);
     }else{
       background(0);
     } 
     //設定画面へ移動するための案内
     fill(255);
     textSize(15);
     text("Setting Color [m] ",275,height-7);
     
     if(int(millis())/1000 % 2 == 0 ){
       fill(51,255,204);
       textSize(50);
       text("BreakOut Game",10,80);
     }else{
       fill(255);
       textSize(50);
       text("BreakOut Game",10,80);
     }
     //ランキング表示　
     fill(int(random(128,255)),int(random(128,255)),int(random(0,255)));
     textSize(35);
     text("-----Ranking-----",25,200);
     fill(int(random(180,231)),int(random(130,200)),int(random(0,50)));
     text("1st",25,270);
     text(max(data),110,270);
     fill(int(random(142,192)),int(random(142,192)),int(random(142,192)));
     text("2nd",25,350);
     text(data[1],110,350);
     fill(int(random(162,196)),int(random(78,112)),int(random(0,34)));
     text("3rd",25,430);
     text(data[2],110,430);
     menu.play();
     //'s'を押したら次の画面へ移行
     if(key == 's'){
      GameCondition = GAME_READY;
      press_s.play();
     }
     //'m'を押したらMENUへ移行
     if(key == 'm'){
      GameCondition = MENU;
    }
  }
  //ゲームの状態[MENU]
  if(GameCondition == MENU){
    if(int(millis())/1000 % 2 == 0){
       background(0);
       fill(255);
       textSize(20);
       text("mouse Click!!",135,520);
     }else{
       background(0);
     } 
   
    fill(255);
    textSize(15);
    text("Back to the MENU [b]",135,580);
    fill(255);
    textSize(50);
    text("Color Setting",40,120);
    
    //表示されてる文字の範囲内でクリックすると次の画面へ移行
    textSize(40);
    fill(255);
    text("Classic",130,250);
    if(mouseX >= 130 && mouseX <= 235){
      if(mouseY >= 210 && mouseY <= 260){
         if(mousePressed){
           GameCondition = GAME_READY;
         }   
      }
    }
    
    textSize(40);
    fill(255);
    text("Pop",160,320);
    if(mouseX >= 160 && mouseX <= 235){
      if(mouseY >= 285 && mouseY <= 330){
         fill(int(random(0,255)),int(random(0,255)),int(random(0,255)));
         text("Pop",160,320);
         //Pop選択時の処理
         if(mousePressed){
           PLAY_Ba_R = 162;
           PLAY_Ba_G = 215;
           PLAY_Ba_B = 212;//背景を空色に
           Block_R = 255;
           Block_G = 255;
           Block_B = 255;//ブロックを白に
           POP_R = 169;
           POP_G = 169;
           POP_B = 169;//雲を灰色に
           GameCondition = GAME_READY;
         }   
      }
    }
    //'b'を押すとSTARTに移行
    if(key =='b'){
    GameCondition = START;
    }
    }
//ゲームの状態[GAME_CLEAR]
  if(GameCondition == GAME_CLEAR){
      background(255);
      fill(255);
      text(score,10,height); 
      textSize(50);
      fill(0);
      text("GameClear",80,300);
      noLoop();
    }  
//ゲームの状態[GAME_OVER]  
  if(GameCondition == GAME_OVER){
     cursor();
     background(255);
     fill(255);
     text(score,200,300);  
     fill(255,0,0);
     textSize(50);
     text("GameOver",80,250);
     text("Retry",135,500);
     if(mouseX >= 120 && mouseX <= 200){
      if(mouseY >= 460 && mouseY <= 510){
         if(mousePressed){
           ball_count = 3;
           GameCondition = START;
         }   
      }
    }
     fill(0);
     text(score,130,350); 
    }
//ゲームの状態[GAME_READY]
  if(GameCondition == GAME_READY){
    background(PLAY_Ba_R,PLAY_Ba_G,PLAY_Ba_B);
    set_ARROW_Condition();
    fill(255);
    text(score,100,height);  
    fill(255);
    textSize(15);
    text("Press [space]!!",290,height-2);
    set_Pop();
    set_Block();
    fill(255);
    rect(180,556,55,4);
    set_key();
  }
//ゲームの状態[GAME_PLAY] 
  if(GameCondition == GAME_PLAY){
    noCursor();
    background(PLAY_Ba_R,PLAY_Ba_G,PLAY_Ba_B);
    set_Ball();
    set_Pad();
    set_Collision();
    set_Pop();
    //残りのHPを色で表現
    textSize(15);
    fill(255);
    text("HP",320,height);
    if(ball_count == 3){
      set_BALL(0,255,0,350,590,7,7);
      set_BALL(0,255,0,360,590,7,7);
      set_BALL(0,255,0,370,590,7,7);
    }
    if(ball_count == 2){
      set_BALL(255,255,0,360,590,7,7);
      set_BALL(255,255,0,370,590,7,7);
    }
    if(ball_count == 1){
      set_BALL(255,0,0,370,590,7,7);
    }
    //バーの当たった場所により反射する向きを調整
    if (checkHit(Ball_x, Ball_y)) {
      if(Ball_x + Ball_w >= mouseX && Ball_x + Ball_w <= mouseX + (P_w/2)-10){
        Ball_dx = -(int(random(3,5)));
        Ball_dy = -(int(random(4,6)));
      }
      if(Ball_x + Ball_w >= mouseX + (P_w/2)-10 && Ball_x + Ball_w <= mouseX + (P_w/2) +10){
       Ball_dy = -(int(random(4,6)));
      }
      if(Ball_x + Ball_w >= mouseX + (P_w/2) +10 && Ball_x + Ball_w <= mouseX + P_w){
        Ball_dx =  (int(random(3,5)));
        Ball_dy = -(int(random(4,6)));
      }
      random_check();
      count = count + 1;
      reflect.play();
      reflect.rewind();
    }
   }
}
 