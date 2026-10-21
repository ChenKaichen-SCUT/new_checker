; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x63 ((_ extract 1 1) p0-join-read-23)))
(let (($x197 (= ?x63 (_ bv0 1))))
(let (($x8725 (= (not (and (distinct (_ bv0 1) ?x63) true)) $x197)))
(not $x8725)))))
(check-sat)
