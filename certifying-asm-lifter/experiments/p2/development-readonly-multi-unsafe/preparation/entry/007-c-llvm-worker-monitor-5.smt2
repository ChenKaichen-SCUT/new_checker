; benchmark generated from python API
(set-info :status unknown)
(declare-fun p1-open-rmw-3 () (_ BitVec 32))
(declare-fun p1-open-rmw-1 () (_ BitVec 32))
(assert
 (let (($x1177 (and (distinct p1-open-rmw-1 p1-open-rmw-3) true)))
(let ((?x1191 (ite $x1177 (_ bv1 1) (_ bv0 1))))
(let ((?x1188 ((_ zero_extend 31) ?x1191)))
(let (($x491 (= $x1177 (and (distinct ?x1188 (_ bv0 32)) true))))
(not $x491))))))
(check-sat)
