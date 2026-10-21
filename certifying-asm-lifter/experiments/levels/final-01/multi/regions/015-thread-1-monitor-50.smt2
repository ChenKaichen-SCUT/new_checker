; benchmark generated from python API
(set-info :status unknown)
(declare-fun |activation-1:llvm-create-0-read-3| () (_ BitVec 32))
(declare-fun |activation-1:llvm-create-0-read-1| () (_ BitVec 32))
(assert
 (let (($x89 (and (distinct |activation-1:llvm-create-0-read-1| |activation-1:llvm-create-0-read-3|) true)))
(let (($x70 (and (distinct ((_ zero_extend 31) (ite $x89 (_ bv1 1) (_ bv0 1))) (_ bv0 32)) true)))
(let (($x13 (= $x89 $x70)))
(not $x13)))))
(check-sat)
