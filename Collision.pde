//サンプル改変
void set_Collision(){
  int ref = 0;
  for(int i=0; i<8; i++) {
    for(int j=0;j<8;j++){
      if (hit[i][j] > 0) {
        //hitの数値によりブロック色が変化
        if(j==7 && hit[i][j]==1){
          fill(230,230,250);
        }else if((j==6) && (hit[2][7]==0 || hit[6][7]==0 )){
          fill(169,169,169);
        }else if((j==5) && (hit[3][6]==0 || hit[4][6]==0 || hit[6][6]==0 || hit[7][6]==0)){
          fill(128,128,128);
        }else if(j<=4 && hit[i][j]==1 && (hit[3][5]==0 || hit[4][5]==0 || hit[6][5]==0 || hit[7][5]==0) ) {
          fill(105,105,105);
        }else{
          fill(Block_R,Block_G,Block_B);
        }
      show_block(i,j);
      ref = checkHitBlock(i,j,Ball_x,Ball_y);
        //当たり判定によりスコアを獲得、反射音を追加
        switch (ref) {
        case 1:
          hit[i][j]--;
          score = score + 1000;
          reflect.play();
          reflect.rewind();
        case 2:
        case 8:
          score = score + 2000;
          Ball_dy = sy;
          reflect.play();
          reflect.rewind();
          break;
        case 5:
          hit[i][j]--;
          score = score + 1000;
          reflect.play();
          reflect.rewind();
        case 4:
        case 6:
          score = score + 2000;
          Ball_dy = -sy;
          reflect.play();
          reflect.rewind();
          break;
      }
      switch (ref) {
        case 2:
        case 3:
        case 4:
          hit[i][j]--;
          score = score + 2000;
          Ball_dx = sx;
          reflect.play();
          reflect.rewind();
          break;
        case 6:
        case 7:
        case 8:
          hit[i][j]--;
          score = score + 2000;
          Ball_dx = -sx;
          reflect.play();
          reflect.rewind();
          break;
      } 
      //全てのブロックを壊すと[GAME_CLEAR]に偏移
      if(hit[i][j] == 0){
        block_sum = block_sum +1;
      }
      
      if(block_sum == 64){
        GameCondition = GAME_CLEAR; 
      }
      //破壊したブロックを表示
       fill(255);
       text("Crash",5,height-15);
       fill(255);
       text(block_sum,5,height);
      }
      set_item(); 
      }
    }
    } 
  
 