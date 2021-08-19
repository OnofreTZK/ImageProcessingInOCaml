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
