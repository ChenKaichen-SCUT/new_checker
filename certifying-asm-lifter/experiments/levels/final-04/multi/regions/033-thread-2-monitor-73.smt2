; benchmark generated from python API
(set-info :status unknown)
(declare-fun |activation-2:llvm-create-1-read-3| () (_ BitVec 32))
(declare-fun |activation-2:llvm-create-1-read-1| () (_ BitVec 32))
(assert
 (let (($x79 (and (distinct |activation-2:llvm-create-1-read-1| |activation-2:llvm-create-1-read-3|) true)))
(let (($x92 (and (distinct ((_ zero_extend 31) (ite $x79 (_ bv1 1) (_ bv0 1))) (_ bv0 32)) true)))
(let (($x43 (= $x79 $x92)))
(not $x43)))))
(check-sat)
