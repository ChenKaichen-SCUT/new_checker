; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x164 ((_ extract 1 1) p0-join-read-11)))
(let (($x125 (= ?x164 (_ bv0 1))))
(let (($x98 (= (not (and (distinct (_ bv0 1) ?x164) true)) $x125)))
(not $x98)))))
(check-sat)
