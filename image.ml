(** Defining Pixel*)
type pixel = { 
  mutable red : int;
  mutable green : int;
  mutable blue : int;
};;

(** Defining Image *)
type image = {
  mutable id : string;
  mutable row : int;
  mutable col : int;
  mutable max_value : int;
  mutable body: pixel array array
};;

(** Empty image for tests purposes *)
let init = {
  id = "P3";
  row = 0;
  col = 0;
  max_value = 255;
  body = Array.make_matrix 0 0 {red = 0; green = 0; blue = 0}
};;

let read_image file_name img =
  let read_channel = open_in file_name in
  try
    img.id <- input_line read_channel;
    (** Transform  this in a list of strings *)
    img.row, img.col <- int_of_string input_line read_channel;
    img.max_value <- max_value;
    close_in read_channel
  with err -> close_in_noerr read_channel;
    raise err;;




