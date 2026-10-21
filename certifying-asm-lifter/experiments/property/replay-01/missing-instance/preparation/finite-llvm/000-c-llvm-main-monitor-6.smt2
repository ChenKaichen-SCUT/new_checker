; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-main-read-0 () (_ BitVec 32))
(assert
 (let (($x1718 (and (distinct (_ bv0 32) p0-main-read-0) true)))
(let ((?x413 (ite $x1718 (_ bv1 1) (_ bv0 1))))
(let ((?x532 ((_ zero_extend 31) ?x413)))
(let (($x402 (= $x1718 (and (distinct ?x532 (_ bv0 32)) true))))
(not $x402))))))
(check-sat)
