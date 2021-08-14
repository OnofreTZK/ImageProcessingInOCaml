
(* Initial message *)
let print_init = Printf.printf ">>> Initializing Image Processing\n%!";;

(* Passing file name *)
let ppm_image = Sys.argv.(1);;

(* Printing input image *)
let print_input_image = Printf.printf ">>> Input image: %s\n" ppm_image;;

(* First Image test *)
let image = Image.read_image ~input_file: ppm_image ~img: Image.init;;
(*let () = Image.write_image ~img: test_image ~output_file: "test.ppm"*)

(* Menu *)
let init =
  print_init |>
  fun _ -> print_input_image |>
  fun _ -> Menu.init_menu;;

(* Veryfing argument *)
let () = if Array.length Sys.argv < 2 then Printf.printf ">>> Please, give a ppm image as an argument!\n%!" |> exit 0
    else init;;
