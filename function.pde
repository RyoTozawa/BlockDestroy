//サンプル引用
boolean checkHit(float x, float y) {
  if (y + Ball_h < 560) return false;
    
  if (x + Ball_w >= mouseX && x <= mouseX + P_w && y + Ball_y >= 560 && y <= 560 + P_h) {
    return true;
  } else {
    return false;
  }
}
//Arrowが真ん中から射出した場合にバー反射時x座標への偏移を追加する
void random_check(){
  if(Ball_dx == 0){
      Ball_dx = -(int(random(2,3)));
     if (Ball_x + Ball_w >= mouseX && Ball_x <= mouseX + (P_w/2)) {
      Ball_dx = (int(random(-2,2)));
     }
     if(Ball_x + (P_w/2) >= mouseX && Ball_x <= mouseX + P_w){
       Ball_dx = (int(random(-2,2)));
     }
  }
}
//サンプル改変
int checkHitBlock(int n,int m, float x, float y) {
  float left   = 5 + (49 * n);
  float right  = 5 + (49 * (n+1));
  float top    = 25 + (20 * m);
  float bottom = (25+20* m)+Block_h;
  float cx = left + Block_w / 2;
  float cy = top + Block_h / 2;
  float y1, y2;
  
  if ((x + Ball_w <= left) ||
      (x >= right) ||
      (y + Ball_h <= top) ||
      (y >= bottom)) {
        return 0;
      }
      
   x = x + Ball_w / 2;
   y = y + Ball_h / 2;

   y1 = y - (-(x - cx)* Block_h / Block_w + cy);
   y2 = y - ( (x - cx)* Block_h / Block_w + cy);
   
   if (y1 > 0) {
     if (y2 > 0) {
       return 1;
     } else if (y2 == 0) {
       return 2;
     } else {
       return 3;
     }
   } else if (y1 < 0) {
     if (y2 > 0) {
       return 7;
     } else if (y2 == 0) {
       return 6;
     } else {
       return 5;
     }
   } else {
     if (y2 > 0) {
       return 8;
     } else if (y2 == 0) {
       return -1;
     } else {
       return 4;
     }
   }
}
//最初の状態を初期画面に
void initCondition(){
  GameCondition = START;
}
//画面上部の雲
void set_Pop(){
  noStroke();
  fill(POP_R,POP_G,POP_B);
  ellipse(0,0,100,100);
  fill(POP_R,POP_G,POP_B);
  ellipse(400,0,100,100);
}
//テキストから読み込み
void load_SCORE(){
  String result[] = loadStrings("data.txt");
  for(int i=0;i<result.length;i++){
    data[i] = int(result[i]);
  }
  sort(data,data.length);
}