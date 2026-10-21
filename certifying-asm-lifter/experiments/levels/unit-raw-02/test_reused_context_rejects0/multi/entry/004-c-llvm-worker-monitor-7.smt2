; benchmark generated from python API
(set-info :status unknown)
(declare-fun |source-create-0:p1-open-read-2| () (_ BitVec 32))
(assert
 (let (($x18 (and (distinct (_ bv0 32) |source-create-0:p1-open-read-2|) true)))
(let ((?x48 (ite $x18 (_ bv1 1) (_ bv0 1))))
(let ((?x32 ((_ zero_extend 31) ?x48)))
(let (($x16 (= $x18 (and (distinct ?x32 (_ bv0 32)) true))))
(not $x16))))))
(check-sat)
