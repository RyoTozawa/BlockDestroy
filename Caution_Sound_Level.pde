//b1016031 戸澤涼
//Minimライブラリインポート
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
//Audio用変数を作成
Minim minim;
AudioPlayer reflect;
AudioPlayer menu;
AudioPlayer press_s;
AudioPlayer crash;
int data[] = new int[100];//ランキング用配列
void setup() {
  size(400, 600);
  minim = new Minim(this);//初期化
  frameRate(40);//フレームレート100に設定
  reflect = minim.loadFile("othr03.mp3");//反射音
  menu = minim.loadFile("menu_1.mp3");//メニューBGM
  press_s = minim.loadFile("decide.mp3");//プッシュ音
  crash = minim.loadFile("crash.mp3");
  load_SCORE();//textデータから読み込み
}
//ゲームの状態を示す定数を作成
int GameCondition;
static final int START = 0;//初期画面
static final int MENU = 1;//設定画面
static final int GAME_READY = 2;//ゲーム前
static final int GAME_PLAY = 3;//ゲーム中
static final int GAME_OVER = 4;//ゲームオーバー
static final int GAME_CLEAR = 5;//ゲームクリア
//GAME_READY画面のボール射出を設定
int ArrowCondition;
static final int Center = 0;//真ん中
static final int Left = 1;//左
static final int Right = 2;//右
int Arrow_Cx = 207;//真ん中x
int Arrow_Cy = 400;//真ん中y
int Arrow_Lx = 127;//左x
int Arrow_Ly = 400;//左y
int Arrow_Rx = 287;//右x
int Arrow_Ry = 400;//右y
//ボール
float Ball_x = 0;//ボールの初期座標x
float Ball_y = 300;//ボールの初期座標y
float Ball_dx = -1;//ボール進行方向x
float Ball_dy = -2;//ボール進行方向y
float sx = random(1,3); // ブロック衝突時増分
float sy = random(2,4); // ブロック衝突時増分
float Ball_w = 6; // ボール幅
float Ball_h = 6; // ボール高さ
int Ball_R = 255;// ボールR
int Ball_G = 255;// ボールG
int Ball_B = 255;// ボールB

int count = 0;
int ball_count = 3;//HP
int block_sum = 0;//破壊したブロックの数
//ブロック64個分の体力
int hit[][] = {{2,1,1,1,1,1,1,1},{2,1,1,1,1,1,1,1}
              ,{2,1,1,1,1,1,1,1},{2,1,1,1,1,1,1,1}
              ,{2,1,1,1,1,1,1,1},{2,1,1,1,1,1,1,1}
              ,{2,1,1,1,1,1,1,1},{2,1,1,1,1,1,1,1}}; 
//パッド
float P_w = 50.0; // Pad width
float P_h = 4.0;  // Pad height
float pad_cx = 206;//Pad center x
float pad_cy = 560;//Pad center y
float Block_w = 45.0; // block width
float Block_h = 15.0; // block height
//RGB格納用変数
int PLAY_Ba_R = 0;//背景R
int PLAY_Ba_G = 0;//背景G
int PLAY_Ba_B = 0;//背景B
int POP_R = 0;//雲R
int POP_G = 0;//雲G
int POP_B = 0;//雲B
int Block_R = 0;// ブロックR
int Block_G = 255;// ブロックG
int Block_B = 0;// ブロックB
int score = 0;//スコア

void draw() {
  set_debug();//動作確認モード
  set_GAME_Condition();//ゲームの状態による様々な処理
}