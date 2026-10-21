; benchmark generated from python API
(set-info :status unknown)
(declare-fun |activation-2:llvm-create-1-read-1| () (_ BitVec 32))
(assert
 (let ((?x23 ((_ zero_extend 31) (ite (and (distinct (_ bv0 32) |activation-2:llvm-create-1-read-1|) true) (_ bv1 1) (_ bv0 1)))))
(let (($x16 (and (distinct ?x23 (_ bv0 32)) true)))
(let (($x35 (and (distinct (_ bv0 32) |activation-2:llvm-create-1-read-1|) true)))
(let (($x53 (= $x35 $x16)))
(not $x53))))))
(check-sat)
