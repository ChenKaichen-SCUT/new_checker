; benchmark generated from python API
(set-info :status unknown)
(declare-fun |pd-source-0:p1-open-rmw-1| () (_ BitVec 32))
(declare-fun |pd-source-0:p1-open-read-0| () (_ BitVec 32))
(declare-fun |pd-source-0:p1-open-read-2| () (_ BitVec 32))
(assert
 (let ((?x543 (ite (= (ite (= (_ bv2 32) |pd-source-0:p1-open-read-2|) (_ bv1 1) (_ bv0 1)) (_ bv1 1)) |pd-source-0:p1-open-read-0| (_ bv0 32))))
(let ((?x418 (bvadd |pd-source-0:p1-open-read-0| |pd-source-0:p1-open-rmw-1|)))
(let (($x493 (= (_ bv2 32) |pd-source-0:p1-open-read-2|)))
(let ((?x551 (ite $x493 ?x418 |pd-source-0:p1-open-rmw-1|)))
(let (($x542 (= ?x551 (bvadd ?x543 |pd-source-0:p1-open-rmw-1|))))
(not $x542)))))))
(check-sat)
