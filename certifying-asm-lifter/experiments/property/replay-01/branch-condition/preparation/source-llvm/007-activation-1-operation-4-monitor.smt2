; benchmark generated from python API
(set-info :status unknown)
(declare-fun |pd-source-1:p1-open-rmw-3| () (_ BitVec 32))
(declare-fun |pd-source-1:p1-open-rmw-1| () (_ BitVec 32))
(declare-fun |pd-source-1:p1-open-read-2| () (_ BitVec 32))
(assert
 (let ((?x434 (ite (and (distinct |pd-source-1:p1-open-rmw-1| |pd-source-1:p1-open-rmw-3|) true) (_ bv1 1) (_ bv0 1))))
(let (($x2030 (= (_ bv2 32) |pd-source-1:p1-open-read-2|)))
(let (($x742 (and (distinct (ite $x2030 |pd-source-1:p1-open-rmw-1| |pd-source-1:p1-open-rmw-1|) |pd-source-1:p1-open-rmw-3|) true)))
(let (($x2683 (= $x742 (and (distinct ((_ zero_extend 31) ?x434) (_ bv0 32)) true))))
(not $x2683))))))
(check-sat)
