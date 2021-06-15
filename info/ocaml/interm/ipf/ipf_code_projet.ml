(* Sequences genetiques *)

(* une nucleotide est crée soit avec A, C, G ou T *)
type nucleotide = A | C | G | T
;;

(* séquence de nucléotides *)
type brin = nucleotide list
;;

(** Question 1 **)

(*
Takes a brin and returns the number of C and G

@see nucleotide
@see brin

@param x a brin
@return a float, the number of C and G

@tests
let _ = assert((contenu_gc [A;T;G;T;T;G;A;C]) = 0.375);;
let _ = assert((contenu_gc [C;T;T;A]) = 0.25);;
let _ = assert((contenu_gc [A;A;A;T;A]) = 0.0);;
*)
let contenu_gc (x : brin) : float =
  (* we increase the score by 1 each time we found
  a C or G. Then check the reste of the brin. If there is nothing
  more to check, then we process and evaluate the gc content. *)
  let rec acc (b : brin) (score : float) (size: float) = match b with
    | [] -> score /. size
    | first::other ->
        acc other
          (if (first = C || first = G) then score+.1.0 else score)
          (size +. 1.0) (* increase size, we could use List.length
                        but why would we if we already iterated the list
                        once *)
  in acc x 0.0 0.0 (* start with score=0 and size=0 *)
;;

let _ = assert((contenu_gc [A;T;G;T;T;G;A;C]) = 0.375);;
let _ = assert((contenu_gc [C;T;T;A]) = 0.25);;
let _ = assert((contenu_gc [A;A;A;T;A]) = 0.0);;


(** Question 2 **)

(*
Do the complementaire of a Brin.
@see nucleotide
@see brin

@param x a brin
@return a brin, inverted

@tests
let _ = assert((brin_complementaire [T]) = [A]) ;;
let _ = assert((brin_complementaire [C; T; T; C]) = [G; A; A; G]) ;;
let _ = assert((brin_complementaire [C; T; A; A; T; G; T]) = [G; A; T; T; A; C; A]) ;;
*)
let brin_complementaire (x : brin) : brin =
  (*
    Invert the value of a nucleoitide and
    add the result to inverted.
    Called until the inverted everthing.
  *)
  let rec acc (b : brin) (inverted: brin) = match b with
    | A::other -> acc other (T::inverted)
    | T::other -> acc other (A::inverted)
    | C::other -> acc other (G::inverted)
    | G::other -> acc other (C::inverted)
    | [] -> inverted
  in List.rev (acc x []) (* invert the order *)
;;

let _ = assert((brin_complementaire [T]) = [A]) ;;
let _ = assert((brin_complementaire [C; T; T; C]) = [G; A; A; G]) ;;
let _ = assert((brin_complementaire [C; T; A; A; T; G; T]) = [G; A; T; T; A; C; A]) ;;


(** Question 3 **)

(*
Returns the number of nucleotides that must
be changed between x and y so that they become the same brin.

@exception if the length x is not the same as the length of y

@see nucleotide
@see brin

@param x a brin
@param y a brin

@tests
let _ = assert(distance [T] [T] = 0) ;;
let _ = assert(distance [T] [C] = 1) ;;
let _ = assert(distance [G; A; G] [A; G; G] = 2);;
let _ = assert((try distance [T] [] with Failure f -> -1) = -1)
*)
let distance (x : brin) (y : brin) : int =
  let rec diff (first: brin) (second: brin) (count: int) = match first with
    | [] -> if (second = []) then count else failwith "length not the same"
    | e::other -> match second with
      | [] -> failwith "length not the same"
      | e2::other2 -> diff other other2 (if ( e2 = e ) then count else count+1)
  in diff x y 0
;;

(* test normal casses *)
let _ = assert(distance [T] [T] = 0) ;;
let _ = assert(distance [T] [C] = 1) ;;
let _ = assert(distance [G; A; G] [A; G; G] = 2);;
(* test errors *)
let _ = assert((try distance [T] [] with Failure _ -> -1) = -1) ;;
let _ = assert((try distance [] [T] with Failure _ -> -1) = -1) ;;

(** Question 4 **)

(*
Process similarity calcul.

@exception if the length x is not the same as the length of y
@param x a brin
@param y a brin

@return similarity

@tests
let _ = assert(similarite [C;G;A;T] [T;A;G;T] = 0.25);;
let _ = assert(similarite [A;G;C;T] [T;A;A;G] = 0.0);;
let _ = assert(similarite [A;G;C;T] [A;G;C;T] = 1.0);;
*)
let similarite (x : brin) (y : brin) : float =
  1.0 -. (float_of_int (distance x y) /. float_of_int (List.length x));;

let _ = assert(similarite [C;G;A;T] [T;A;G;T] = 0.25);;
let _ = assert(similarite [A;G;C;T] [T;A;A;G] = 0.0);;
let _ = assert(similarite [A;G;C;T] [A;G;C;T] = 1.0);;

type acide = Ala | Arg | Asn | Asp | Cys
           | Glu | Gln | Gly | His | Ile
           | Leu | Lys | Phe | Pro | Ser
           | Thr | Trp | Tyr | Val | START | STOP
;;

(* returns an acide from a codon *)
let codon_vers_acide (n1 : nucleotide) (n2 : nucleotide) (n3 : nucleotide) : acide =
  begin match (n1, n2, n3) with
    | (A, A, A) -> Phe | (A, A, G) -> Phe | (A, A, T) -> Leu  | (A, A, C) -> Leu
    | (G, A, A) -> Leu | (G, A, G) -> Leu | (G, A, T) -> Leu  | (G, A, C) -> Leu
    | (T, A, A) -> Ile | (T, A, G) -> Ile | (T, A, T) -> Ile  | (T, A, C) -> START
    | (C, A, A) -> Val | (C, A, G) -> Val | (C, A, T) -> Val  | (C, A, C) -> Val
    | (A, G, A) -> Ser | (A, G, G) -> Ser | (A, G, T) -> Ser  | (A, G, C) -> Ser
    | (G, G, A) -> Pro | (G, G, G) -> Pro | (G, G, T) -> Pro  | (G, G, C) -> Pro
    | (T, G, A) -> Thr | (T, G, G) -> Thr | (T, G, T) -> Thr  | (T, G, C) -> Thr
    | (C, G, A) -> Ala | (C, G, G) -> Ala | (C, G, T) -> Ala  | (C, G, C) -> Ala
    | (A, T, A) -> Tyr | (A, T, G) -> Tyr | (A, T, T) -> STOP | (A, T, C) -> STOP
    | (G, T, A) -> His | (G, T, G) -> His | (G, T, T) -> Gln  | (G, T, C) -> Gln
    | (T, T, A) -> Asn | (T, T, G) -> Asn | (T, T, T) -> Lys  | (T, T, C) -> Lys
    | (C, T, A) -> Asp | (C, T, G) -> Asp | (C, T, T) -> Glu  | (C, T, C) -> Glu
    | (A, C, A) -> Cys | (A, C, G) -> Cys | (A, C, T) -> STOP | (A, C, C) -> Trp
    | (G, C, A) -> Arg | (G, C, G) -> Arg | (G, C, T) -> Arg  | (G, C, C) -> Arg
    | (T, C, A) -> Ser | (T, C, G) -> Ser | (T, C, T) -> Arg  | (T, C, C) -> Arg
    | (C, C, A) -> Gly | (C, C, G) -> Gly | (C, C, T) -> Gly  | (C, C, C) -> Gly
  end

;;

(*
Returns the chain representation of a brin.

@exception
Errors should be expected if the brin is not valid :)
- there is another start before a stop
- there isn' a stop
- there isn't a start

@param x a brin
@returns a list of the first chaine without START and STOP

                                                      @tests
let _ = assert(brin_vers_chaine [T; A; C; G; G; C; T; A; G; A; T; T;
                                 T; A; C; G; C; T; A; A; T; A; T; C] = [Pro; Ile]) ;;
let _ = assert((try brin_vers_chaine [T; A; C; T; A; C] with Failure f -> []) = []);;
let _ = assert((try brin_vers_chaine [T; A; C; G; G; A; T; C] with Failure f -> []) = []);;
*)
let rec brin_vers_chaine (x : brin) : acide list =
  (*
   Take a brin, that we check that was starting with
   START and convert until stop. If there is another START
   then ERROR. IF a STOP is missing, then ERROR.
  *)
  let rec convert (x : brin) : acide list = match x with
    | n1::n2::n3::other -> (* get the one we are checking *)
        let r = codon_vers_acide n1 n2 n3 in
        if (r = START)
        then  failwith "brin invalide" (* already started*)
        else if (r = STOP)
        then [] (* end *)
        else (
          r::(convert other)
        )
    | _ -> failwith "brin invalide" (* Must end with a stop *)
(* call for convert if start with a START *)
  in match x with
  | n1::n2::n3::other ->
  (* get the one we are checking *)
      let r = codon_vers_acide n1 n2 n3 in
      if (r = START) then
        (convert other)
      else brin_vers_chaine (n2::n3::other) (* remove n1 and retry *)
  | _ -> failwith "brin invalide" (* empty brain *)
;;

(* normal test *)
let _ = assert(brin_vers_chaine [T; A; C; G; G; C; T; A; G; A; T; T;
                                 T; A; C; G; C; T; A; A; T; A; T; C] = [Pro; Ile]) ;;

(* some trailing T at the start *)
let _ = assert(brin_vers_chaine [T; T; A; C; G; G; C; T; A; G; A; T; T;
                                 T; A; C; G; C; T; A; A; T; A; T; C] = [Pro; Ile]) ;;

(* some errors with START and another START *)
let _ = assert((try brin_vers_chaine [T; A; C; T; A; C] with Failure _ -> []) = []) ;;
(* or no stop *)
let _ = assert((try brin_vers_chaine [T; A; C; G; G; A; T; C] with Failure _ -> []) = []) ;;


(** Question 6 **)

(*
Returns the chain representation of a brin.

@exception "brin invalide", check brin_vers_chaine for details

@see brin_vers_chaine

@tests
let _ = assert(brin_vers_chaines [T; A; C; G; G; C; T; A; G; A; T; T;
T; A; C; G; C; T; A; A; T; A; T; C]
= [[Pro; Ile]; [Arg; Leu]]) ;;
*)
let brin_vers_chaines (x : brin) : acide list list =
  (*
    @param x our brin
    @param acc the list we are creating
    @param started true if we expect a stop, false if we expect a start
  *)
  let rec check (x : brin) (acc: acide list list) (started: bool) : acide list list = match x with
    | n1::n2::n3::other ->
    (* get the one we are checking *)
        let r = codon_vers_acide n1 n2 n3 in
        (* we got a start and not started, we brin_vers_chaine
        then we will avance until STOP *)
        if (r = START && (not started)) then
          check other ((brin_vers_chaine x)::acc) true
          (* we started, we want to stop *)
        else if(r = STOP && started) then
          check other acc false (* skip, set started as false since ended *)
        else if (started)
        then check other acc true (* skip *)
        else check other ((brin_vers_chaine x)::acc) true (* we are on some random useless value that we will remove *)
    | _ -> acc
  in List.rev (check x [] false)
;;

(* simple test *)
let _ = assert(brin_vers_chaines [T; A; C; G; G; C; T; A; G; A; T; T;
                                  T; A; C; G; C; T; A; A; T; A; T; C]
               = [[Pro; Ile]; [Arg; Leu]]) ;;

(* test with values between STOP and START *)
let _ = assert(brin_vers_chaines [T; A; C; G; G; C; T; A; G; A; T; T;
                                  (* randoms *)
                                  G;A;T;C;
                                  (* another one *)
                                  T; A; C; G; C; T; A; A; T; A; T; C]
               = [[Pro; Ile]; [Arg; Leu]])
;;


(* test start *)
let _ = assert((try brin_vers_chaines
                      [T; A; C; G; G; C; T; A; G; A; T; T;
                       T; A; C;T; A; C;
                       T; A; C; G; C; T; A; A; T; A; T; C]
                with Failure _ -> []) = [])
;;


(* test stop *)
let _ = assert((try brin_vers_chaines
                      [T; A; C; G; G; C; T; A; G; A; T; T;
                       T; A; C; G; C; T; A; A; T;]
                with Failure _ -> []) = [])
;;

(* Arbres phylogenetiques *)

type arbre_phylo =
    Lf of brin
  | Br of arbre_phylo * brin * int * arbre_phylo


(** Question 1 **)

(*
Some sort of string_of_arbre_phylo.
Use an embed function brin_vers_string (string_of_brin) that I wanted
to put outside but no one asked for it.

@param a arbre_phylo
@return the string representation

@tests
let _ = arbre_phylo_vers_string (Lf [G;C;A;T]);;
- : string = "GCAT"

let _ = arbre_phylo_vers_string (Br(
    (Br( (Lf [G;C;A;T]), [A;C;A;T], 3, (Lf [T;C;G;T]) ) ),
    [A;A;A;A;],8,
    (Br((Lf [T;A;G;A]),[A;A;G;A],2,(Lf [G;A;G;A])))
  ))
;;
- : string = "AAAA:8=(ACAT:3=(GCAT,TCGT),AAGA:2=(TAGA,GAGA))"
*)
let rec arbre_phylo_vers_string (a : arbre_phylo) : string = match a with
  (* convert a brin to string *)
  | Lf(a) -> let rec brin_vers_string (b: brin) (acc: string) : string =
               match b with
               | A::other -> brin_vers_string other acc ^ "A"
               | C::other -> brin_vers_string other acc ^ "C"
               | G::other -> brin_vers_string other acc ^ "G"
               | T::other -> brin_vers_string other acc ^ "T"
               | [] -> acc
               (* I reversed it here instead of changing acc ^ *)
      in brin_vers_string (List.rev a) ""
      (* if it's a branch then we print brin : value
      ( left part, right part) and of course we use arbre_phylo_vers_string *)
  | Br(left, b, v, right) -> arbre_phylo_vers_string (Lf b) ^ ":" ^
                             string_of_int v^
                             "=(" ^
                             arbre_phylo_vers_string left ^
                             "," ^
                             arbre_phylo_vers_string right
                             ^ ")"

;;

let _ = assert(arbre_phylo_vers_string (Lf [G;C;A;T]) = "GCAT")
let _ = assert(arbre_phylo_vers_string (Br(
    (Br( (Lf [G;C;A;T]), [A;C;A;T], 3, (Lf [T;C;G;T]) ) ),
    [A;A;A;A;],8,
    (Br((Lf [T;A;G;A]),[A;A;G;A],2,(Lf [G;A;G;A])))
  )) = "AAAA:8=(ACAT:3=(GCAT,TCGT),AAGA:2=(TAGA,GAGA))")


(** Question 2 **)

(**
Returns the tree with the most of similarities
in a list of trees

@param a base tree
@param l a list of tress

@returns the tree with the most of similarities
in a list of trees

@exception if list is empty
*)
let similaire (a : arbre_phylo) (l : arbre_phylo list) : arbre_phylo =
  let length = List.length l in
  (* 0 other list *)
  if (length = 0) then failwith "Not even one"
  (* only one other *)
  else if (length = 1) then List.hd l
  else (* check all*)
    (*
      We are putting in s the tree that is the most similar
      and v the similar value.

      l is our list of three.
    *)
    let rec acc (l : arbre_phylo list) (s:arbre_phylo) (v: float) : arbre_phylo = match l with
      | l::other -> (* check value for the first *)
          let rec sum_sim (s1 : arbre_phylo) (s2: arbre_phylo) : float  = match s1 with
              (* if we got a leaf, then check both leaf *)
            | Lf(a) -> (match s2 with
                | Lf(b) -> similarite a b
                | _ -> failwith "Error, not a leaf at the same place")
            (* if we got a branch, then check each branch *)
            | Br(left, a,_,right) -> (match s2 with
                | Br(leftS2, aS2, _, rightS2) -> (sum_sim left leftS2) +.
                                                 (sum_sim (Lf a) (Lf aS2)) +.
                                                 (sum_sim right rightS2)
                | _ -> failwith "Branch not at the same place."
              )
            (* save the sum in r *)
          in let r : float = sum_sim l a
          (* check if sum is greater *)
          in if (r > v)
          (* yes, replace *)
          then acc other l r
          (* no continue *)
          else acc other s v
      | [] -> s
    in acc l (List.hd l) (-1.0)
;;

let tree1 = Br(
    (Br( (Lf [G;C;A;T]), [A;C;A;T], 3, (Lf [T;C;G;T]) ) ),
    [A;A;A;A;],8,
    (Br((Lf [T;A;G;A]),[A;A;G;A],2,(Lf [G;A;G;A])))
  );;

(* not like tree 1 at all *)
let tree2 = Br(
    (Br( (Lf [G;A;A;T]), [G;G;C;T], 5, (Lf [C;A;G;T]) ) ),
    [A;A;T;A;],12,
    (Br((Lf [T;A;G;A]),[A;A;G;A],3,(Lf [G;T;G;A])))
  );;

(* not like tree 1 at all, like tree2 *)
let tree3 = Br(
    (Br( (Lf [G;A;A;T]), [G;G;C;T], 5, (Lf [C;A;G;T]) ) ),
    [A;A;T;A;],14,
    (Br((Lf [T;A;G;A]),[C;C;G;C],5,(Lf [G;T;G;A])))
  );;

(* almost tree1 but one change *)
let tree4 = Br(
    (Br( (Lf [G;C;A;T]), [A;C;A;T], 3, (Lf [T;C;G;T]) ) ),
    [A;A;A;A;],9,
    (Br((Lf [T;A;G;A]),[C;A;G;A],2,(Lf [G;A;G;A])))
  );;

(* test empty *)
let _ = assert((try similaire tree1 [] with Failure _ -> tree1) = tree1);;
(* simple test *)
let _ = assert (similaire tree1 [tree2] = tree2);;
(* should be tree4 since almost the same *)
let _ = assert (similaire tree1 [tree2; tree3;tree4] = tree4);;
(* should be tree1 since tree1 = tree1 *)
let _ = assert (similaire tree1 [tree1; tree3;tree4] = tree1);;

(** Questions 3 **)

(** Question 3.1 **)

(*
Returns the root of a arbre_phylo meaning the brin
of the head.

@param a a arbre_phylo

@return a brin

@tests
let _ = assert(get_root tree1 = [A;A;A;A;]);;
let _ = assert(get_root tree2 = [A;A;T;A;]);;
let _ = assert(get_root tree3 = [A;A;T;A;]);;
*)
let get_root (a : arbre_phylo) : brin = match a with
  | Lf(a) -> a
  | Br(_,b,_,_) -> b
;;


let _ = assert(get_root tree1 = [A;A;A;A;]);;
let _ = assert(get_root tree2 = [A;A;T;A;]);;
let _ = assert(get_root tree3 = [A;A;T;A;]);;


(** Question 3.2 **)

(*

Returns the malus of the root of a arbre_phylo

@param a a arbre_phylo

@return root malus

@tests
let _ = assert(get_malus tree1 = 8);;
let _ = assert(get_malus tree2 = 12);;
let _ = assert(get_malus tree3 = 14);;
*)
let get_malus (a : arbre_phylo) : int = match a with
  | Lf(_) -> 0
  | Br(_,_,v,_) -> v
;;

let _ = assert(get_malus tree1 = 8);;
let _ = assert(get_malus tree2 = 12);;
let _ = assert(get_malus tree3 = 14);;


(** Question 3.3 **)

(*
Returns the created arbre_phylo from params

@params left arbre_phylo
@param root brin
@params right arbre_phylo

@returns the created arbre_phylo from params

@tests
let _ = assert(br (Lf [C;T]) [A;A] (Lf [T;C]) = Br (Lf [C; T], [A; A], 4, Lf [T; C]))
*)
let br (ag : arbre_phylo) (b : brin) (ad : arbre_phylo) : arbre_phylo =
  let agM = get_malus ag in (* get left malus *)
  let adM = get_malus ad in (* get right malus *)
  let agR = get_root ag in (* get left root *)
  let adR = get_root ad in (* get right malus *)
  (* malus is distance with each left and right, with the malus of left and right *)
  let malus = agM + adM + (distance b agR) + (distance b adR) in
  (* create brin *)
  let brin = Br(ag, b, malus, ad)
  in brin (* we could have skipped this variable but for the sake of transparency *)
;;

let _ = assert(br (Lf [C;T]) [A;A] (Lf [T;C]) = Br (Lf [C; T], [A; A], 4, Lf [T; C]))
let _ = assert(br (Lf [A;T]) [A;A] (Lf [T;C]) = Br (Lf [A; T], [A; A], 3, Lf [T; C]))


(** Question 5 **)

(*
Well from what I understand, we need to create 2^3 arbre_phylo,
using x y and z.

This function IS NOT recursive, because that not explained why this function
should be recursive.

@param x a brin
@param y a brin
@param z a brin

@exception if length not the same

@tests

*)
let gen_phylo (x : brin) (y : brin) (z : brin) : arbre_phylo list =
  let lx = List.length x in
  let ly = List.length y in
  let lz = List.length x in
  if (lx != ly || ly != lz) then
    failwith "error"
  else [
    (br (Lf x) y (Lf z));
    (br (Lf x) z (Lf y));

    (br (Lf y) x (Lf z));
    (br (Lf y) z (Lf x));

    (br (Lf z) x (Lf y));
    (br (Lf z) y (Lf x));
  ]
;;

let _ = assert( gen_phylo [A;C] [C;A] [G;A]
                = [Br (Lf [A; C], [C; A], 3, Lf [G; A]); Br (Lf [A; C], [G; A], 3, Lf [C; A]);
                   Br (Lf [C; A], [A; C], 4, Lf [G; A]); Br (Lf [C; A], [G; A], 3, Lf [A; C]);
                   Br (Lf [G; A], [A; C], 4, Lf [C; A]); Br (Lf [G; A], [C; A], 3, Lf [A; C])]
              )

;;


(** Question 4 **)

(*
  Returns the min_malus of a list of arbre_phylo,
  in particular, the arbre_phylo is returned.


  @param  l a list of arbre_phylo

  @returns the arbre_phylo with the min malus

  @exception if list is empty

  @test
  let _ = assert(min_malus (gen_phylo [A;C] [C;A] [G;A]) = Br (Lf [A; C], [C; A], 3, Lf [G; A]))
*)
let min_malus (l : arbre_phylo list) : arbre_phylo = match l with
  | [] -> failwith "Empty list"; (* list is empty, I can't use List.hd so get out *)
  | _ ->
      (*
      check the min in the list.
      Save in r the arbre_phylo and in v the min
      value of malus that we found.
      *)
      let rec check_min (l: arbre_phylo list) (r: arbre_phylo) (v: int) = match l with
        | l::other ->
          (* get current malus *)
            let currentMalus = get_malus l in
            if (currentMalus < v) (* we got a malus lesser then ours *)
            then (* replace *)
              check_min other l currentMalus
            else (* check next *)
              check_min other r v
        | [] -> r
        (* first is the king, max_int is the value we need to beat, easy :) *)
      in check_min l (List.hd l) max_int
;;

(* the first is the min_malus here *)
let _ = assert(min_malus (gen_phylo [A;C] [C;A] [G;A]) = Br (Lf [A; C], [C; A], 3, Lf [G; A]))

(** Question 6 **)

let get_min_malus_phylo (l : brin list) : arbre_phylo = match l with
  | [] -> failwith "empty list"
  | b1::[] -> Lf b1 (* can't do more than this *)
  | _::_::[] -> failwith "depth of tree not the same"
  (* here the main idea is

    - making a tree using min_malus (gen_phylo ? ? ?)
    - find the head
    - add another tree at right
*)
  | _ ->
      (* first get the minimum with 3 points *)
      let find_min (l: brin list) (r: arbre_phylo) (v: int) =
        (*
          Iterates on i
        *)
        let rec iterates_on_i (list1: brin list) (r: arbre_phylo) (v: int) = match list1 with
          | [] -> r (*
            We will consume a1 then iterate_on_other and so consume
            the first one again.

            We will consume a sublist in j and a sublist of j in k in order
            to test all pairs of three
          *)
          | a1::other ->
              let rec iterates_on_j (list2: brin list) (r: arbre_phylo) (v: int)
                = match list2 with (* Same as before, we fix a second value and consume the rest*)
                | a2::other2 ->
                    let rec iterates_on_k (list3: brin list) (r: arbre_phylo) (v: int)
                      = match list3 with
                      | a3::other3 -> (* check length *)
                          let l1 = List.length a1
                          in let l2 = List.length a2
                          in let l3 = List.length a3 in
                          if (l1 != l2 || l2 != l3)
                          then failwith "brin of different length"
                          else(* get the min malus tree *)
                            let o = min_malus (gen_phylo a1 a2 a3) in
                            let oMalus = get_malus o in (* get the min malus value *)
                            if (oMalus < v) then (* if other is empty, we don't have 3 eements so that's the end *)
                              (
                                if (other3 = []) then (* go try another a2 and change malus *)
                                  iterates_on_j other2 o oMalus
                                else (* continue and change malus *)
                                  iterates_on_k other3 o oMalus
                              )
                            else (
                              if (other3 = []) then (* go try another a2 *)
                                iterates_on_j other2 r v
                              else (* continue *)
                                iterates_on_k other3 r v
                            )
                      | _ -> r
                    in iterates_on_k other2 r v (* same as before *)
                | [] -> iterates_on_i other r v (* restart with a sub list of j *)
              in iterates_on_j other r v (* we already took the first so consume other *)
        in iterates_on_i l r v
      in let remove_commons_values (l1: brin list) (o: brin list) : brin list = (* remove first occurence of a brin in a list *)
           let remove_first_occ (b: brin) (l: brin list) : brin list =
             let rec rf_acc (b: brin) (l: brin list) (r: brin list) (deleted: bool) = match l with
               | [] -> r
               | e::other ->
                   if ((not deleted) && (compare b e) = 0)
                   then rf_acc b other r true
                   else rf_acc b other (e::r) deleted
             in rf_acc b l [] false
           in let rec rcv_acc (l: brin list) (o: brin list) : brin list = match o with
               | [] -> l
               | a1::other -> (* remove a1 then check the rest of o with the new list *)
                   let removea1 = remove_first_occ a1 l
                   in rcv_acc removea1 other
           in rcv_acc l1 o
             (* break the base in three variables *)
      in let calculate_size (size: int) : int = (* returns the depth of a branch (left or right) *)
           if (size = 3) then 3
           else
             let half = (size - 1) / 2
             in if (half * 2 + 1 = size)
             then half
             else failwith "not enough leaf"
      in let rec create (l: brin list) (s: int) =
           let create_sub (l: brin list) (depth: int) = match l with
             | [] -> failwith "not enough brins"
             | _ -> if (s = 3) then (
                 let base = find_min l (Lf []) max_int
                 in let (b1,b2,b3) = match base with
                     |  Br(Lf(b1), b2, _, Lf(b3)) ->  (b1,b2,b3)
                     | _ -> failwith "cas impossible"
                 in let nl = remove_commons_values l [b1;b2;b3]
                 in (nl, base)
               ) else (
                   create l (calculate_size depth)
                 )
           in
           let (l,left) = create_sub l s (* create left *)
           in if (List.length l = 0) (* list empty so that's it *)
           then (l, left)
           else let (l, right) = create_sub l s (* else create right and head *)
             in if (List.length l = 0)
             then failwith "not enought brins" (* can't make the head *)
             else
             if (List.length l = 1) (* okay done *)
             then ([], br left (List.hd l) right)
            (*
              iterate all brins and check the malus using each one as
              the head.

              Returns the head that allow us the minimum malus.
            *)
             else let rec find_best_head (l: brin list) (b: brin) (v: int) = match l with
                 | [] -> b
                 | head::other ->
                     let tree = br left head right in
                     let treeMalus = get_malus tree in
                     if (treeMalus < v)
                     then ( (* replace with this one *)
                       find_best_head other head treeMalus
                     )
                     else (
                       find_best_head other b v
                     )
               in let head = find_best_head l (List.hd l) max_int
               in let nl = remove_commons_values l [head]
               in (nl, br left head right)
      in let (_, a) = create l (calculate_size (List.length l)) in a
;;

(* test if we got one brin then the tree created is a simple leaft *)
let _ = assert ( get_min_malus_phylo [[A;G]] = Lf [A;G]) ;;
(* test if the tree can't make a binary tree then failure *)
let _ = assert ( try get_min_malus_phylo [[A;G];[A;T]] = Lf [] with | Failure _ -> true );;
(* same but a more complex tree that can't make a binary tree *)
let _ = assert ( try get_min_malus_phylo [[A;G];[A;T];[T;G];[A;A];[A;G];[G;G];]  = Lf [] with | Failure _ -> true );;
(* tree of size 3 *)
let _ = assert ( get_min_malus_phylo [[A;G];[A;T];[T;G]] = Br (Lf [A; T], [A; G], 2, Lf [T; G])) ;;
(* almost good (size) but not all have the same length *)
let _ = assert ( try get_min_malus_phylo [[A;G];[A;T];[T;G];[A;A];[A;G];[G;G];[T]] = Lf [] with | Failure _ -> true );;
(* tree of size 7 *)
let _ = assert ( get_min_malus_phylo [[A;G];[A;T];[T;G];[A;A];[A;G];[G;G];[T;A]]
                 = Br (Br (Lf [A; G], [A; G], 1, Lf [A; T]), [A; A], 6,
                       Br (Lf [T; A], [T; G], 2, Lf [G; G]))
               );;
(* tree of size 15 *)
let _ = assert (get_min_malus_phylo [[A;G];[A;T];[T;G];[A;A];[A;G];[G;G];[T;A];
                                     [A;G];[A;T];[T;G];[A;A];[A;G];[G;G];[T;A];
                                     [T;T]]
                = Br
                  (Br (Br (Lf [A; G], [A; G], 0, Lf [A; G]), [T; G], 3,
                       Br (Lf [T; T], [T; A], 1, Lf [T; A])),
                   [A; A], 10,
                   Br (Br (Lf [G; G], [G; G], 1, Lf [T; G]), [A; G], 4,
                       Br (Lf [A; T], [A; T], 1, Lf [A; A])))

               );;

;;

;;