open Parameters
open Filters

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
let parse_entry img = function
  | Gray -> Filters.gray_scale img |> 
            fun () -> Image.write_image ~img: img ~output_file: "gray.ppm"
  | Thresholding -> Filters.gray_scale img |> 
                    fun () -> Filters.threshold img |>
                    fun () -> Image.write_image ~img: img ~output_file: "threshold.ppm"
  | Borders -> Printf.printf "Border Detection!\n"
  | Sobel -> Printf.printf "Border Detection with Sobel!\n"
  | Blurring -> Printf.printf "Blurring!\n"
  | Gauss -> Printf.printf "Blurring with Gauss!\n"
  | Sharpening -> Printf.printf "Sharpening!\n"
  | Rotate -> Printf.printf "Rotate Image!\n"
  | Grown -> Printf.printf "Grown Image!\n"
  | Reduce -> Printf.printf "Reduce Image!\n"
  | Exit -> ()
  | Help -> Printf.printf "%s\n%!" Parameters.str_menu
  | Void -> Printf.printf "Argumento inválido!\n"
;;

