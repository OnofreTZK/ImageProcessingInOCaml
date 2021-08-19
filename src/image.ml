open Types

(*************************************************************************************************)

(** Empty image for test purposes *)
let init = {
  id = "P3";
  row = 0;
  col = 0;
  max_value = 255;
  body = Array.make_matrix 0 0 {red = 0; green = 0; blue = 0}
}
;;

(*************************************************************************************************)

(** String to tuple -> row x col *)
let string_to_tuple ~str: str =
  let treate_str = String.split_on_char ' ' str in
  let vetor = Array.of_list treate_str in
  (int_of_string (Array.get vetor 0), int_of_string (Array.get vetor 1))
;;

(** Tuple to int *)
let tuple_to_int ~tuple: (row_value, col_value) ~idx: value_idx =
  if value_idx = 0 then row_value
  else col_value
;;

(** File to pixel list TODO*)
let file_to_list ~ch: channel ~list_size: row_by_col =
  let rec aux acc count =
    if count = row_by_col then acc
    else aux ({red = int_of_string (input_line channel); 
               green = int_of_string (input_line channel); 
               blue = int_of_string (input_line channel)} :: acc) (count+1) in
  List.rev (aux [] 0)
;;

(** Filling pixel matrix *)
let get_matrix_from_list ~row: row ~col: col ~pixel_list: ls = 
  let matrix = Array.make_matrix row col {red = 0; green = 0; blue = 0} in
  let rec aux acc row_count col_count lista =
    if row_count = row then acc
    else if col_count = col then aux acc (row_count+1) 0 lista
    else let () = acc.(row_count).(col_count) <- (List.hd lista) in 
      aux acc row_count (col_count+1) (List.tl lista) in
  aux matrix 0 0 ls
;;

(** Image parser *)
let read_image ~input_file: file_name ~img: img =
  let read_channel = open_in file_name in
  try  
    img.id <- input_line read_channel;
    let row_col_values = input_line read_channel in
    img.row <- tuple_to_int ~tuple: (string_to_tuple ~str:row_col_values) ~idx: 1;
    img.col <- tuple_to_int ~tuple: (string_to_tuple ~str:row_col_values) ~idx: 0;
    img.max_value <- int_of_string (input_line read_channel);
    let matrix_list = file_to_list ~ch: read_channel ~list_size: (img.row*img.col) in
    img.body <- get_matrix_from_list ~row: img.row ~col: img.col ~pixel_list: matrix_list;
    flush stdout;
    close_in read_channel;
    img;
  with err -> 
    close_in_noerr read_channel;
    raise err
;;

(*************************************************************************************************)

(** Write pixel *)
let write_pixel ~ch:channel ~px:pixel =
    Printf.fprintf channel "%d\n" pixel.red; 
    Printf.fprintf channel "%d\n" pixel.green;
    Printf.fprintf channel "%d\n" pixel.blue;;


(** Write matrix *)
let write_matrix ~ch: channel ~matrix: matrix ~row: row ~col: col =
  let rec aux row_count col_count =
    if row_count = row then ()
    else if col_count = col then aux (row_count+1) 0
    else let () = write_pixel ~ch: channel ~px: (matrix.(row_count).(col_count)) in
         aux row_count (col_count+1) in
  aux 0 0
;;



(** Write image *)
let write_image ~img: img ~output_file: file_name =
  let write_channel = open_out file_name in
    Printf.fprintf write_channel "%s\n" img.id;
    Printf.fprintf write_channel "%d %d\n" img.col img.row;
    Printf.fprintf write_channel "%d\n" img.max_value;
    let () = write_matrix ~ch: write_channel ~matrix: img.body ~row: img.row ~col: img.col in
    close_out write_channel
;;

(*************************************************************************************************)



