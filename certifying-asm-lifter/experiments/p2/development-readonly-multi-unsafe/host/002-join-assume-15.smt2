; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x470 ((_ extract 0 0) p0-join-read-11)))
(let (($x1179 (= ?x470 (_ bv0 1))))
(let (($x1191 (= (not (and (distinct (_ bv0 1) ?x470) true)) $x1179)))
(not $x1191)))))
(check-sat)
