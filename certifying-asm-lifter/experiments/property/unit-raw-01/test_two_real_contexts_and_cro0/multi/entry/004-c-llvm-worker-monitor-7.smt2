; benchmark generated from python API
(set-info :status unknown)
(declare-fun |source-create-0:p1-open-read-2| () (_ BitVec 32))
(assert
 (let (($x21 (and (distinct (_ bv0 32) |source-create-0:p1-open-read-2|) true)))
(let ((?x53 (ite $x21 (_ bv1 1) (_ bv0 1))))
(let ((?x35 ((_ zero_extend 31) ?x53)))
(let (($x51 (= $x21 (and (distinct ?x35 (_ bv0 32)) true))))
(not $x51))))))
(check-sat)
