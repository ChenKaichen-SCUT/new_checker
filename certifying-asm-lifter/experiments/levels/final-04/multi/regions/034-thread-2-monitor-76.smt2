; benchmark generated from python API
(set-info :status unknown)
(declare-fun |activation-2:llvm-create-1-read-3| () (_ BitVec 32))
(assert
 (let ((?x95 ((_ zero_extend 31) (ite (and (distinct (_ bv0 32) |activation-2:llvm-create-1-read-3|) true) (_ bv1 1) (_ bv0 1)))))
(let (($x74 (and (distinct ?x95 (_ bv0 32)) true)))
(let (($x96 (and (distinct (_ bv0 32) |activation-2:llvm-create-1-read-3|) true)))
(let (($x48 (= $x96 $x74)))
(not $x48))))))
(check-sat)
