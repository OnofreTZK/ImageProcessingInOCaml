open Types
open Kernel

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



(* Mask Filter Functions *)
(**************************************************************************************************)
let filter mask img f =
  let fix_color_value color =
    if color < 0 then 0
    else if color > img.max_value then img.max_value
    else color
  in
  let fill_px row col (r, g, b) =
    img.body.(row).(col).red <- (fix_color_value r);
    img.body.(row).(col).green <- (fix_color_value g);
    img.body.(row).(col).blue <- (fix_color_value b);
    ()
  in
  let rec aux row col =
    if row = img.row then ()
    else if col = img.col then aux (row+1) 0
    else fill_px row col (f ~img ~mask ~curr_row:row ~curr_col:col) |> fun () -> aux row (col+1) 
  in
  aux 0 0
;;

(**************************************************************************************************)

(* Blurring Proccess *)
(**************************************************************************************************)
let blurring img =
  let mask = [| [|1; 1; 1 |]; 
                [|1; 1; 1 |];
                [|1; 1; 1 |] |]
  in
  filter mask img Blur.apply
;;
(**************************************************************************************************)

(* Sharpening Proccess *)
(**************************************************************************************************)
let sharpening img =
  let mask = [| [|0; -1; 0 |]; 
                [|-1; 5; -1|];
                [|0; -1; 0 |] |]
  in
  filter mask img Default.apply
;;
(**************************************************************************************************)

(* Bordering Proccess *)
(**************************************************************************************************)
let bordering img =
  let mask = [| [|-1; -1; -1|]; 
                [|-1; 8; -1 |];
                [|-1; -1; -1|] |]
  in
  filter mask img Default.apply
;;
(**************************************************************************************************)

(* Gauss Proccess *)
(**************************************************************************************************)
let gauss img =
  let mask = [| [|1; 4; 6; 4; 1   |]; 
                [|4; 16; 24; 16; 4|];
                [|6; 24; 36; 14; 6|];
                [|4; 16; 24; 16; 4|];
                [|1; 4; 6; 4; 1   |] |]
  in
  filter mask img Gauss.apply
;;
(**************************************************************************************************)
