
int W = 800;
int H = 800;

int step = 50;
int[] rgb;
int k, index;


gradient[] diagonal = new gradient[floor(W/step)];
gradient[] topRow = new gradient[floor(W/step)];
gradient[] bottomRow = new gradient[floor(W/step)];

boolean flag = false;
boolean dispNums=  false;

void settings(){

  size(W,H);
}

void setup(){

  rgb = new int[3];
  
  defineColors();
  
  rgb[0] = 0;//int(random(0,255));//0;
  rgb[1] = 0;//int(random(0,255));
  rgb[2] = 0;//int(random(0,255));
  
  colorMode(RGB, 255);
}

void draw(){
k = 0;
index = 0;
noStroke();

for(int i = 0; i < width; i+=step){
    
    for(int j = 0; j < height; j+=step){
      
      
      rgb[0] = int(map(k, 0, (W/step)*(H/step),0,255));
      rgb[1] = int(map(j, height,0, 0, 255)); 
      rgb[2] = int(map(i, width,0, 0, 255)); 
      
        
      fill(rgb[0],rgb[1],rgb[2]);
      rect(i, j, step, step);
        
      if(i == j){ 
        diagonal = fillColors(index,rgb, diagonal);
        index++;
      }
      
      if(j == 0){
        
        topRow = fillColors(i/step,rgb, topRow);
      
      }
      
      if(i == 0){
      
        
      }
      
      if(dispNums){
      
      displayNumbers(i,j);
      
      }
      
      //print("k = " + k);
      //println(";i = " + i/step, ";j = " + j/step);
     
      k++;
      
    } 
    
    bottomRow = fillColors(i/step,rgb, bottomRow);
    
    
    
  }
  
  if(!flag){
    
    println("Diagonal colors: ");
    for(int i = 0; i < diagonal.length; i++){
      println("r = " + diagonal[i].r, "; g = " + diagonal[i].g, "; b = " + diagonal[i].b);
    }
    
    println("Top Row colors: ");
    for(int i = 0; i < topRow.length; i++){
      println("r = " + topRow[i].r, "; g = " + topRow[i].g, "; b = " + topRow[i].b);
    }
    
     println("Bottom Row colors: ");
    for(int i = 0; i < bottomRow.length; i++){
      println("r = " + bottomRow[i].r, "; g = " + bottomRow[i].g, "; b = " + bottomRow[i].b);
    }
    flag = true;
  }
  
  
}

void defineColors(){

  for(int i=0; i < diagonal.length;i++){
    diagonal[i] = new gradient(0,0,0);
   
  }
   for(int i=0; i < topRow.length;i++){  
    topRow[i] = new gradient(0,0,0);
  }
  
    for(int i=0; i < topRow.length;i++){  
    bottomRow[i] = new gradient(0,0,0);
  }

}

gradient[] fillColors(int i, int[] cols, gradient[] arr){
    
  
    arr[i].r = cols[0]; 
    arr[i].g = cols[1];
    arr[i].b = cols[2];
    
    return arr;
    
}

void mousePressed(MouseEvent event){
   dispNums = !dispNums;
}

void displayNumbers(int i, int j){
      push();
      fill(0);
      textAlign(RIGHT,RIGHT);
      text(str(k), i+step, j+step);
      pop();

}
