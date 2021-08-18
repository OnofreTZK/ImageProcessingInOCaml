open Parameters
open Scanf

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
  | "h" -> Help
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
  | Help -> Printf.printf "%s\n" Parameters.str_menu
  | Void -> Printf.printf "\n"
;;

(* Function to control menu loop *)
(* TODO refactor to eliminate all the boilerplate *)
(*let init_cmd_control = 
  let rec loop is_active cmd = 
    if not is_active then Printf.printf "Closing program...\n" (* Finishing program *)
    else if cmd = Exit then loop false cmd (* Finish program *)
    else if cmd = Void then loop true (Scanf.scanf "%s\n" cmd_to_entry) (*void enter*)
    else parse_entry cmd |> fun () -> loop true (Scanf.scanf "%s\n" cmd_to_entry) in
  loop true (Scanf.scanf "%s\n" cmd_to_entry)
;;*)
