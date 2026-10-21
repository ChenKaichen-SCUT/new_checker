; benchmark generated from python API
(set-info :status unknown)
(declare-fun |activation-2:llvm-create-1-read-2| () (_ BitVec 32))
(assert
 (let ((?x100 ((_ zero_extend 31) (ite (and (distinct (_ bv0 32) |activation-2:llvm-create-1-read-2|) true) (_ bv1 1) (_ bv0 1)))))
(let (($x102 (and (distinct ?x100 (_ bv0 32)) true)))
(let (($x75 (and (distinct (_ bv0 32) |activation-2:llvm-create-1-read-2|) true)))
(let (($x103 (= $x75 $x102)))
(not $x103))))))
(check-sat)
