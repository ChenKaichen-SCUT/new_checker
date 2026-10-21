; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x577 ((_ extract 0 0) p0-join-read-23)))
(let (($x532 (= ?x577 (_ bv0 1))))
(let (($x739 (= (not (and (distinct (_ bv0 1) ?x577) true)) $x532)))
(not $x739)))))
(check-sat)
