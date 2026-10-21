; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-main-read-0 () (_ BitVec 32))
(assert
 (let (($x8653 (= (_ bv1 32) p0-main-read-0)))
(let (($x30 (= $x8653 $x8653)))
(not $x30))))
(check-sat)
