type pixel = { 
  mutable red : int;
  mutable green : int;
  mutable blue : int;
};;

type image = {
  id : string;
  mutable row : int;
  mutable col : int;
  max_value : int;
  mutable body: pixel array array
};;


let init = {
  id = "P3";
  row = 0;
  col = 0;
  max_value = 255;
  body = Array.make_matrix 0 0 {red = 0; green = 0; blue = 0}
};;



