
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

(*************************************************************************************************)

(** Empty image for test purposes *)
let init = {
  id = "P3";
  row = 0;
  col = 0;
  max_value = 255;
  body = Array.make_matrix 0 0 {red = 0; green = 0; blue = 0}
};;

(*************************************************************************************************)

(** String to tuple -> row x col *)
let string_to_tuple str =
  let treate_str = String.split_on_char ' ' str in
  let vetor = Array.of_list treate_str in
  (int_of_string (Array.get vetor 0), int_of_string (Array.get vetor 1));;

(** Tuple to int *)
let tuple_to_int (row_value, col_value) value_idx =
  if value_idx = 0 then row_value
  else col_value;;

(** File to pixel list *)
let file_to_list channel row_by_col =
  let rec aux acc count =
    if count = row_by_col then acc
    else aux (({red = int_of_string (input_line channel); 
               green = int_of_string (input_line channel); 
               blue = int_of_string (input_line channel)}) :: acc) (count+1) in
  List.rev (aux [] 0);;

(** Filling pixel matrix *)
let get_matrix_from_file row col ls =
  let matrix = Array.make_matrix row col {red = 0; green = 0; blue = 0} in
  let rec aux acc row_count col_count lista =
    if row_count = row then acc
    else if col_count = col then aux acc (row_count+1) 0 lista
    else let () = acc.(row_count).(col_count) <- (List.hd lista) in 
      aux acc row_count (col_count+1) (List.tl lista) in
  aux matrix 0 0 ls;;

(** Image parser *)
let read_image file_name img =
  let read_channel = open_in file_name in
  try  
    img.id <- input_line read_channel;
    let row_col_values = input_line read_channel in
    img.row <- tuple_to_int (string_to_tuple row_col_values) 1;
    img.col <- tuple_to_int (string_to_tuple row_col_values) 0;
    img.max_value <- int_of_string (input_line read_channel);
    let matrix_list = file_to_list read_channel (img.row*img.col) in
    img.body <- get_matrix_from_file img.row img.col matrix_list;
    flush stdout;
    close_in read_channel;
  with err -> 
    close_in_noerr read_channel;
    raise err;;

(*************************************************************************************************)

(** Write pixel *)
let write_pixel channel pixel =
  Printf.fprintf channel "%d\n%d\n%d\n" pixel.red pixel.green pixel.blue;;


(** Write matrix *)
let write_matrix channel matrix row col =
  let rec aux row_count col_count =
    if row_count = row then ()
    else if col_count = col then aux (row_count+1) 0
    else let () = write_pixel channel matrix.(row_count).(col_count) in
         aux row_count (col_count+1) in
  aux 0 0;;



(** Write image *)
let write_image img file_name =
  let write_channel = open_out file_name in
    Printf.fprintf write_channel "%s\n" img.id;
    Printf.fprintf write_channel "%d %d\n" img.col img.row;
    Printf.fprintf write_channel "%d\n" img.max_value;
    let () = write_matrix write_channel img.body img.row img.col in
    close_out write_channel;;

(*************************************************************************************************)



