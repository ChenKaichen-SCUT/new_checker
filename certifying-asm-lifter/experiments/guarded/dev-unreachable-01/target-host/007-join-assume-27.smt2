; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x6431 ((_ extract 0 0) p0-join-read-23)))
(let (($x3269 (= ?x6431 (_ bv0 1))))
(let (($x3515 (= (not (and (distinct (_ bv0 1) ?x6431) true)) $x3269)))
(not $x3515)))))
(check-sat)
