; benchmark generated from python API
(set-info :status unknown)
(declare-fun |pd-source-1:p1-open-rmw-1| () (_ BitVec 32))
(declare-fun |pd-source-1:p1-open-read-0| () (_ BitVec 32))
(declare-fun |pd-source-1:p1-open-read-2| () (_ BitVec 32))
(assert
 (let ((?x1570 (ite (= (ite (= (_ bv2 32) |pd-source-1:p1-open-read-2|) (_ bv1 1) (_ bv0 1)) (_ bv1 1)) |pd-source-1:p1-open-read-0| (_ bv0 32))))
(let (($x384 (= (_ bv2 32) |pd-source-1:p1-open-read-2|)))
(let ((?x561 (ite $x384 (bvadd |pd-source-1:p1-open-read-0| |pd-source-1:p1-open-rmw-1|) |pd-source-1:p1-open-rmw-1|)))
(let (($x532 (= ?x561 (bvadd ?x1570 |pd-source-1:p1-open-rmw-1|))))
(not $x532))))))
(check-sat)
