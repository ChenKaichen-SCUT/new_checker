; benchmark generated from python API
(set-info :status unknown)
(declare-fun |pd-source-0:p1-open-rmw-1| () (_ BitVec 32))
(declare-fun |pd-source-0:p1-open-read-0| () (_ BitVec 32))
(declare-fun |pd-source-0:p1-open-read-2| () (_ BitVec 32))
(assert
 (let ((?x449 (ite (= (ite (= (_ bv2 32) |pd-source-0:p1-open-read-2|) (_ bv1 1) (_ bv0 1)) (_ bv1 1)) |pd-source-0:p1-open-read-0| (_ bv0 32))))
(let ((?x2964 (bvadd |pd-source-0:p1-open-read-0| |pd-source-0:p1-open-rmw-1|)))
(let (($x372 (= (_ bv2 32) |pd-source-0:p1-open-read-2|)))
(let ((?x1611 (ite $x372 ?x2964 |pd-source-0:p1-open-rmw-1|)))
(let (($x2810 (= ?x1611 (bvadd ?x449 |pd-source-0:p1-open-rmw-1|))))
(not $x2810)))))))
(check-sat)
