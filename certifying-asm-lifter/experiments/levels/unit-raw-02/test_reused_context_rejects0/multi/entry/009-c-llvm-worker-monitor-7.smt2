; benchmark generated from python API
(set-info :status unknown)
(declare-fun |source-create-1:p1-open-read-2| () (_ BitVec 32))
(assert
 (let (($x65 (and (distinct (_ bv0 32) |source-create-1:p1-open-read-2|) true)))
(let ((?x103 (ite $x65 (_ bv1 1) (_ bv0 1))))
(let ((?x48 ((_ zero_extend 31) ?x103)))
(let (($x25 (= $x65 (and (distinct ?x48 (_ bv0 32)) true))))
(not $x25))))))
(check-sat)
