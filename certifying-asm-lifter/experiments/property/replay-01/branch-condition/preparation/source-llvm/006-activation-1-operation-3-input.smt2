; benchmark generated from python API
(set-info :status unknown)
(declare-fun |pd-source-1:p1-open-rmw-1| () (_ BitVec 32))
(declare-fun |pd-source-1:p1-open-read-0| () (_ BitVec 32))
(declare-fun |pd-source-1:p1-open-read-2| () (_ BitVec 32))
(assert
 (let ((?x1718 (ite (= (ite (= (_ bv2 32) |pd-source-1:p1-open-read-2|) (_ bv1 1) (_ bv0 1)) (_ bv1 1)) |pd-source-1:p1-open-read-0| (_ bv0 32))))
(let ((?x974 (bvadd |pd-source-1:p1-open-read-0| |pd-source-1:p1-open-rmw-1|)))
(let (($x2030 (= (_ bv2 32) |pd-source-1:p1-open-read-2|)))
(let ((?x389 (ite $x2030 ?x974 |pd-source-1:p1-open-rmw-1|)))
(let (($x734 (= ?x389 (bvadd ?x1718 |pd-source-1:p1-open-rmw-1|))))
(not $x734)))))))
(check-sat)
