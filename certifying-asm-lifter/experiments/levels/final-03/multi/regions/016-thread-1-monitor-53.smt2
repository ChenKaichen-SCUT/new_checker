; benchmark generated from python API
(set-info :status unknown)
(declare-fun |activation-1:llvm-create-0-read-3| () (_ BitVec 32))
(assert
 (let ((?x83 ((_ zero_extend 31) (ite (and (distinct (_ bv0 32) |activation-1:llvm-create-0-read-3|) true) (_ bv1 1) (_ bv0 1)))))
(let (($x84 (and (distinct ?x83 (_ bv0 32)) true)))
(let (($x71 (and (distinct (_ bv0 32) |activation-1:llvm-create-0-read-3|) true)))
(let (($x77 (= $x71 $x84)))
(not $x77))))))
(check-sat)
