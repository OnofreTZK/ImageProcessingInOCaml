open Image
open Parameters
open Scanf

(* Print menu *)
let print_menu = 
  Printf.printf "Choose the process:\n";
  Printf.printf "$ 'gry'\t->\tGray scale\n";
  Printf.printf "$ 'thr'\t->\tThresholding binarization\n";
  Printf.printf "$ 'brd'\t->\tBorder detector\n";
  Printf.printf "$ 'sbl'\t->\tSobel border detector\n";
  Printf.printf "$ 'blu'\t->\tBlurring\n";
  Printf.printf "$ 'gss'\t->\tGauss Blurring\n";
  Printf.printf "$ 'sha'\t->\tSharpening\n";
  Printf.printf "$ 'rot'\t->\tRotate image\n"; 
  Printf.printf "$ 'grw'\t->\tGrown image\n"; 
  Printf.printf "$ 'red'\t->\tReduce image\n";
  Printf.printf "$ 'ext'\t->\tExit\n%!"
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
  let () = print_menu in
  let ch = Scanning.stdin in
  let rec loop is_active cmd = 
    if not is_active then Printf.printf "Closing program...\n" (* Finishing program *)
    else if cmd = Exit then loop false cmd (* Finish program *)
    else if cmd = Void then loop true (Scanf.bscanf ch "%s" cmd_to_entry) (*void enter*)
    else loop true (Scanf.bscanf ch "%s" cmd_to_entry) in
  loop true (Scanf.bscanf ch "%s" cmd_to_entry)
;;
