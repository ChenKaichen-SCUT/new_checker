; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x8749 ((_ extract 0 0) p0-join-read-23)))
(let (($x189 (= ?x8749 (_ bv0 1))))
(let (($x225 (= (not (and (distinct (_ bv0 1) ?x8749) true)) $x189)))
(not $x225)))))
(check-sat)
