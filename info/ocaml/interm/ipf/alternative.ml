let brin_complementaire (x : brin) : brin =
  (* it's better to reverse rather than fold_right because
  fold_right is not terminal*)
  List.rev (
    List.fold_left (fun inverted brin -> match brin with
        | A -> T::inverted
        | C -> G::inverted
        | G -> C::inverted
        | T -> A::inverted )
      [] x
  )
;; 
let _ = assert((brin_complementaire [T]) = [A]) ;;
let _ = assert((brin_complementaire [C; T; T; C]) = [G; A; A; G]) ;;
let _ = assert((brin_complementaire [C; T; A; A; T; G; T]) = [G; A; T; T; A; C; A]) ;;