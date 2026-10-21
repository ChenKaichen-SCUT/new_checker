; benchmark generated from python API
(set-info :status unknown)
(declare-fun |pd-source-1:p1-open-read-2| () (_ BitVec 32))
(assert
 (let (($x125 (and (distinct (_ bv0 32) |pd-source-1:p1-open-read-2|) true)))
(let (($x110 (= (_ bv2 32) |pd-source-1:p1-open-read-2|)))
(let (($x103 (and (distinct (_ bv0 32) (ite $x110 |pd-source-1:p1-open-read-2| |pd-source-1:p1-open-read-2|)) true)))
(let (($x212 (= $x103 $x125)))
(not $x212))))))
(check-sat)
