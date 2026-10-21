; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-main-read-0 () (_ BitVec 32))
(assert
 (let (($x3333 (= (_ bv1 32) p0-main-read-0)))
(let (($x618 (= $x3333 (and (distinct ((_ zero_extend 31) (ite $x3333 (_ bv1 1) (_ bv0 1))) (_ bv0 32)) true))))
(not $x618))))
(check-sat)
