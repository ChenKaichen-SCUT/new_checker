; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-main-read-0 () (_ BitVec 32))
(assert
 (let (($x576 (and (distinct (_ bv0 32) p0-main-read-0) true)))
(let ((?x2946 (ite $x576 (_ bv1 1) (_ bv0 1))))
(let ((?x577 ((_ zero_extend 31) ?x2946)))
(let (($x1825 (= $x576 (and (distinct ?x577 (_ bv0 32)) true))))
(not $x1825))))))
(check-sat)
