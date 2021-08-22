open Types
open Kernel

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
val filter : int array array -> image ->
  (img:image -> mask:int array array -> curr_row:int -> curr_col:int -> (int * int * int)) -> unit

(* Blurring *)
val blurring : image -> unit

(* Sharpening *)
val sharpening : image -> unit

(* Bordering *)
val bordering : image -> unit

(* Gauss Blurring *)
val gauss : image -> unit

(* Sobel Operator *)
val vertical_horizontal_kernel : img:image -> curr_row:int -> curr_col:int -> (int * int)

val sobel : image -> unit

