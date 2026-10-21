; benchmark generated from python API
(set-info :status unknown)
(declare-fun |pd-source-0:p1-open-read-2| () (_ BitVec 32))
(assert
 (let (($x302 (and (distinct (_ bv0 32) |pd-source-0:p1-open-read-2|) true)))
(let (($x128 (= (_ bv2 32) |pd-source-0:p1-open-read-2|)))
(let (($x173 (and (distinct (_ bv0 32) (ite $x128 |pd-source-0:p1-open-read-2| |pd-source-0:p1-open-read-2|)) true)))
(let (($x293 (= $x173 $x302)))
(not $x293))))))
(check-sat)
