type entries = 
  | Gray 
  | Thresholding
  | Borders
  | Sobel
  | Blurring
  | Gauss
  | Sharpening
  | Rotate
  | Grown
  | Reduce
  | Exit
  | Help
  | Void

(* Menu String*)
let str_menu = 
  "Choose the process:\n" ^
  "$ 'gry'\t->\tGray scale\n" ^
  "$ 'thr'\t->\tThresholding binarization\n" ^
  "$ 'brd'\t->\tBorder detector\n" ^
  "$ 'sbl'\t->\tSobel border detector\n" ^
  "$ 'blu'\t->\tBlurring\n" ^
  "$ 'gss'\t->\tGauss Blurring\n" ^
  "$ 'sha'\t->\tSharpening\n" ^
  "$ 'rot'\t->\tRotate image\n" ^ 
  "$ 'grw'\t->\tGrown image\n" ^
  "$ 'red'\t->\tReduce image\n" ^
  "$ 'h'\t->\tPrint this menu again\n" ^
  "$ 'ext'\t->\tExit\n"
;;
