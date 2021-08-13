open Image
open Menu

(* Initiating vars *)
let init_message = ">>> Initializing Image Processing...";;
let () = Printf.printf "%s\n" init_message;;

(* Veryfing argument *)
let () = if Array.length Sys.argv < 2 then Printf.printf ">>> Please, give a ppm image as an argument!\n"; exit 0;;

(* Passing file name *)
let ppm_image = Sys.argv.(1);;

let () = Printf.printf ">>> Input image: %s\n" ppm_image;;

(** First Image test *)
let test_image = Image.init;;

let () = Image.read_image ~input_file: ppm_image ~img: test_image;;
let () = Image.write_image ~img: test_image ~output_file: "test.ppm";;


(*TODO Implement menu*)
let () = Menu.print_menu;; 


