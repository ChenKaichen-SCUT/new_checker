; benchmark generated from python API
(set-info :status unknown)
(declare-fun |source-create-0:p1-open-read-2| () (_ BitVec 32))
(assert
 (let (($x34 (and (distinct (_ bv0 32) |source-create-0:p1-open-read-2|) true)))
(let ((?x58 (ite $x34 (_ bv1 1) (_ bv0 1))))
(let ((?x26 ((_ zero_extend 31) ?x58)))
(let (($x42 (= $x34 (and (distinct ?x26 (_ bv0 32)) true))))
(not $x42))))))
(check-sat)
