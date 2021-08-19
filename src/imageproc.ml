open Parameters

(* Initial message *)
let str_init = ">>> Initializing Image Processing\n";;

(* Passing file name *)
(* Instancing image *)
let init_image ppm_image = 
  Image.read_image ~input_file: ppm_image ~img: Image.init
;;

(* Veryfing argument *)
let verify_args = (Array.length Sys.argv) < 2;; 

(* Menu *)
let init validator =
  let loop_cmd_control parse_input parse_entry img = 
    let rec loop cmd = (* Menu loop *)
      if cmd = Exit then Printf.printf "Closing program...\n" (* Finish program *)
      else parse_entry img cmd |> fun () -> loop (Scanf.scanf "%s\n" parse_input) in (* Rest of inputs *)
    loop (Scanf.scanf "%s\n" parse_input)
  in
  match validator with
    | true -> Printf.printf ">>> Please, give a ppm image as an argument!\n%!"
    | false -> Printf.printf "%s\n%!" str_init |> fun () -> Printf.printf "%s\n%!" Parameters.str_menu |>
              fun () -> init_image Sys.argv.(1) |> 
              loop_cmd_control Commands.cmd_to_entry Commands.parse_entry
;;

let () = init verify_args;;
