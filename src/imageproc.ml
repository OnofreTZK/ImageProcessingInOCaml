open Parameters

(* Initial message *)
let str_init = ">>> Initializing Image Processing\n";;

(* Passing file name *)
(* Instancing image *)
let image ppm_file_name = let ppm_image = ppm_file_name in
  let () = Printf.printf ">>> Input image file: %s\n" ppm_image in
  Image.read_image ~input_file: ppm_image ~img: Image.init;;
(*let () = Image.write_image ~img: test_image ~output_file: "test.ppm"*)

(* Veryfing argument *)
let verify_args = (Array.length Sys.argv) < 2;; 

(* Menu *)
let init validator =
  let loop_cmd_control parse_func = 
    let rec loop cmd =
      if cmd = Exit then Printf.printf "Closing program...\n" (* Finish program *)
      else Commands.parse_entry cmd |> fun () -> loop (Scanf.scanf "%s\n" parse_func) in (* Rest of inputs *)
    loop (Scanf.scanf "%s\n" parse_func)
  in
  match validator with
    | true -> Printf.printf ">>> Please, give a ppm image as an argument!\n%!"
    | false -> Printf.printf "%s\n%!" str_init |> fun () -> Printf.printf "%s\n%!" Parameters.str_menu |>
               fun () -> loop_cmd_control Commands.cmd_to_entry
;;

let () = init verify_args;;
