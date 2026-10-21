; benchmark generated from python API
(set-info :status unknown)
(declare-fun |pd-source-0:p1-open-read-2| () (_ BitVec 32))
(assert
 (let (($x372 (and (distinct ((_ zero_extend 31) (ite (and (distinct (_ bv0 32) |pd-source-0:p1-open-read-2|) true) (_ bv1 1) (_ bv0 1))) (_ bv0 32)) true)))
(let (($x401 (= (_ bv2 32) |pd-source-0:p1-open-read-2|)))
(let (($x722 (and (distinct (_ bv0 32) (ite $x401 |pd-source-0:p1-open-read-2| |pd-source-0:p1-open-read-2|)) true)))
(let (($x2976 (= $x722 $x372)))
(not $x2976))))))
(check-sat)
