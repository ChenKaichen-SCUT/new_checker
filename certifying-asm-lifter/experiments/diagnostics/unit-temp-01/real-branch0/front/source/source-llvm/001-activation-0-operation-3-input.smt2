; benchmark generated from python API
(set-info :status unknown)
(declare-fun |pd-source-0:p1-open-rmw-1| () (_ BitVec 32))
(declare-fun |pd-source-0:p1-open-read-0| () (_ BitVec 32))
(declare-fun |pd-source-0:p1-open-read-2| () (_ BitVec 32))
(assert
 (let ((?x360 (ite (= (ite (= (_ bv2 32) |pd-source-0:p1-open-read-2|) (_ bv1 1) (_ bv0 1)) (_ bv1 1)) |pd-source-0:p1-open-read-0| (_ bv0 32))))
(let ((?x333 (bvadd |pd-source-0:p1-open-read-0| |pd-source-0:p1-open-rmw-1|)))
(let (($x128 (= (_ bv2 32) |pd-source-0:p1-open-read-2|)))
(let ((?x334 (ite $x128 ?x333 |pd-source-0:p1-open-rmw-1|)))
(let (($x179 (= ?x334 (bvadd ?x360 |pd-source-0:p1-open-rmw-1|))))
(not $x179)))))))
(check-sat)
