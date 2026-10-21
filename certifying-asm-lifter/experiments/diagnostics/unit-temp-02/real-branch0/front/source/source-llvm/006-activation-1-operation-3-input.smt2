; benchmark generated from python API
(set-info :status unknown)
(declare-fun |pd-source-1:p1-open-rmw-1| () (_ BitVec 32))
(declare-fun |pd-source-1:p1-open-read-0| () (_ BitVec 32))
(declare-fun |pd-source-1:p1-open-read-2| () (_ BitVec 32))
(assert
 (let ((?x58 (ite (= (ite (= (_ bv2 32) |pd-source-1:p1-open-read-2|) (_ bv1 1) (_ bv0 1)) (_ bv1 1)) |pd-source-1:p1-open-read-0| (_ bv0 32))))
(let ((?x343 (bvadd |pd-source-1:p1-open-read-0| |pd-source-1:p1-open-rmw-1|)))
(let (($x170 (= (_ bv2 32) |pd-source-1:p1-open-read-2|)))
(let ((?x178 (ite $x170 ?x343 |pd-source-1:p1-open-rmw-1|)))
(let (($x361 (= ?x178 (bvadd ?x58 |pd-source-1:p1-open-rmw-1|))))
(not $x361)))))))
(check-sat)
