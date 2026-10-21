; benchmark generated from python API
(set-info :status unknown)
(declare-fun |pd-source-1:p1-open-rmw-1| () (_ BitVec 32))
(declare-fun |pd-source-1:p1-open-read-0| () (_ BitVec 32))
(declare-fun |pd-source-1:p1-open-read-2| () (_ BitVec 32))
(assert
 (let ((?x226 (ite (= (ite (= (_ bv2 32) |pd-source-1:p1-open-read-2|) (_ bv1 1) (_ bv0 1)) (_ bv1 1)) |pd-source-1:p1-open-read-0| (_ bv0 32))))
(let ((?x107 (bvadd |pd-source-1:p1-open-read-0| |pd-source-1:p1-open-rmw-1|)))
(let (($x110 (= (_ bv2 32) |pd-source-1:p1-open-read-2|)))
(let ((?x99 (ite $x110 ?x107 |pd-source-1:p1-open-rmw-1|)))
(let (($x214 (= ?x99 (bvadd ?x226 |pd-source-1:p1-open-rmw-1|))))
(not $x214)))))))
(check-sat)
