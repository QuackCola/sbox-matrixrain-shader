PFont MatrixFont; // global variable with font
String Filename = "letters.tif"; // Specify the output filename and type

void settings() {
  size(1024, 1024); // tiling texture size
}

void setup() {  
  blendMode(ADD); 
  background(0);
  noLoop(); // We need only one frame
  MatrixFont = createFont("matrix code nfi.ttf", 20); // size is 92
  textFont(MatrixFont);
  textAlign(CENTER, CENTER);
}
void draw() {
  int gap = 16; // distance beetwen letters
  for (int y = gap; y < height; y += gap) {
    for (int x = gap; x < width; x += gap) {
      drawMatrixLetter(x, y);
    }
  }
  for (int x = 0; x <= width; x += gap) {
    char letter =  randomChar();
    fillLet();
    text(letter, x, 0);
    text(letter, x, height);
  }
  for (int y = gap; y < height; y += gap) {
    char letter = randomChar();
    fillLet();
    text(letter, 0, y);
    text(letter, width, y);
  }
  saveFrame(Filename);
}
void fillLet() {
  color letterColor = (255-(int)random(127));
  fill(letterColor, letterColor, letterColor);
}
void drawMatrixLetter(int x, int y) {
  //chosing random char
  char letter = char(45+(byte)random(105));
  fillLet();
  text(letter, x, y);
}
char randomChar() {
  char letter = char(45+(byte)random(105));
  return letter;
}
