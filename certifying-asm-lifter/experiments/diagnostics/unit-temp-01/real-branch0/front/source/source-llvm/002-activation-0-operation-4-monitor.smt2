; benchmark generated from python API
(set-info :status unknown)
(declare-fun |pd-source-0:p1-open-rmw-3| () (_ BitVec 32))
(declare-fun |pd-source-0:p1-open-rmw-1| () (_ BitVec 32))
(declare-fun |pd-source-0:p1-open-read-2| () (_ BitVec 32))
(assert
 (let ((?x338 (ite (and (distinct |pd-source-0:p1-open-rmw-1| |pd-source-0:p1-open-rmw-3|) true) (_ bv1 1) (_ bv0 1))))
(let (($x128 (= (_ bv2 32) |pd-source-0:p1-open-read-2|)))
(let (($x335 (and (distinct (ite $x128 |pd-source-0:p1-open-rmw-1| |pd-source-0:p1-open-rmw-1|) |pd-source-0:p1-open-rmw-3|) true)))
(let (($x201 (= $x335 (and (distinct ((_ zero_extend 31) ?x338) (_ bv0 32)) true))))
(not $x201))))))
(check-sat)
