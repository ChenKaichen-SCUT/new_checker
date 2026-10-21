; benchmark generated from python API
(set-info :status unknown)
(declare-fun |activation-1:llvm-create-0-read-3| () (_ BitVec 32))
(declare-fun |activation-1:llvm-create-0-read-1| () (_ BitVec 32))
(assert
 (let (($x81 (and (distinct |activation-1:llvm-create-0-read-1| |activation-1:llvm-create-0-read-3|) true)))
(let (($x53 (and (distinct ((_ zero_extend 31) (ite $x81 (_ bv1 1) (_ bv0 1))) (_ bv0 32)) true)))
(let (($x91 (= $x81 $x53)))
(not $x91)))))
(check-sat)
