; benchmark generated from python API
(set-info :status unknown)
(declare-fun |activation-2:llvm-create-1-read-3| () (_ BitVec 32))
(assert
 (let ((?x77 ((_ zero_extend 31) (ite (and (distinct (_ bv0 32) |activation-2:llvm-create-1-read-3|) true) (_ bv1 1) (_ bv0 1)))))
(let (($x96 (and (distinct ?x77 (_ bv0 32)) true)))
(let (($x98 (and (distinct (_ bv0 32) |activation-2:llvm-create-1-read-3|) true)))
(let (($x113 (= $x98 $x96)))
(not $x113))))))
(check-sat)
