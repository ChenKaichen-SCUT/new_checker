; benchmark generated from python API
(set-info :status unknown)
(declare-fun |pd-source-0:p1-open-rmw-1| () (_ BitVec 32))
(declare-fun |pd-source-0:p1-open-read-0| () (_ BitVec 32))
(declare-fun |pd-source-0:p1-open-read-2| () (_ BitVec 32))
(assert
 (let ((?x1622 (ite (= (ite (= (_ bv2 32) |pd-source-0:p1-open-read-2|) (_ bv1 1) (_ bv0 1)) (_ bv1 1)) |pd-source-0:p1-open-read-0| (_ bv0 32))))
(let ((?x385 (bvadd |pd-source-0:p1-open-read-0| |pd-source-0:p1-open-rmw-1|)))
(let (($x401 (= (_ bv2 32) |pd-source-0:p1-open-read-2|)))
(let ((?x3049 (ite $x401 ?x385 |pd-source-0:p1-open-rmw-1|)))
(let (($x1718 (= ?x3049 (bvadd ?x1622 |pd-source-0:p1-open-rmw-1|))))
(not $x1718)))))))
(check-sat)
