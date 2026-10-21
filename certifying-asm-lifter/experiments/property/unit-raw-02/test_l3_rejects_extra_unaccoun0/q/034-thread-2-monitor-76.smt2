; benchmark generated from python API
(set-info :status unknown)
(declare-fun |activation-2:llvm-create-1-read-3| () (_ BitVec 32))
(assert
 (let ((?x95 ((_ zero_extend 31) (ite (and (distinct (_ bv0 32) |activation-2:llvm-create-1-read-3|) true) (_ bv1 1) (_ bv0 1)))))
(let (($x69 (and (distinct ?x95 (_ bv0 32)) true)))
(let (($x101 (and (distinct (_ bv0 32) |activation-2:llvm-create-1-read-3|) true)))
(let (($x75 (= $x101 $x69)))
(not $x75))))))
(check-sat)
