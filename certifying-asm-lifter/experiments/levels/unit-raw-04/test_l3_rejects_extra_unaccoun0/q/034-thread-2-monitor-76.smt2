; benchmark generated from python API
(set-info :status unknown)
(declare-fun |activation-2:llvm-create-1-read-3| () (_ BitVec 32))
(assert
 (let ((?x85 ((_ zero_extend 31) (ite (and (distinct (_ bv0 32) |activation-2:llvm-create-1-read-3|) true) (_ bv1 1) (_ bv0 1)))))
(let (($x69 (and (distinct ?x85 (_ bv0 32)) true)))
(let (($x91 (and (distinct (_ bv0 32) |activation-2:llvm-create-1-read-3|) true)))
(let (($x75 (= $x91 $x69)))
(not $x75))))))
(check-sat)
