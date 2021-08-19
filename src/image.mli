open Types

val init : image

val string_to_tuple : str:string -> (int * int)

val tuple_to_int : tuple:(int * int) -> idx:int -> int

val file_to_list : ch:in_channel -> list_size:int -> pixel list

val get_matrix_from_list : row:int -> col:int -> pixel_list:pixel list -> pixel array array

val read_image : input_file:string -> img:image -> image

val write_pixel : ch:out_channel -> px:pixel -> unit

val write_matrix : ch:out_channel -> matrix:pixel array array -> row:int -> col:int -> unit

val write_image : img:image -> output_file:string -> unit
