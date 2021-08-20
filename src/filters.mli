open Types

(* Gray Scale *)
val pixel_mean : pixel -> int

val gray_func : pixel -> unit

val gray_scale : image -> unit 

(* Thresholding *)
val sum_pixel : pixel -> int

val threshold_mean : pixel array array -> int -> int

val binarization : int -> int -> pixel -> unit

val threshold : image -> unit

(* Mask Filter *)
val apply_mask : img:image -> mask:int array array -> curr_row:int -> curr_col:int -> (int * int * int)

val filter : int array array -> image -> unit

(* Sharpening Images *)
val sharpening : image -> unit
