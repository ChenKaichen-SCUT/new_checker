; benchmark generated from python API
(set-info :status unknown)
(declare-fun |pd-source-1:p1-open-rmw-1| () (_ BitVec 32))
(declare-fun |pd-source-1:p1-open-read-0| () (_ BitVec 32))
(declare-fun |pd-source-1:p1-open-read-2| () (_ BitVec 32))
(assert
 (let ((?x2810 (ite (= (ite (= (_ bv2 32) |pd-source-1:p1-open-read-2|) (_ bv1 1) (_ bv0 1)) (_ bv1 1)) |pd-source-1:p1-open-read-0| (_ bv0 32))))
(let ((?x1860 (bvadd |pd-source-1:p1-open-read-0| |pd-source-1:p1-open-rmw-1|)))
(let (($x2583 (= (_ bv2 32) |pd-source-1:p1-open-read-2|)))
(let ((?x403 (ite $x2583 ?x1860 |pd-source-1:p1-open-rmw-1|)))
(let (($x1546 (= ?x403 (bvadd ?x2810 |pd-source-1:p1-open-rmw-1|))))
(not $x1546)))))))
(check-sat)
