open Parameters
open Scanf

(* Menu String*)
let print_menu = 
  "Choose the process:\n" ^
  "$ 'gry'\t->\tGray scale\n" ^
  "$ 'thr'\t->\tThresholding binarization\n" ^
  "$ 'brd'\t->\tBorder detector\n" ^
  "$ 'sbl'\t->\tSobel border detector\n" ^
  "$ 'blu'\t->\tBlurring\n" ^
  "$ 'gss'\t->\tGauss Blurring\n" ^
  "$ 'sha'\t->\tSharpening\n" ^
  "$ 'rot'\t->\tRotate image\n" ^ 
  "$ 'grw'\t->\tGrown image\n" ^
  "$ 'red'\t->\tReduce image\n" ^
  "$ 'ext'\t->\tExit\n"
;;

(* Entries *)
let cmd_to_entry = function
  | "gry" -> Gray 
  | "thr" -> Thresholding
  | "brd" -> Borders
  | "sbl" -> Sobel
  | "blu" -> Blurring
  | "gss" -> Gauss
  | "sha" -> Sharpening
  | "rot" -> Rotate
  | "grw" -> Grown
  | "red" -> Reduce
  | "ext" -> Exit
  | _ -> Void
;;


(* Proccess selection *)
let parse_entry = function
  | Gray -> Printf.printf "Gray Scale!\n"
  | Thresholding -> Printf.printf "Thresholding!\n"
  | Borders -> Printf.printf "Border Detection!\n"
  | Sobel -> Printf.printf "Border Detection with Sobel!\n"
  | Blurring -> Printf.printf "Blurring!\n"
  | Gauss -> Printf.printf "Blurring with Gauss!\n"
  | Sharpening -> Printf.printf "Sharpening!\n"
  | Rotate -> Printf.printf "Rotate Image!\n"
  | Grown -> Printf.printf "Grown Image!\n"
  | Reduce -> Printf.printf "Reduce Image!\n"
  | Exit -> Printf.printf "Exiting...\n"
  | Void -> Printf.printf "\n"
;;

(* Function to control menu loop *)
let init_menu =
  let () = Printf.printf "%s\n%!" print_menu in
  let ch = Scanning.stdin in
  let rec loop is_active cmd = 
    if not is_active then Printf.printf "Closing program...\n" (* Finishing program *)
    else if cmd = Exit then loop false cmd (* Finish program *)
    else if cmd = Void then loop true (Scanf.bscanf ch "%s" cmd_to_entry) (*void enter*)
    else loop true (Scanf.bscanf ch "%s" cmd_to_entry) in
  loop true (Scanf.bscanf ch "%s" cmd_to_entry)
;;
