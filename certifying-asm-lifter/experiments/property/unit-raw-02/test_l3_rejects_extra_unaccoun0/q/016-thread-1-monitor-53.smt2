; benchmark generated from python API
(set-info :status unknown)
(declare-fun |activation-1:llvm-create-0-read-3| () (_ BitVec 32))
(assert
 (let ((?x33 ((_ zero_extend 31) (ite (and (distinct (_ bv0 32) |activation-1:llvm-create-0-read-3|) true) (_ bv1 1) (_ bv0 1)))))
(let (($x56 (and (distinct ?x33 (_ bv0 32)) true)))
(let (($x63 (and (distinct (_ bv0 32) |activation-1:llvm-create-0-read-3|) true)))
(let (($x75 (= $x63 $x56)))
(not $x75))))))
(check-sat)
