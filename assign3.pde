PImage title, gameover, startNormal, startHovered, restartNormal, restartHovered;
PImage bg, life, stone1, stone2;
PImage soil0,soil1,soil2,soil3,soil4,soil5;
PImage groundhogIdle,groundhogDown,groundhogLeft,groundhogRight;

final int GAME_START = 0, GAME_RUN = 1, GAME_OVER = 2;
int gameState = 0;

final int GRASS_HEIGHT = 15;
final int START_BUTTON_W = 144;
final int START_BUTTON_H = 60;
final int START_BUTTON_X = 248;
final int START_BUTTON_Y = 360;

final int MOVE_STOP = 0;
final int MOVE_DOWN = 1;
final int MOVE_LEFT = 2;
final int MOVE_RIGHT = 3;
int moveState = MOVE_STOP;
int point = 80;
float SPD;

float allSoilY = 0;

float groundhogIdleX,groundhogIdleY;
float groundhogWidth = 80;

int soil[] = new int[8];
PImage soilImage[] = new PImage[6];

// For debug function; DO NOT edit or remove this!
int playerHealth = 0;
float cameraOffsetY = 0;
boolean debugMode = false;

void setup() {
	size(640, 480, P2D);
	// Enter your setup code here (please put loadImage() here or your game will lag like crazy)
	bg = loadImage("img/bg.jpg");
	title = loadImage("img/title.jpg");
	gameover = loadImage("img/gameover.jpg");
	startNormal = loadImage("img/startNormal.png");
	startHovered = loadImage("img/startHovered.png");
	restartNormal = loadImage("img/restartNormal.png");
	restartHovered = loadImage("img/restartHovered.png");
  life = loadImage("img/life.png");
  
  soilImage[0] = loadImage("img/soil0.png");
  soilImage[1] = loadImage("img/soil1.png");
  soilImage[2] = loadImage("img/soil2.png");
  soilImage[3] = loadImage("img/soil3.png");
  soilImage[4] = loadImage("img/soil4.png");
  soilImage[5] = loadImage("img/soil5.png");
  
  stone1 = loadImage("img/stone1.png");
  stone2 = loadImage("img/stone2.png"); 
  
  groundhogIdle = loadImage("img/groundhogIdle.png");
  groundhogIdleX = 320;
  groundhogIdleY = 80;
  groundhogDown = loadImage("img/groundhogDown.png");
  groundhogLeft = loadImage("img/groundhogLeft.png");
  groundhogRight = loadImage("img/groundhogRight.png");
  SPD = 60 / 15;SPD = 60 / 15;
  
  playerHealth = 2;
}

void draw() {
    /* ------ Debug Function ------ 

      Please DO NOT edit the code here.
      It's for reviewing other requirements when you fail to complete the camera moving requirement.

    */
    if (debugMode) {
      pushMatrix();
      translate(0, cameraOffsetY);
    }
    /* ------ End of Debug Function ------ */

    
	switch (gameState) {

		case GAME_START: // Start Screen
		image(title, 0, 0);

		if(START_BUTTON_X + START_BUTTON_W > mouseX
	    && START_BUTTON_X < mouseX
	    && START_BUTTON_Y + START_BUTTON_H > mouseY
	    && START_BUTTON_Y < mouseY) {

			image(startHovered, START_BUTTON_X, START_BUTTON_Y);
			if(mousePressed){
				gameState = GAME_RUN;
				mousePressed = false;
			}

		}else{

			image(startNormal, START_BUTTON_X, START_BUTTON_Y);

		}
		break;

		case GAME_RUN: // In-Game

		// Background
		image(bg, 0, 0);

    pushMatrix();
    translate(0,allSoilY);

		// Sun
	    stroke(255,255,0);
	    strokeWeight(5);
	    fill(253,184,19);
	    ellipse(590,50,120,120);

		// Grass
		fill(124, 204, 25);
		noStroke();
		rect(0, 160 - GRASS_HEIGHT, width, GRASS_HEIGHT);

		// Soil - REPLACE THIS PART WITH YOUR LOOP CODE!
    for(int i=0 ; i < soil.length ; i++){
      for(int n=0; n<4 ; n++){
        for(int a=0; a<soilImage.length; a++){
          image(soilImage[a],0+80*i,(160+320*a)+80*n,80,80);
        }
      }
    }
    //stone
    //1~8
    for (int j =160; j<width+240; j=j+80){
    pushMatrix();
    translate(j-160, j);
    image(stone1,0,0);
    popMatrix();
    }
    //9~16
    for (int x =40; x<width+80; x=x+160){
      for (int y =400; y<400+160; y=y+120){
      pushMatrix();
      translate(x, y);
      image(stone1,x,y);
      image(stone1,x+80,y);
      popMatrix();
     }
    }
    for (int x =0-40; x<width+160; x=x+160){
      for (int y =440; y<440+80; y=y+40){
      pushMatrix();
      translate(x, y);
      image(stone1,x,y);
      image(stone1,x+80,y);
      popMatrix();
     }
    }
    for (int x =40; x<width+80; x=x+160){
      for (int y =560; y<560+160; y=y+120){
      pushMatrix();
      translate(x, y);
      image(stone1,x,y);
      image(stone1,x+80,y);
      popMatrix();
     }
    }
    for (int x =0-40; x<width+160; x=x+160){
      for (int y =600; y<600+80; y=y+40){
      pushMatrix();
      translate(x, y);
      image(stone1,x,y);
      image(stone1,x+80,y);
      popMatrix();
     }
    }
    //16~24
    for (int x =40; x<width+160; x=x+120){
      for (int y =720; y<720+280; y=y+120){
      pushMatrix();
      translate(x, y);
      image(stone1,x,y);
      image(stone1,x+80,y);
      popMatrix();
     }
    }
    for (int x =0; x<width+160; x=x+120){
      for (int y =760; y<760+280; y=y+120){
      pushMatrix();
      translate(x, y);
      image(stone1,x,y);
      image(stone1,x+80,y);
      popMatrix();
     }
    }
    for (int x =0-40; x<width+160; x=x+120){
      for (int y =800; y<800+160; y=y+120){
      pushMatrix();
      translate(x, y);
      image(stone1,x,y);
      image(stone1,x+80,y);
      popMatrix();
     }
    }
    for (int x =80; x<width+160; x=x+120){  //stone2
      for (int y =720; y<720+280; y=y+120){
      pushMatrix();
      translate(x, y);
      image(stone2,x,y);
      popMatrix();
     }
    }
    for (int x =40; x<width+160; x=x+120){
      for (int y =760; y<760+280; y=y+120){
      pushMatrix();
      translate(x, y);
      image(stone2,x,y);
      popMatrix();
     }
    }
    for (int x =0; x<width+160; x=x+120){
      for (int y =800; y<800+160; y=y+120){
      pushMatrix();
      translate(x, y);
      image(stone2,x,y);
      popMatrix();
     }
    }
    //groundhogIdle
     switch(moveState){
       case MOVE_STOP:
        image(groundhogIdle,groundhogIdleX,groundhogIdleY);
        break;
       case MOVE_DOWN:
       //soil move
        if(allSoilY > 80*20*-1){
          allSoilY -= SPD;
        }
        
       //groundhog move
        if (groundhogIdleY < 160+80*24-groundhogWidth){
          image(groundhogDown,groundhogIdleX,groundhogIdleY);
          groundhogIdleY += SPD;
          if (groundhogIdleY % point == 0){
            moveState = MOVE_STOP;
          }
        }else{image(groundhogIdle,groundhogIdleX,160+80*24-groundhogWidth);}
        break;
       case MOVE_LEFT:
        if (groundhogIdleX>0){
          image(groundhogLeft,groundhogIdleX,groundhogIdleY);
          groundhogIdleX -= SPD;
          if (groundhogIdleX % point == 0){
            moveState = MOVE_STOP;
          }
        }else{image(groundhogIdle,0,groundhogIdleY);}
        break;
       case MOVE_RIGHT:
        if (groundhogIdleX < 640-groundhogWidth){
          image(groundhogRight,groundhogIdleX,groundhogIdleY);
          groundhogIdleX += SPD;
          if (groundhogIdleX % point == 0){
            moveState = MOVE_STOP;
          }
        }else{image(groundhogIdle,640-groundhogWidth,groundhogIdleY);}
        break;
      }
    popMatrix();
    // Health UI
    for (int i = 0; i < playerHealth; i ++){
    pushMatrix();
    translate(10, 10);
    image(life,70*i,0);
    popMatrix();
    }
    
    if(playerHealth==0){
      gameState=GAME_OVER;}
    
		break;

		case GAME_OVER: // Gameover Screen
		image(gameover, 0, 0);
		
		if(START_BUTTON_X + START_BUTTON_W > mouseX
	    && START_BUTTON_X < mouseX
	    && START_BUTTON_Y + START_BUTTON_H > mouseY
	    && START_BUTTON_Y < mouseY) {

			image(restartHovered, START_BUTTON_X, START_BUTTON_Y);
			if(mousePressed){
				gameState = GAME_RUN;
        playerHealth = 2;
        groundhogIdleX = 320;
        groundhogIdleY = 80;
        allSoilY = 0;
        pushMatrix();
        translate(0,allSoilY);
        popMatrix();
				mousePressed = false;
				// Remember to initialize the game here!
			}
		}else{

			image(restartNormal, START_BUTTON_X, START_BUTTON_Y);

		}
		break;
		
	}

    // DO NOT REMOVE OR EDIT THE FOLLOWING 3 LINES
    if (debugMode) {
        popMatrix();
    }
}

void keyPressed(){
	// Add your moving input code here
   if(key == CODED){
    if(groundhogIdleX%point==0 && groundhogIdleY%point==0)
    switch(keyCode){
      case DOWN:
      moveState = MOVE_DOWN;
      break;
      case RIGHT:
      moveState = MOVE_RIGHT;
      break;
      case LEFT:
      moveState = MOVE_LEFT;
      break;
    }
  }
	// DO NOT REMOVE OR EDIT THE FOLLOWING SWITCH/CASES
    switch(key){
      case 'w':
      debugMode = true;
      cameraOffsetY += 25;
      break;

      case 's':
      debugMode = true;
      cameraOffsetY -= 25;
      break;

      case 'a':
      if(playerHealth > 0) playerHealth --;
      break;

      case 'd':
      if(playerHealth < 5) playerHealth ++;
      break;
    }
}

void keyReleased(){
}
