; benchmark generated from python API
(set-info :status unknown)
(declare-fun |pd-source-0:p1-open-rmw-1| () (_ BitVec 32))
(declare-fun |pd-source-0:p1-open-read-0| () (_ BitVec 32))
(declare-fun |pd-source-0:p1-open-read-2| () (_ BitVec 32))
(assert
 (let ((?x140 (ite (= (ite (= (_ bv2 32) |pd-source-0:p1-open-read-2|) (_ bv1 1) (_ bv0 1)) (_ bv1 1)) |pd-source-0:p1-open-read-0| (_ bv0 32))))
(let ((?x75 (bvadd |pd-source-0:p1-open-read-0| |pd-source-0:p1-open-rmw-1|)))
(let (($x76 (= (_ bv2 32) |pd-source-0:p1-open-read-2|)))
(let ((?x77 (ite $x76 ?x75 |pd-source-0:p1-open-rmw-1|)))
(let (($x138 (= ?x77 (bvadd ?x140 |pd-source-0:p1-open-rmw-1|))))
(not $x138)))))))
(check-sat)
