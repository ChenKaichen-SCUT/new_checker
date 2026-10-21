; benchmark generated from python API
(set-info :status unknown)
(declare-fun |activation-1:llvm-create-0-read-2| () (_ BitVec 32))
(assert
 (let ((?x72 ((_ zero_extend 31) (ite (and (distinct (_ bv0 32) |activation-1:llvm-create-0-read-2|) true) (_ bv1 1) (_ bv0 1)))))
(let (($x73 (and (distinct ?x72 (_ bv0 32)) true)))
(let (($x14 (and (distinct (_ bv0 32) |activation-1:llvm-create-0-read-2|) true)))
(let (($x107 (= $x14 $x73)))
(not $x107))))))
(check-sat)
