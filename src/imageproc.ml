
(* Initial message *)
let print_init = Printf.printf ">>> Initializing Image Processing\n%!";;

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
  match validator with
    | true -> Printf.printf ">>> Please, give a ppm image as an argument!\n%!" |> exit 0
    | false -> print_init |> fun () -> Printf.printf "Test\n"(*fun () -> Menu.init_menu*)
;;

let () = init verify_args;;
