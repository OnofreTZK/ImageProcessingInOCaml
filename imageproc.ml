open Image

(** Initiating vars *)
let init_message = "Init Image Processing..."
let () = Printf.printf "%s\n" init_message 

(** Passing file name *)
let ppm_image_file_name = Array.get Sys.argv 1;;
let () = Printf.printf "%s\n" ppm_image_file_name

(** First Image test *)
let test_image = Image.init;;

let () = Image.read_image ppm_image_file_name test_image;;

let () = Image.write_image test_image "test.ppm"




