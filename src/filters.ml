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



(* Mask Filter Functions *)
(**************************************************************************************************)
let apply_mask ~img ~mask ~curr_row ~curr_col ~len =
  let rec aux (r, g, b) row col =
    if row = len then (r, g, b)
    else if col = len then aux (r, g, b) (row+1) 0
    (* Conditions to avoid elements out of range *)
    else if (curr_row+row-1) = -1 || (curr_col+col-1) = -1 || (curr_row+row-1) = img.row || (curr_col+col-1) = img.col
         then aux (r, g, b) row (col+1)
    (* Imperative like?? *)
    else aux (r + (img.body.(curr_row-1+row).(curr_col-1+col).red*mask.(row).(col)),
              g + (img.body.(curr_row-1+row).(curr_col-1+col).green*mask.(row).(col)), 
               b + (img.body.(curr_row-1+row).(curr_col-1+col).blue*mask.(row).(col))) row (col+1)
  in
  aux (0, 0, 0) 0 0
;;


let filter mask img len =
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
    else fill_px row col (apply_mask ~img ~mask ~curr_row:row ~curr_col:col ~len) |> fun () -> aux row (col+1) 
  in
  aux 0 0
;;

(**************************************************************************************************)

(* Sharpening Proccess *)
(**************************************************************************************************)
let sharpening img =
  let mask = [| [|0; -1; 0 |]; 
                [|-1; 5; -1|];
                [|0; -1; 0 |] |]
  in
  filter mask img (Array.length mask)
;;
(**************************************************************************************************)
