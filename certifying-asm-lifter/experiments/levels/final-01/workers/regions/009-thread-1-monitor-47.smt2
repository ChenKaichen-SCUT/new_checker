; benchmark generated from python API
(set-info :status unknown)
(declare-fun |activation-1:llvm-create-0-read-1| () (_ BitVec 32))
(assert
 (let ((?x61 ((_ zero_extend 31) (ite (and (distinct (_ bv0 32) |activation-1:llvm-create-0-read-1|) true) (_ bv1 1) (_ bv0 1)))))
(let (($x33 (and (distinct ?x61 (_ bv0 32)) true)))
(let (($x59 (and (distinct (_ bv0 32) |activation-1:llvm-create-0-read-1|) true)))
(let (($x58 (= $x59 $x33)))
(not $x58))))))
(check-sat)
