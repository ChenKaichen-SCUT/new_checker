; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-main-read-0 () (_ BitVec 32))
(assert
 (let (($x419 (and (distinct (_ bv0 32) p0-main-read-0) true)))
(let (($x734 (= $x419 $x419)))
(not $x734))))
(check-sat)
