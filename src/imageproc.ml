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

let loop_cmd_control = 
  let rec loop is_active cmd = 
    if not is_active then Printf.printf "Closing program...\n" (* Finishing program *)
    else if cmd = Exit then loop false cmd (* Finish program *)
    else if cmd = Void then loop true (read_line () |> Commands.cmd_to_entry) (*void enter*)
    else Commands.parse_entry cmd |> fun () -> loop true (read_line () |> Commands.cmd_to_entry) in
  loop true (read_line () |> Commands.cmd_to_entry)
;;

(* Menu *)
let init validator =
  match validator with
    | true -> Printf.printf ">>> Please, give a ppm image as an argument!\n%!"
    | false -> Printf.printf "%s\n%!" str_init |> fun () -> Printf.printf "%s\n%!" Parameters.str_menu |>
               fun () -> loop_cmd_control
;;

let () = init verify_args;;
