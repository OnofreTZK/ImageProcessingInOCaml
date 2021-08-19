(** Defining Pixel*)
type pixel = { 
  mutable red : int;
  mutable green : int;
  mutable blue : int;
}
;;

(** Defining Image *)
type image = {
  mutable id : string;
  mutable row : int;
  mutable col : int;
  mutable max_value : int;
  mutable body: pixel array array
}
;;

