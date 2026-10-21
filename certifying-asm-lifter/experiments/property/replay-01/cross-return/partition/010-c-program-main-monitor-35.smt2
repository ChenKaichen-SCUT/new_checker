; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-main-read-0 () (_ BitVec 32))
(assert
 (let (($x2533 (and (distinct (_ bv0 32) p0-main-read-0) true)))
(let (($x2036 (= $x2533 $x2533)))
(not $x2036))))
(check-sat)
