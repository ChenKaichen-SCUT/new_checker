; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x3041 ((_ extract 0 0) p0-join-read-23)))
(let (($x183 (= ?x3041 (_ bv0 1))))
(let (($x4692 (= (not (and (distinct (_ bv0 1) ?x3041) true)) $x183)))
(not $x4692)))))
(check-sat)
