; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x1941 ((_ extract 0 0) p0-join-read-11)))
(let (($x1791 (= ?x1941 (_ bv0 1))))
(let (($x3278 (= (not (and (distinct (_ bv0 1) ?x1941) true)) $x1791)))
(not $x3278)))))
(check-sat)
