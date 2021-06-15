(* Sequences genetiques *)

type nucleotide = A | C | G | T
                  
type brin = nucleotide list

(** Question 1 **)

let contenu_gc (x : brin) : float =
  failwith "contenu_gc : TODO"
;;

(*** TODO : tests utilisant des assertions ***)

(** Question 2 **)

let brin_complementaire (x : brin) : brin =
  failwith "brin_complementaire : TODO"
;;

(*** TODO : tests utilisant des assertions ***)

(** Question 3 **)

let distance (x : brin) (y : brin) : int =
  failwith "distance: TODO"
    
;;

(*** TODO : tests utilisant des assertions ***)

(** Question 4 **)

let similarite (x : brin) (y : brin) : float =
  failwith "similarite: TODO"
    
;;

(*** TODO : tests utilisant des assertions ***)

type acide = Ala | Arg | Asn | Asp | Cys
           | Glu | Gln | Gly | His | Ile
           | Leu | Lys | Phe | Pro | Ser
           | Thr | Trp | Tyr | Val | START | STOP

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

(** Question 5 **)

let rec brin_vers_chaine (x : brin) : acide list =
  failwith "brin_vers_chaine: TODO"
;;

(*** TODO : tests utilisant des assertions ***)

(** Question 6 **)

let brin_vers_chaines (x : brin) : acide list list =
  failwith "brin_vers_chaines: TODO"
;;

(*** TODO : tests utilisant des assertions ***)

(* Arbres phylogenetiques *)

type arbre_phylo =
    Lf of brin
  | Br of arbre_phylo * brin * int * arbre_phylo

(** Question 1 **)

let rec arbre_phylo_vers_string (a : arbre_phylo) : string =
  failwith "arbre_phylo_vers_string: TODO"
;;

(*** TODO : tests utilisant des assertions ***)

(** Question 2 **)

let similaire (a : arbre_phylo) (l : arbre_phylo list) : arbre_phylo =
  failwith "similaire: TODO"
    
;;

(*** TODO : tests utilisant des assertions ***)

(** Questions 3 **)

(** Question 3.1 **)

let get_root (a : arbre_phylo) : brin =
  failwith "get_root: TODO"
;;

(*** TODO : tests utilisant des assertions ***)

(** Question 3.2 **)

let get_malus (a : arbre_phylo) : int =
  failwith "get_malus: TODO"
;;

(*** TODO : tests utilisant des assertions ***)

(** Question 3.3 **)

let br (ag : arbre_phylo) (b : brin) (ad : arbre_phylo) : arbre_phylo =
  failwith "br: TODO"
;;

(*** TODO : tests utilisant des assertions ***)

(** Question 4 **)

let min_malus (l : arbre_phylo list) : arbre_phylo =
  failwith "min_malus: TODO"
;;

(*** TODO : tests utilisant des assertions ***)

(** Question 5 **)

let rec gen_phylo (x : brin) (y : brin) (z : brin) : arbre_phylo list =
  failwith "gen_phylo: TODO"
;;

(*** TODO : tests utilisant des assertions ***)

(** Question 6 **)

let get_min_malus_phylo (l : brin list) : arbre_phylo =
  failwith "get_min_malus_phylo: TODO"
;;

(*** TODO : tests utilisant des assertions ***)

;;

;;