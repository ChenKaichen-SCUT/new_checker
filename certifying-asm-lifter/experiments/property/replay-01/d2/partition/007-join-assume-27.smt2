; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x463 ((_ extract 0 0) p0-join-read-23)))
(let (($x399 (= ?x463 (_ bv0 1))))
(let (($x400 (= (not (and (distinct (_ bv0 1) ?x463) true)) $x399)))
(not $x400)))))
(check-sat)
