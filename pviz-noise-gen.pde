int sq = 25; //width of "pixel" desired in actual pixels
int[] shade = {204, 153, 255}; //rgb of shade
float thresh = 0.2; //threshold of brightness 
PImage target;
Boolean saveYN = true; //if saving is desired
String file = "noiseGend.png"; //desired file name



void setup(){
  size(1000,1000);
  int w = width;
  int h = height;
  background(0);
  target = createImage(w, h, ARGB);
  target.loadPixels();

  for(int j=0; j<(h*w);j+=(w*sq)){
    for(int i=0; i<w; i+=sq){
      int randA = int(random(255*thresh)+0.5);
      color pick = color(shade[0], shade[1],shade[2], randA);
        for(int n=0; n<sq; n++){
           for(int m=0; m<sq; m++){
             int x = i+m;
             int y = j+(n*w);
              if((x+y)<(w*h)){
                  target.pixels[x+y] = pick;
                 // println(x+y);
              }
           }
        }
    }
  }
  
 target.updatePixels();
 image(target, 0, 0);
 if(saveYN){
   save(file);
 };
}

void draw(){
  
  
}
