; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x106 ((_ extract 0 0) p0-join-read-11)))
(let (($x63 (= ?x106 (_ bv0 1))))
(let (($x125 (= (not (and (distinct (_ bv0 1) ?x106) true)) $x63)))
(not $x125)))))
(check-sat)
