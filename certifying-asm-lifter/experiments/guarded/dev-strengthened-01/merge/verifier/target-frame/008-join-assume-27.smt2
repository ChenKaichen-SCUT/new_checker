; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x3175 ((_ extract 0 0) p0-join-read-23)))
(let (($x8749 (= ?x3175 (_ bv0 1))))
(let (($x189 (= (not (and (distinct (_ bv0 1) ?x3175) true)) $x8749)))
(not $x189)))))
(check-sat)
