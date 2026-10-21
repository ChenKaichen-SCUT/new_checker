; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x2617 ((_ extract 0 0) p0-join-read-23)))
(let (($x236 (= ?x2617 (_ bv0 1))))
(let (($x119 (= (not (and (distinct (_ bv0 1) ?x2617) true)) $x236)))
(not $x119)))))
(check-sat)
