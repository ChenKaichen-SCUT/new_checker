; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x1721 ((_ extract 1 1) p0-join-read-23)))
(let (($x2802 (= ?x1721 (_ bv0 1))))
(let (($x7878 (= (not (and (distinct (_ bv0 1) ?x1721) true)) $x2802)))
(not $x7878)))))
(check-sat)
