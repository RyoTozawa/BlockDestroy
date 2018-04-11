//ARROWの状態をもとに動作を変える
void set_ARROW_Condition(){
  if(ArrowCondition == Center){
    //偶数奇数で矢を明滅させる
    if(int(millis())/1000 % 2 == 0){
       background(PLAY_Ba_R,PLAY_Ba_G,PLAY_Ba_B);
       set_ARROW(0,255,0,pad_cx,pad_cy,Arrow_Cx,Arrow_Cy);
       set_BALL(0,255,0,Arrow_Cx,Arrow_Cy,Ball_w,Ball_h);
       set_ARROW(255,255,255,pad_cx,pad_cy,Arrow_Lx,Arrow_Ly);
       set_BALL(255,255,255,Arrow_Lx,Arrow_Ly,Ball_w,Ball_h);
       set_ARROW(255,255,255,pad_cx,pad_cy,Arrow_Rx,Arrow_Ry);
       set_BALL(255,255,255,Arrow_Rx,Arrow_Ry,Ball_w,Ball_h);
     }else{
       set_ARROW(255,255,255,pad_cx,pad_cy,Arrow_Cx,Arrow_Cy);
       set_BALL(255,255,255,Arrow_Cx,Arrow_Cy,Ball_w,Ball_h); 
       set_ARROW(255,255,255,pad_cx,pad_cy,Arrow_Lx,Arrow_Ly);
       set_BALL(255,255,255,Arrow_Lx,Arrow_Ly,Ball_w,Ball_h);
       set_ARROW(255,255,255,pad_cx,pad_cy,Arrow_Rx,Arrow_Ry);
       set_BALL(255,255,255,Arrow_Rx,Arrow_Ry,Ball_w,Ball_h);
     }
     //'j'を押すと[Left]に
     if(key == 'j'){
       ArrowCondition = Left;
     }
     //'l'を押すと[Right]に
     if(key == 'l'){
       ArrowCondition = Right;
     }
  }
  //以下同文
  if(ArrowCondition == Left){
    if(int(millis())/1000 % 2 == 0){
       background(PLAY_Ba_R,PLAY_Ba_G,PLAY_Ba_B);
       set_ARROW(255,255,255,pad_cx,pad_cy,Arrow_Cx,Arrow_Cy);
       set_BALL(255,255,255,Arrow_Cx,Arrow_Cy,Ball_w,Ball_h);
       set_ARROW(255,0,0,pad_cx,pad_cy,Arrow_Lx,Arrow_Ly);
       set_BALL(255,0,0,Arrow_Lx,Arrow_Ly,Ball_w,Ball_h);
       set_ARROW(255,255,255,pad_cx,pad_cy,Arrow_Rx,Arrow_Ry);
       set_BALL(255,255,255,Arrow_Rx,Arrow_Ry,Ball_w,Ball_h);
     }else{
       set_ARROW(255,255,255,pad_cx,pad_cy,Arrow_Cx,Arrow_Cy);
       set_BALL(255,255,255,Arrow_Cx,Arrow_Cy,Ball_w,Ball_h); 
       set_ARROW(255,255,255,pad_cx,pad_cy,Arrow_Lx,Arrow_Ly);
       set_BALL(255,255,255,Arrow_Lx,Arrow_Ly,Ball_w,Ball_h);
       set_ARROW(255,255,255,pad_cx,pad_cy,Arrow_Rx,Arrow_Ry);
       set_BALL(255,255,255,Arrow_Rx,Arrow_Ry,Ball_w,Ball_h);
     }
     }
     if(key == 'k'){
       ArrowCondition = Center;
     }
     if(key == 'l'){
       ArrowCondition = Right;
     }
  
  if(ArrowCondition == Right){
    if(int(millis())/1000 % 2 == 0){
       set_ARROW(255,255,255,pad_cx,pad_cy,Arrow_Cx,Arrow_Cy);
       set_BALL(255,255,255,Arrow_Cx,Arrow_Cy,Ball_w,Ball_h);
       set_ARROW(255,255,255,pad_cx,pad_cy,Arrow_Lx,Arrow_Ly);
       set_BALL(255,255,255,Arrow_Lx,Arrow_Ly,Ball_w,Ball_h);
       set_ARROW(0,0,255,pad_cx,pad_cy,Arrow_Rx,Arrow_Ry);
       set_BALL(0,0,255,Arrow_Rx,Arrow_Ry,Ball_w,Ball_h);
     }else{
       set_ARROW(255,255,255,pad_cx,pad_cy,Arrow_Cx,Arrow_Cy);
       set_BALL(255,255,255,Arrow_Cx,Arrow_Cy,Ball_w,Ball_h); 
       set_ARROW(255,255,255,pad_cx,pad_cy,Arrow_Lx,Arrow_Ly);
       set_BALL(255,255,255,Arrow_Lx,Arrow_Ly,Ball_w,Ball_h);
       set_ARROW(255,255,255,pad_cx,pad_cy,Arrow_Rx,Arrow_Ry);
       set_BALL(255,255,255,Arrow_Rx,Arrow_Ry,Ball_w,Ball_h);
     }
     }
     if(key == 'k'){
       ArrowCondition = Center;
     }
     if(key == 'j'){
       ArrowCondition = Left;
     }
  fill(255);
  textSize(15);
  text("[J]",Arrow_Lx-8,Arrow_Ly-10);
  text("[K]",Arrow_Cx-8,Arrow_Cy-10);
  text("[L]",Arrow_Rx-8,Arrow_Ry-10);
}
  
  
       
     