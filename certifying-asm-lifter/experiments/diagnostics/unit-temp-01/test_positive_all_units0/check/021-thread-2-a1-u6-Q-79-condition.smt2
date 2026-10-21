; benchmark generated from python API
(set-info :status unknown)
(declare-fun |pd-source-1:p1-open-read-2| () (_ BitVec 32))
(assert
 (let (($x54 (and (distinct (_ bv0 32) |pd-source-1:p1-open-read-2|) true)))
(let (($x153 (= (_ bv2 32) |pd-source-1:p1-open-read-2|)))
(let (($x339 (and (distinct (_ bv0 32) (ite $x153 |pd-source-1:p1-open-read-2| |pd-source-1:p1-open-read-2|)) true)))
(let (($x293 (= $x339 $x54)))
(not $x293))))))
(check-sat)
