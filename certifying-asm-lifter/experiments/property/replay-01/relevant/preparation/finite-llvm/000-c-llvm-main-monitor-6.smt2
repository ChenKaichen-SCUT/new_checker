; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-main-read-0 () (_ BitVec 32))
(assert
 (let (($x151 (and (distinct (_ bv0 32) p0-main-read-0) true)))
(let ((?x149 (ite $x151 (_ bv1 1) (_ bv0 1))))
(let ((?x69 ((_ zero_extend 31) ?x149)))
(let (($x63 (= $x151 (and (distinct ?x69 (_ bv0 32)) true))))
(not $x63))))))
(check-sat)
