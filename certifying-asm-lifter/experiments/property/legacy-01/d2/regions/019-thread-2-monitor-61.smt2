; benchmark generated from python API
(set-info :status unknown)
(declare-fun |activation-2:llvm-create-1-read-1| () (_ BitVec 32))
(assert
 (let ((?x42 ((_ zero_extend 31) (ite (and (distinct (_ bv0 32) |activation-2:llvm-create-1-read-1|) true) (_ bv1 1) (_ bv0 1)))))
(let (($x24 (and (distinct ?x42 (_ bv0 32)) true)))
(let (($x36 (and (distinct (_ bv0 32) |activation-2:llvm-create-1-read-1|) true)))
(let (($x32 (= $x36 $x24)))
(not $x32))))))
(check-sat)
