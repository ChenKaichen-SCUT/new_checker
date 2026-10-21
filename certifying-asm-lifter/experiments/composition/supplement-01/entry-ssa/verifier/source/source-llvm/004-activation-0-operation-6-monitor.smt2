; benchmark generated from python API
(set-info :status unknown)
(declare-fun |pd-source-0:p1-open-read-2| () (_ BitVec 32))
(assert
 (let (($x141 (and (distinct ((_ zero_extend 31) (ite (and (distinct (_ bv0 32) |pd-source-0:p1-open-read-2|) true) (_ bv1 1) (_ bv0 1))) (_ bv0 32)) true)))
(let (($x76 (= (_ bv2 32) |pd-source-0:p1-open-read-2|)))
(let (($x82 (and (distinct (_ bv0 32) (ite $x76 |pd-source-0:p1-open-read-2| |pd-source-0:p1-open-read-2|)) true)))
(let (($x143 (= $x82 $x141)))
(not $x143))))))
(check-sat)
