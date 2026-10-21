; benchmark generated from python API
(set-info :status unknown)
(declare-fun |pd-source-1:p1-open-rmw-1| () (_ BitVec 32))
(declare-fun |pd-source-1:p1-open-read-0| () (_ BitVec 32))
(declare-fun |pd-source-1:p1-open-read-2| () (_ BitVec 32))
(assert
 (let ((?x179 (ite (= (ite (= (_ bv2 32) |pd-source-1:p1-open-read-2|) (_ bv1 1) (_ bv0 1)) (_ bv1 1)) |pd-source-1:p1-open-read-0| (_ bv0 32))))
(let (($x153 (= (_ bv2 32) |pd-source-1:p1-open-read-2|)))
(let ((?x337 (ite $x153 (bvadd |pd-source-1:p1-open-read-0| |pd-source-1:p1-open-rmw-1|) |pd-source-1:p1-open-rmw-1|)))
(let (($x246 (= ?x337 (bvadd ?x179 |pd-source-1:p1-open-rmw-1|))))
(not $x246))))))
(check-sat)
