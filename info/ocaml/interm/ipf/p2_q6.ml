(* une nucleotide est crée soit avec A, C, G ou T *)
type nucleotide = A | C | G | T
;;

(* séquence de nucléotides *)
type brin = nucleotide list
;;

(*
To be honest, this function was not made by me
since I lack the knowledge to find how to do this.

source: https://stackoverflow.com/questions/3989776/transpose-of-a-list-of-lists#answer-3989823

this function seems like not terminal so may fire
a stack overflow error.
*)
let rec transpose (list: brin list) = match list with
  | [] -> []
  | []::xss -> transpose xss
  | (x::xs)::xss ->
      (x::List.map List.hd xss) :: transpose (xs :: List.map List.tl xss)
;;

(*
This function is pretty simple, 
I want to find what is or are the nucleotides that are
the most present in a present.

- for instance for [A;A;C] we will have [A]
- for [A;A;G;T;T] we will have [A;T]
*)
let rec filter_not_interesting (x: 'a list) =
  let call_fold_for on = List.fold_left (fun acc a -> if (a = on) then
                                            acc+1 else acc) 0 x 
                                                                   
   (* we find the number of occurrences for each of our 4 
      nucléotides *)
  in let a = call_fold_for A
  in let c = call_fold_for C
  in let g = call_fold_for G
  in let t = call_fold_for T
  (* find the base that will be used for filter *)
  in let max = List.fold_left (fun acc a -> if (acc < a) then
                                  a else acc) a [c;g;t] 
  in let filtered l = (* here is the core of the function
                    we will only keed that that have a 
                    number of occurrences equals to max
                    so let's check a c g and t values
                    resp. the number of occurrences for A C G T
                      
                    I wanted to use mapi but didn't manage to,
                    and using fold with index didn't look
                    as easy as that
                      *) 
       let rec filtered_acc l acc index = match l with
         | [] -> acc
         | e::other -> if (e = max) then 
               filtered_acc other (
                 (* no match since numbers *)
                 if index = 0 then A::acc
                 else if index = 1 then C::acc
                 else if (index = 2) then G::acc
                 else T::acc 
               ) (index+1)
             else filtered_acc other acc (index+1)
       in filtered_acc l [] 0
  in List.rev (filtered [a;c;g;t])
;;

let _ = assert (filter_not_interesting [C;C;G;A;A;T;T] = [A;C;T]) ;;


(* here another function.
   
  We got a list of brins, so we want to find for
     each column, what's are the most used values.
   
  we use transpose to convert the matrix of one brin per lines
   into a matrix where one line so a brin is the n element
     of each brin from our previous list.
   
  [[C;C;G];[A;C;G];[A;T;T];[C;A;T]] gives us 
  [[C; A; A; C]; [C; C; T; A]; [G; G; T; T]]
     
  so that's a simple transpose of a matrix.
   
  Now we want to find what are for each brin, the most
     used values, so they may be one or more
   is some are used in the same amount.
     
  we use filter_not_interesting and now 
     we got 
       [[C; A]; [C]; [T; G]]
         
  we got 
*)
let most_probable x = 
  let tr = transpose x in
  let tr_filter tr =
    let rec tr_filter_acc tr acc = match tr with
      | [] -> acc
      | a::other -> tr_filter_acc other ((filter_not_interesting a)::acc)
    in List.rev (tr_filter_acc tr [])
  in tr_filter tr
;;

let _ = assert(most_probable [[C;C;G];[A;C;G]] = [[A; C]; [C]; [G]]) ;;


(*
Now that we got some start, we must
add a function that in a list of brain, returns the most similar one
to this one.

We need that to choose the head of our tree,
at least for the start of my algorithm
*)
let find_most_similar_brin_to_others (l: brin list) : brin =
  let mp = most_probable l in (* get the most probable values for each index *)
  (* 
  We need to find the one with the greatest score, 
  because that we will be the head of our tree
  since other will be similar to him since he got
  the most values in commons with others.
  *)
  let rec fmsbto_acc (l: brin list) (b: brin) (v: int) = match l with
    | [] -> b
    | brin::other -> (
        (* 
        we will check for this brin, what's is score, so how many
        columns match the most_probable.
        *)
        let check_brin_with_mp (brin: brin) (mp: brin list) = 
          let rec calculate_score (brin: brin) (mp: brin list) (score: int) = match brin with
            | [] -> score
            | a::other -> (
    (* the column we are checking *)
                let alt = List.hd mp
    (* the rest of the columns *)
                in let alt_rest = List.tl mp
    (* we will iterate this column and check
    if a in present in it, yes ? then we increase
    score, if not then false.
                *)
                in let new_score = if (List.mem a alt) then (score+1) else score
                in (* we should leave on true but tired of using exception to leave so sorry but we continue*)
                calculate_score other alt_rest new_score
              )
          in calculate_score brin mp 0
        in let score = check_brin_with_mp brin mp
        in if (score > v) then (* if greater then switch else continue *)
          (fmsbto_acc other brin score)
        else
          (fmsbto_acc other b v)
      )
  in fmsbto_acc l [] 0
;;

(*
When a brin is used, we need to remove it
That's what we do with this function.
*)
let remove_commons_values (l1: brin list) (o: brin list) : brin list = (* remove first occurence of a brin in a list *)
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
  in List.rev (rcv_acc l1 o)
;;

let remove_commons_values2 (l1: brin list list) (l2: brin list) : brin list list =
  let rec rcv2_acc l1 l2 acc removed = match l1 with
    | [] -> acc
    | a::o -> 
        if (removed || a = l2) then
          rcv2_acc o l2 (a::acc) removed
        else (* remove *)
          rcv2_acc o l2 acc true
  in rcv2_acc l1 l2 [] false
;;


(*
Let's sumarize
- we can find the head, using find_most_similar_brin_to_others
- we can remove a brin that we used

Now we are doing a part of the core of the algorithm,
we need to find for a brin,
what are the best match for it. It will be like the 
function find_most_similar_brin_to_others yet not the same
at all.

In other words, if we have a brin, give me the list
of all score, meaning the similarity, for each brin
of a list.
*)

  (* copy of project code *)
let distance (x : brin) (y : brin) : int =
  let rec diff (first: brin) (second: brin) (count: int) = match first with
    | [] -> if (second = []) then count else failwith "length not the same"
    | e::other -> match second with
      | [] -> failwith "length not the same"
      | e2::other2 -> diff other other2 (if ( e2 = e ) then count else count+1)
  in diff x y 0
;; 

(* our function here *)
let evaluates_similarities (b: brin) (l: brin list) : int list =
  let len = List.length b in 
  (* we will have 3 is a and b have 3 letters
     at the same place, 0 if none, 1 is one,
       n if n ...
  *)
  List.rev (List.fold_left (fun acc a -> ((len - distance a b)::acc)) [] l)
;;

(**
And now the other part of the core, we need
for a list of brins, to evaluates
the similarities for each one.

Let's take an exemple : 
  - we got a head
  - we want to find to suitables child
      so here our list is [head]

      Then we will also use this method with the two child,
                                             meaning that if we got
                                                 A - B - D
                                                             - E
                                                             - C - F
                                                             - G
                                                               we will have a list of [B;C] and we will
    try to look for D E F G.

                            why ? We may find that D and E (and ...) have the same
  most similarity with B, for instance 1. We don't know
                           if for C, C-D may be 2 so we would rather use it with C.

                                                                                   -------- SUMMARY -------- 
                                                                                 So we look for the two most prominents child for B
and for C, but If a candidate is used either in 
prominents child for B
and
  prominents child for C
then we will try to pick the most meaningful one, according
  to the evaluates_similarities value.

                                  *)

(* let's keep the function as little as possible
and first *)

let partition_by_similarities (l: brin list) (core: brin list) =
  let cleaned_list = remove_commons_values l core
      (* we give the cleaned list since we may call this method
       again but with another list *)
  in let rec pbs_acc (c: brin list) (cleaned_list: brin list) (r: brin list list) = match c with
      | [] -> r
      | a::other ->  (
          let s = evaluates_similarities a cleaned_list
          in (* find brin list with the two greateast indexes *)
          let find_great_index (s: int list) (o: brin list) = 
            let max = List.fold_left (fun acc a -> if (acc < a) then
                                         a else acc) (List.hd s) (List.tl s)
            in let rec find_indexes_for_max (s2: int list) (indexes: brin list) (pos: int) (max: int) = match s2 with
      (* start again but reduce max since only 1 match *)
                | [] -> find_indexes_for_max s indexes 0 (max-1)
                | i::others -> (
                    if (i = max) 
                    then (
                      let sz = List.length indexes in 
                      if (sz + 1 = 2) 
                      then (* end, return result since we finnaly have two values *)
                        (List.nth o (pos))::indexes
                      else find_indexes_for_max others ((List.nth o (pos))::indexes) (pos+1) max
                    )
                    else find_indexes_for_max others indexes (pos+1) max
                  )
            in find_indexes_for_max s [] 0 max
          in let couple = find_great_index s cleaned_list
          in pbs_acc other cleaned_list (couple::r)
        )
  in let all = pbs_acc core cleaned_list []
  in if (List.length core = 1) then
    all (* no problem *)
  else 
    let rec process_all all = 
      (*
    There i will have a hard HARD TIME. I need to make sure that
    I didn't use a brin more that the number of time I have it
    in cleaned_list.
    
    Since I want to escape this situation, i will increase 
    complexity (time) by checking if there is a problem before trying
    to fix it.
    *)
      (
        let rec check_for_errors (hd: brin list) (tl: brin list list) 
            (err: brin list) = match hd with 
          | [] ->  err
          | a::[] -> err
          | a::o -> (
              let rec cfe2 (l2: brin list list) (err: brin list) = match l2 with
                | [] -> check_for_errors o tl err
                | b::others -> (
                    let rec cfe3 (l3: brin list) (err: brin list) = match l3 with
                      | [] -> cfe2 others err
                      | c::others2 -> cfe3 others2 (if (c = a) then c::err else err)
                    in cfe3 b err
                  )
              in cfe2 tl err
            )
        in let may_be_errors = check_for_errors (List.hd all) (List.tl all) []
        in (* we hope that may_be_errors is empty *)
        if (List.length may_be_errors = 0) then all
        else (* we need to check
           that any value used twice was used because
           they was enought values.
              if not then we need to choose witch one
              will keep this value.
             *)
      
          let rec iter1 (l1: brin list) (all: brin list list) = match l1 with
            | [] -> failwith "here I should handle if there are more
                      than one problematic brin but tired :("
            | a::other -> let rec iter2 (l2: brin list list) (acc:brin list list)
                (removed_current: brin list)
              = match l2 with 
              | [] -> acc
              | e::[] -> e::acc
              (* here e is like [[A;T;...]; ...] *)
              | e::rest -> 
                  (* save the list cleaned by removed_current
                  just in case we want to tell that we are
                       the one that kept a value, so a brin
                  *)
                  let ml = remove_commons_values cleaned_list removed_current
                  in 
                  if List.mem a e
                  then (* our brin is in this brin list *)
                    if List.mem a (remove_commons_values ml [a]) 
                    then (* we can take the brin stored in a 
               and still have one, so no problem *) 
                      iter2 rest (e::acc) removed_current
                    else
            (* no we need to change either the one
            in e or the one in l1 *)
                      (
              (* look for the first one after us having
              a in it *)
                        let index = List.length acc 
                        in let find_index t l = - 
                 (* we set acc negative to tell our condition
                 to stop increasing index *)
                           (List.fold_left 
                              (fun acc x -> if (acc < 0) then acc else
                                if ( List.mem t x ) then (acc * (-1)) else acc+1)
                              0 l) 
                          
                        in let rec try_all (l2: brin list list) =
                             let next = find_index a l2
                     (* get the one we are competing with *)
                             in let head2 = List.nth core (index+next+1) 
                             in let head1 = List.nth core index 
                             in let shead1 = distance a head1 
                             in let shead2 = distance a head2
                             in let otherCouple = List.nth l2 (next+1)
                             in if (shead1 = shead2 || shead1 < shead2)
                             then (* no difference then don't stay here 
                             or other keep it, 
                             regenerates *)
                               let newseq = pbs_acc core (remove_commons_values 
                                                            cleaned_list otherCouple) []
                               in iter2 rest ((List.nth newseq index)::acc) removed_current
                             else
                          (* failwith "we keep it, 
                            other don't but we should check
                            if there is more than
                            head2 who got ours, tell in removed_current
                            if we removed it" *)
                             if List.length l2 = 1 then
                               iter2 rest (e::acc) (e@removed_current)
                             else (* check others first then choose after *)
                               try_all
                                 (remove_commons_values2 rest otherCouple)
                        in try_all l2
                      )
                  else (* we can go to next
                       since e is clean for this brin a *)
                    iter2 rest (e::acc) removed_current
                in iter2 all [] []
          in iter1 may_be_errors all 
      )
    in process_all all
;; 

(* Arbres phylogenetiques *)

type arbre_phylo =
  | Lf of brin
  | Br of arbre_phylo * brin * int * arbre_phylo
;;

let get_root (a : arbre_phylo) : brin = match a with
  | Lf(a) -> a
  | Br(_,b,_,_) -> b
;;

let get_malus (a : arbre_phylo) : int = match a with
  | Lf(_) -> 0
  | Br(_,_,v,_) -> v
;;

(* we are gonna add the left
at the end of left, the right at the end of right
and head *)
type stacker = {left: brin list; head: brin; right: brin list}
;;

(* simple function to update zipper values *)
let update_zipper (stacker: stacker) (l: brin list) (r:brin list) : stacker 
  = 
  {left= List.append stacker.left l; 
   head= stacker.head; 
   right= List.append stacker.right r};;

(* simple function  *)
let split_res result = match result with
  | [] -> failwith "not possible"
  | a::[] -> let flat_res = List.flatten result
      in ([List.hd flat_res], List.tl flat_res)
  | _ -> 
      let half = (List.length result)/2
      in let appends_from_i_until_j l i j =
           let rec afiuj_acc l acc current = match l with
             | [] -> acc
             | a::other -> afiuj_acc other 
                             (if current >= i && current < j
                              then a::acc
                              else acc)
                             (current+1)
           in afiuj_acc l [] 0
      in let left = appends_from_i_until_j result 0 (half)
      in let right = appends_from_i_until_j result (half) (half*2)
      in (List.rev (List.flatten left), List.rev (List.flatten right))
;;

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


let get_min_malus_phylo (l : brin list) = 
  let length = List.length l 
  in if (length mod 2 = 0) 
  then failwith "invalid size, size must be like 2^n+1, n is the depth"
  else if (length = 1) then Lf(List.hd l)
      (* is l writable as 2^n+1 ? *) 
  else let rec checker (l: int) (n2: int) : bool =
         if( n2 > l ) then false
         else if (n2 = l) then true
         else checker l (2*n2)
    in let check = checker (length+1) 1
    in if(not check) then failwith "invalid size, size must be like 2^n+1, n is the depth"
    else 
      (* let's start *)
      let head = find_most_similar_brin_to_others l
      in let list = remove_commons_values l [head]
      in  let create_tree (s: stacker) = 
            let rec create_tree_acc (l: brin list) (i: int) = match l with
              | a::[] -> Lf(a)
              | a::b::c::[] -> br (Lf b) a (Lf c)
              | a::b::c::d::e::f::g::_ -> br (br (Lf d) b (Lf e))
                                            a (br(Lf f) c (Lf g))
              | _ -> failwith "non codé arbre > 7"
            in let left = create_tree_acc s.left 0
            in let right = create_tree_acc s.right 0
            in let head = s.head 
            in br left head right
      in let start = {left = []; head= head; right= []} 
      in let rec consume_all (list: brin list)
          (start: stacker) (core: brin list) : stacker = match list with
          | [] -> start
          | _ -> let part = partition_by_similarities list core
              in let l = remove_commons_values list (List.flatten part)
              in let (left_r, right_r) = split_res part
              in let s = update_zipper start left_r right_r
              in consume_all l s (List.hd part)
      in create_tree (consume_all list start [head])
;;

(*0 means error *)
let _ = assert (try get_min_malus_phylo [] = (Lf []) with Failure _ -> true);; 

(* 1 is leaft *)
let _ = assert (get_min_malus_phylo [[A;C;T]] = (Lf [A;C;T]));; 

(* 2 is error means error *)
let _ = assert (try get_min_malus_phylo [[A;C;T]; [C;G;A];]
                    = (Lf []) with Failure _ -> true);; 

(* 3 means that's good *)
let _ = assert (get_min_malus_phylo [[A;C;T]; [C;G;A]; [A;G;A];]
          (* generated with min_malus of gen_phylo
        but in the other file *)
                = Br (Lf [A; C; T], [A; G; A], 3, Lf [C; G; A])
               )
;;


(* 5 means error *)
let _ = assert (try get_min_malus_phylo [[A;C;T]; [C;G;A];]
                    = (Lf []) with Failure _ -> true);; 
;;

(* 
l'arbre résultat n'est pas minimal

Br (Br (Lf [T; T; A], [A; C; T], 6, Lf [T; A; C]), [A; G; A], 15,
 Br (Lf [G; C; T], [C; G; A], 6, Lf [A; T; G]))

 suite à un bug car il suffit d'inverser les deux têtes
 et l'arbre et minimal. C'est dû à un oubli quelque part
 de rev une liste mais je n'ai pas trouvé, le code étant
 super complexe.
*)
get_min_malus_phylo [[A;C;T]; [C;G;A]; [A;G;A]; [T;A;C];
                     [G;C;T]; [T;T;A]; [A;T;G]]
;;