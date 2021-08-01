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

(** String to tuple -> row x col *)
let string_to_tuple str =
  let treate_str = String.split_on_char ' ' str in
  let vetor = Array.of_list treate_str in
  (int_of_string (Array.get vetor 0), int_of_string (Array.get vetor 1));;

(** Tuple to ints *)
let tuple_to_ints (row_value, col_value) value_idx =
  if value_idx = 0 then row_value
  else col_value;;

(** Image parser *)
let read_image file_name img =
  let read_channel = open_in file_name in
  try  
    img.id <- input_line read_channel;
    let row_col_values = input_line read_channel in
    img.row <- tuple_to_ints (string_to_tuple row_col_values) 0;
    img.col <- tuple_to_ints (string_to_tuple row_col_values) 1;
    img.max_value <- int_of_string (input_line read_channel);
    flush stdout;
    close_in read_channel
  with err -> 
    close_in_noerr read_channel;
    raise err;




