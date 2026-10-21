; benchmark generated from python API
(set-info :status unknown)
(declare-fun |activation-2:llvm-create-1-read-2| () (_ BitVec 32))
(assert
 (let ((?x74 ((_ zero_extend 31) (ite (and (distinct (_ bv0 32) |activation-2:llvm-create-1-read-2|) true) (_ bv1 1) (_ bv0 1)))))
(let (($x121 (and (distinct ?x74 (_ bv0 32)) true)))
(let (($x105 (and (distinct (_ bv0 32) |activation-2:llvm-create-1-read-2|) true)))
(let (($x91 (= $x105 $x121)))
(not $x91))))))
(check-sat)
