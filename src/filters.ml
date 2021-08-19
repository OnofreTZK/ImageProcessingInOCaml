open Types

(* Gray Scale Proccess *)
(**************************************************************************************************)
let pixel_mean px =
  truncate ((0.3 *. float_of_int px.red) +. (0.59 *. float_of_int px.green) +. (0.11 *. float_of_int px.blue))
;;

let gray_func px =
  let mean = pixel_mean px in
  px.red <- mean;
  px.green <- mean;
  px.blue <- mean;
  ();
;;

let gray_scale img =
  img.body |> Array.iter (Array.iter gray_func)
;;
(**************************************************************************************************)

(* Thresholding Proccess *)
(**************************************************************************************************)
let sum_pixel px =
  px.red + px.green + px.blue;
;;

let threshold_mean matrix values =
  let acc = Array.fold_left (fun sum arr -> sum + Array.fold_left (
      fun sum px -> sum + sum_pixel px) 0 arr) 0 matrix in
  acc/values
;;


let binarization mean max px =
  let fill_px value =
    px.red <- value;
    px.green <- value;
    px.blue <- value;
    ()
  in
  if px.red > mean then fill_px max
  else fill_px 0
;;


let threshold img =
  let mean = threshold_mean img.body (img.row*img.col*3) in
  img.body |> Array.iter (Array.iter (binarization mean img.max_value) )
;;
(**************************************************************************************************)

