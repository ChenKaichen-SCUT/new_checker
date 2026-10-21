; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x470 (bvand p0-join-read-23 (_ bv1 2))))
(let (($x56 (= ?x470 ?x470)))
(not $x56))))
(check-sat)
