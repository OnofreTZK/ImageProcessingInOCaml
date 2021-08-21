open Types

module type Kernel = sig
    val apply : img:image -> mask:int array array -> curr_row:int -> curr_col:int -> (int * int * int)
end

module Default : Kernel = struct
    let apply ~img ~mask ~curr_row ~curr_col =
      let rec aux (r, g, b) row col =
        if row = 3 then (r, g, b)
        else if col = 3 then aux (r, g, b) (row+1) 0
        (* Conditions to avoid elements out of range *)
        else if (curr_row+row-1) = -1 || (curr_col+col-1) = -1 || (curr_row+row-1) = img.row || (curr_col+col-1) = img.col
             then aux (r, g, b) row (col+1)
        (* Imperative like?? *)
        else aux (r + (img.body.(curr_row-1+row).(curr_col-1+col).red*mask.(row).(col)),
                  g + (img.body.(curr_row-1+row).(curr_col-1+col).green*mask.(row).(col)), 
                   b + (img.body.(curr_row-1+row).(curr_col-1+col).blue*mask.(row).(col))) row (col+1)
      in
      aux (0, 0, 0) 0 0
end

module Blur : Kernel = struct
    let apply ~img ~mask ~curr_row ~curr_col =
      let rec aux (r, g, b) row col =
        if row = 3 then (r, g, b)
        else if col = 3 then aux (r, g, b) (row+1) 0
        (* Conditions to avoid elements out of range *)
        else if (curr_row+row-1) = -1 || (curr_col+col-1) = -1 || (curr_row+row-1) = img.row || (curr_col+col-1) = img.col
             then aux (r, g, b) row (col+1)
        (* Imperative like?? *)
        else aux (r + (img.body.(curr_row-1+row).(curr_col-1+col).red*mask.(row).(col))/9,
                  g + (img.body.(curr_row-1+row).(curr_col-1+col).green*mask.(row).(col))/9, 
                   b + (img.body.(curr_row-1+row).(curr_col-1+col).blue*mask.(row).(col))/9) row (col+1)
      in
      aux (0, 0, 0) 0 0
end

module Gauss : Kernel = struct
    let apply ~img ~mask ~curr_row ~curr_col =
      let rec aux (r, g, b) row col =
        if row = 5 then (r, g, b)
        else if col = 5 then aux (r, g, b) (row+1) 0
        (* Conditions to avoid elements out of range *)
        else if (curr_row+row-2) < 0 || (curr_col+col-2) < 0 || (curr_row+row-2) >= img.row || (curr_col+col-2) >= img.col
             then aux (r, g, b) row (col+1)
        (* Imperative like?? *)
        else aux (r + (img.body.(curr_row-2+row).(curr_col-2+col).red*mask.(row).(col))/256,
                  g + (img.body.(curr_row-2+row).(curr_col-2+col).green*mask.(row).(col))/256, 
                   b + (img.body.(curr_row-2+row).(curr_col-2+col).blue*mask.(row).(col))/256) row (col+1)
      in
      aux (0, 0, 0) 0 0
end

