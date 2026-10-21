; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x7976 ((_ extract 1 1) p0-join-read-23)))
(let (($x6179 (= ?x7976 (_ bv0 1))))
(let (($x8634 (= (not (and (distinct (_ bv0 1) ?x7976) true)) $x6179)))
(not $x8634)))))
(check-sat)
