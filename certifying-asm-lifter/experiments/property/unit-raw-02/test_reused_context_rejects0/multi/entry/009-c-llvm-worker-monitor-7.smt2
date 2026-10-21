; benchmark generated from python API
(set-info :status unknown)
(declare-fun |source-create-1:p1-open-read-2| () (_ BitVec 32))
(assert
 (let (($x108 (and (distinct (_ bv0 32) |source-create-1:p1-open-read-2|) true)))
(let ((?x13 (ite $x108 (_ bv1 1) (_ bv0 1))))
(let ((?x58 ((_ zero_extend 31) ?x13)))
(let (($x32 (= $x108 (and (distinct ?x58 (_ bv0 32)) true))))
(not $x32))))))
(check-sat)
