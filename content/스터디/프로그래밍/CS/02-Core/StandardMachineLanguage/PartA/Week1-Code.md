# ML Expression and Variable Bindings
```sml
(* Programming Languages, Dan Grossman *)
(* Section 1: Our first ML program *)

(* val is a keyword
   x is a variable name
   = is used as a keyword here (has different meaning in expressions)
   34 is a very simple expression (and value)
   ; is used as a keyword here (has different meaning in expressions)
 *)
val x = 34;
(* static environment: x-->int *)
(* dynamic environment: x-->34 *)

val y = 17;
(* static environment: y-->int, x-->int *)
(* dynamic environment: y-->17, x-->34 *)

(* to evaluate an addition, evaluate the subexpressions and add *)
(* to evaluate a variable, lookup its value in the environment  *)

val z = (x + y) + (y + 2);
(* static environment: z-->int, y-->int, x-->int *)
(* dynamic environment: z-->70, y-->17, x-->34 *)

val q = z+1;
(* static environment: q-->int, z-->int, y-->int, x-->int *)
(* dynamic environment: q-->71, z-->70, y-->17, x-->34 *)
 
val abs_of_z = if z < 0 then 0 - z else  z;
(* static environment: abs_of_z-->int, q-->int, z-->int, y-->int, x-->int *)
(* dynamic environment: abs_of_z-->70, q-->71, z-->70, y-->17, x-->34 *)
 
val abs_of_z_simpler = abs z;
```

# The REPL and Errors
## error
```sml
(* Programming Languages, Dan Grossman *)
(* Section 1: Some Errors *)

(* This program has several errors in it so we can try to debug them. *)

val x = 34

y = x + 1

val z = if y then 34 else x < 4 (*return type이 틀림. int와 bool로 되어있음*)

val q = if y > 0 then 0

val a = -5 (*syntax가 맞지 않음. Negation는 ~*)

val w = 0

val fun = 34

val v = x / w

val fourteen = 7 - 7
```

## error fixed
```sml
(* Programming Languages, Dan Grossman *)
(* Section 1: Some Errors *)

(* This program has several errors in it so we can try to debug them. *)

val x = 34

val y = x + 1

val z = if y > 0 then false else x < 4

val q = if y > 0 then 0 else 42

val a = ~5

val w = 0

val funny = 34

val v = x div (w + 1)

val fourteen = 7 + 7
```

# Shadowing
```sml
(* Programming Languages, Dan Grossman *)
(* Section 1: Examples to Demonstrate Shadowing *)

val a = 10

val b = a * 2

val a = 5

val c = b

val d = a

val a = a + 1

(* next line does not type-check, f not in environment *)
(* val g = f - 3  *)

val f = a * 2
```

# Functions Informally
```sml
(* Programming Languages, Dan Grossman *)
(* Section 1: simple functions *)

(* this function correct only for y >= 0 *)
fun pow (x:int, y:int) = 
    if y=0
    then 1
    else x * pow(x,y-1)

fun cube (x:int) =
    pow(x,3)

val sixtyfour = cube(4)

val fortytwo = pow(2,2+2) + pow(4,2) + cube(2) + 2
```


# Pairs and Other Tuples
```sml
(* Programming Languages, Dan Grossman *)
(* Section 1: Pairs and Tuples *)

(* pairs *)

fun swap (pr : int*bool) =
    (#2 pr, #1 pr)

fun sum_two_pairs (pr1 : int*int, pr2 : int*int) =
    (#1 pr1) + (#2 pr1) + (#1 pr2) + (#2 pr2)

    (* returning a pair a real pain in Java *)
fun div_mod (x : int, y : int) = 
    (x div y, x mod y)

fun sort_pair (pr : int*int) =
    if (#1 pr) < (#2 pr)
    then pr
    else (#2 pr, #1 pr) 

(* nested pairs *)

val x1 = (7,(true,9)) (* int * (bool*int) *)

val x2 = #1 (#2 x1)  (* bool *)

val x3 = (#2 x1)      (* bool*int *)

val x4 = ((3,5),((4,8),(0,0))) (* (int * int) * ((int * int) * (int * int)) *)
```

# Introducing Lists
```sml
- [];
val it = [] : 'a list
- [3,4,5];
val it = [3,4,5] : int list
- [4,3];
val it = [4,3] : int list
- [3,4,5,6];
val it = [3,4,5,6] : int list
- [(1+2),3+4,7];
val it = [3,7,7] : int list
- [true,false,true];
val it = [true,false,true] : bool list
- [3,4+5,true];
stdIn:7.1-7.13 Error: operator and operand don't agree [literal]
  operator domain: int * int list
  operand:         int * bool list
  in expression:
    4 + 5 :: true :: nil
- 4+true;
stdIn:1.2-2.3 Error: operator and operand don't agree [literal]
  operator domain: int * int
  operand:         int * bool
  in expression:
    4 + true
- val x = [7,8,9];
val x = [7,8,9] : int list
- x;
val it = [7,8,9] : int list
- 5::x;
val it = [5,7,8,9] : int list
- 6::5::x;
val it = [6,5,7,8,9] : int list
- [6]::x;
stdIn:11.1-11.7 Error: operator and operand don't agree [tycon mismatch]
  operator domain: int list * int list list
  operand:         int list * int list
  in expression:
    (6 :: nil) :: x
- 6::x;
val it = [6,7,8,9] : int list
- [6]::[[7,5],[5,2]];
val it = [[6],[7,5],[5,2]] : int list list
- null x;
val it = false : bool
- x;
val it = [7,8,9] : int list
- null [];
val it = true : bool
- val y = [];
val y = [] : 'a list
- null y;
val it = true : bool
- hd x;
val it = 7 : int
- x;
val it = [7,8,9] : int list
- tl x;
val it = [8,9] : int list
- hd (tl x);
val it = 8 : int
- tl (tl x);
val it = [9] : int list
- tl (tl (tl x));
val it = [] : int list
- tl (tl (tl (tl x)));

uncaught exception Empty
  raised at: smlnj/init/pervasive.sml:211.19-211.24
- hd (tl (tl (tl x)));

uncaught exception Empty
  raised at: smlnj/init/pervasive.sml:209.19-209.24
- [(3,4),(5,6)];
val it = [(3,4),(5,6)] : (int * int) list
- 3::it;
stdIn:25.1-25.6 Error: operator and operand don't agree [literal]
  operator domain: int * int list
  operand:         int * (int * int) list
  in expression:
    3 :: it
- (1,2)::it;
val it = [(1,2),(3,4),(5,6)] : (int * int) list
- [];
val it = [] : 'a list
- 3::[];
val it = [3] : int list
- true::[];
val it = [true] : bool list
- null;
val it = fn : 'a list -> bool
- null [3,4];
val it = false : bool
- null [true,false];
val it = false : bool
- hd;
val it = fn : 'a list -> 'a
- hd [3,4];
val it = 3 : int
- hd [true,false];
val it = true : bool
- tl;
val it = fn : 'a list -> 'a list
- tl [3,4];
val it = [4] : int list
```

# List Functions
```sml
(* Programming Languages, Dan Grossman *)
(* Section 1: List Functions *)

(* Functions taking or producing lists *)

fun sum_list (xs : int list) =
    if null xs
    then 0
    else hd(xs) + sum_list(tl(xs))

fun countdown (x : int) =
    if x=0
    then []
    else x :: countdown(x-1)

fun append (xs : int list, ys : int list) = (* part of the course logo :) *)
    if null xs
    then ys
    else hd(xs) :: append(tl(xs), ys)

(* More functions over lists, here lists of pairs of ints *)

fun sum_pair_list (xs : (int * int) list) =
    if null xs
    then 0
    else #1 (hd(xs)) + #2 (hd(xs)) + sum_pair_list(tl(xs))

fun firsts (xs : (int * int) list) =
    if null xs
    then []
    else (#1 (hd xs))::(firsts(tl xs))

fun seconds (xs : (int * int) list) =
    if null xs
    then []
    else (#2 (hd xs))::(seconds(tl xs))

fun sum_pair_list2 (xs : (int * int) list) =
    (sum_list (firsts xs)) + (sum_list (seconds xs))
```

# Let Expressions
```sml
(* Programming Languages, Dan Grossman *)
(* Section 1: Let Expressions *)

fun silly1 (z : int) =
    let val x = if z > 0 then z else 34
	val y = x+z+9
    in
	if x > y then x*2 else y*y
    end

fun silly2 () =
    let val x = 1 
    in 
	(let val x = 2 in x+1 end) + (let val y = x+2 in y+1 end)
    end
```

# Nested Functions
```sml
(* Programming Languages, Dan Grossman *)
(* Section 1: Nested Functions *)

fun countup_from1 (x : int) =
    let fun count (from:int, to:int) =
	    if from=to
	    then to::[] (* note: can also write [to] *)
	    else from :: count(from+1,to)
    in
	count(1,x)
    end

fun countup_from1_better (x : int) =
    let fun count (from:int) =
	    if from=x
	    then x::[]
	    else from :: count(from+1)
    in
	count 1
    end
```

# Let and Efficiency

```sml
(* Programming Languages, Dan Grossman *)
(* Section 1: Let Expressions to Avoid Repeated Computation *)

(* badly named: evaluates to 0 on empty list *)
fun bad_max (xs : int list) =
    if null xs
    then 0
    else if null (tl xs)
    then hd xs
    else if hd xs > bad_max(tl xs)
    then hd xs
    else bad_max(tl xs)

(* badly named: evaluates to 0 on empty list *)
fun good_max (xs : int list) =
    if null xs
    then 0
    else if null (tl xs)
    then hd xs
    else
	(* for style, could also use a let-binding for (hd xs) *)
	let val tl_ans = good_max(tl xs)
	in
	    if hd xs > tl_ans
	    then hd xs
	    else tl_ans
	end

fun countup(from : int, to : int) =
    if from=to
    then to::[]
    else from :: countup(from+1,to)

fun countdown(from : int, to : int) =
    if from=to
    then to::[]
    else from :: countdown(from-1,to)
```

# Options
```sml
(* Programming Languages, Dan Grossman *)
(* Section 1: Options *)

(* badly named: evaluates to 0 on empty list *)
fun old_max (xs : int list) =
    if null xs
    then 0
    else if null (tl xs)
    then hd xs
    else
	let val tl_ans = old_max(tl xs)
	in
	    if hd xs > tl_ans
	    then hd xs
	    else tl_ans
	end

(* better: returns an int option *)
fun max1 (xs : int list) =
    if null xs
    then NONE
    else 
	let val tl_ans = max1(tl xs)
	in if isSome tl_ans andalso valOf tl_ans > hd xs
	   then tl_ans
	   else SOME (hd xs)
	end

(* looks the same as max1 to clients; 
   implementation avoids valOf *)
fun max2 (xs : int list) =
    if null xs
    then NONE
    else let (* fine to assume argument nonempty because it is local *)
	fun max_nonempty (xs : int list) =
		if null (tl xs) (* xs better not be [] *)
		then hd xs
		else let val tl_ans = max_nonempty(tl xs)
		     in
			 if hd xs > tl_ans
			 then hd xs
			 else tl_ans
		     end
	in
	    SOME (max_nonempty xs)
	end
```

#StandardMachineLanguage 