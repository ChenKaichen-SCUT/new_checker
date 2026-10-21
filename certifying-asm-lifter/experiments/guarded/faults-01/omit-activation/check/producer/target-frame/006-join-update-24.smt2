; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x1945 (bvand p0-join-read-23 (_ bv1 2))))
(let (($x917 (= ?x1945 ?x1945)))
(not $x917))))
(check-sat)
