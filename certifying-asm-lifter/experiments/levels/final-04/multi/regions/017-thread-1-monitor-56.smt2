; benchmark generated from python API
(set-info :status unknown)
(declare-fun |activation-1:llvm-create-0-read-2| () (_ BitVec 32))
(assert
 (let ((?x43 ((_ zero_extend 31) (ite (and (distinct (_ bv0 32) |activation-1:llvm-create-0-read-2|) true) (_ bv1 1) (_ bv0 1)))))
(let (($x11 (and (distinct ?x43 (_ bv0 32)) true)))
(let (($x42 (and (distinct (_ bv0 32) |activation-1:llvm-create-0-read-2|) true)))
(let (($x82 (= $x42 $x11)))
(not $x82))))))
(check-sat)
