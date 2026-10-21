; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x19 ((_ extract 0 0) p0-join-read-23)))
(let (($x146 (= ?x19 (_ bv0 1))))
(let (($x158 (= (not (and (distinct (_ bv0 1) ?x19) true)) $x146)))
(not $x158)))))
(check-sat)
