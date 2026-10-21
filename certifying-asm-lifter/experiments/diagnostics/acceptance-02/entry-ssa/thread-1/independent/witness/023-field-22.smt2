; benchmark generated from python API
(set-info :status unknown)
(declare-fun |pd-source-0:p1-open-rmw-3| () (_ BitVec 32))
(declare-fun |pd-source-0:p1-open-read-2| () (_ BitVec 32))
(declare-fun |object:x| () (_ BitVec 64))
(declare-fun |object:input_a| () (_ BitVec 64))
(assert
 (let (($x263 (= |pd-source-0:p1-open-rmw-3| (_ bv0 32))))
(let (($x239 (= $x263 (= |pd-source-0:p1-open-read-2| |pd-source-0:p1-open-rmw-3|))))
(let (($x2598 (not $x239)))
(let (($x190 (and (and (distinct |object:input_a| (_ bv0 64)) true) (= (bvand |object:input_a| (_ bv3 64)) (_ bv0 64)))))
(let (($x128 (and (and (distinct |object:input_a| |object:x|) true) $x190 (and (and (distinct |object:x| (_ bv0 64)) true) (= (bvand |object:x| (_ bv3 64)) (_ bv0 64))))))
(and $x128 $x2598)))))))
(check-sat)
