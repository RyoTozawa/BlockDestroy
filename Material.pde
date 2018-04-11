//Ball用関数
void set_Ball(){
  Ball_x = Ball_x + Ball_dx; 
  Ball_y = Ball_y + Ball_dy;
  
  if (Ball_x + Ball_w >= width) {
    Ball_dx = -1;
    reflect.play();
    reflect.rewind();
  } else if (Ball_x < 0) {
    Ball_dx = 1;
    reflect.play();
    reflect.rewind();
  }
  
  if (Ball_y + Ball_w > height) {
    Ball_x = 0;
    Ball_y = 300;
    Ball_dx = 1;
    Ball_dy = 2;
    count = 0;
    ball_count--; 
    if(ball_count == 0){ 
      GameCondition = GAME_OVER;
    }
  } else if (Ball_y < 0) {
    Ball_dy = 2;
    reflect.play();
    reflect.rewind();
  }
    
  background(PLAY_Ba_R,PLAY_Ba_G,PLAY_Ba_B);
  fill(Ball_R,Ball_G,Ball_B);
  rect(Ball_x, Ball_y, Ball_w, Ball_w); // ball
}
//パッド用関数を作成
void set_Pad(){
  fill(255);
  rect(mouseX, 560, P_w, P_h); // pad
}
//アロー用関数作成
void set_Arrow(){
  line(206,560,Arrow_Cx,Arrow_Cy);
  ellipse(Arrow_Cx,Arrow_Cy,7,7);
  line(206,560,Arrow_Lx,Arrow_Ly);
  ellipse(Arrow_Lx,Arrow_Ly,7,7);
  line(206,560,Arrow_Rx,Arrow_Ry);
  ellipse(Arrow_Rx,Arrow_Ry,7,7);
}
//stroke・lineを合成
void set_ARROW(int R,int G,int B,float sx,float sy,float ex,float ey){
  stroke(R,G,B);
  line(sx,sy,ex,ey);
}
//fill・ellipseを合成
void set_BALL(int R,int G,int B,float sx,float sy,float Ball_width,float Ball_height){
  fill(R,G,B);
  ellipse(sx,sy,Ball_width,Ball_height);
}
//READY時のブロック作成
void set_Block(){
  for(int i=10;i<350;i+=48){
    for(int j=25;j<170;j+=20){
      stroke(255);
      fill(Block_R,Block_G,Block_B);
      rect(i,j,45,15);
    }
  }
}
//サンプル改変
void show_block(int n,int m) {
  stroke(255);
  rect(5+49*n, 25+20* m, Block_w, Block_h);
}