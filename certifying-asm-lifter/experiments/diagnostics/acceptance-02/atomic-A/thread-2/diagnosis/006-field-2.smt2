; benchmark generated from python API
(set-info :status unknown)
(declare-fun |pd-source-1:p1-open-rmw-1| () (_ BitVec 32))
(declare-fun |pd-source-1:p1-open-read-0| () (_ BitVec 32))
(declare-fun |object:side| () (_ BitVec 64))
(declare-fun |object:input_b| () (_ BitVec 64))
(assert
 (let (($x41 (= (= |pd-source-1:p1-open-read-0| (_ bv0 32)) (= |pd-source-1:p1-open-rmw-1| (_ bv0 32)))))
(let (($x80 (not $x41)))
(let (($x46 (and (and (distinct |object:input_b| (_ bv0 64)) true) (= (bvand |object:input_b| (_ bv3 64)) (_ bv0 64)))))
(let (($x13 (and (and (distinct |object:input_b| |object:side|) true) $x46 (and (and (distinct |object:side| (_ bv0 64)) true) (= (bvand |object:side| (_ bv3 64)) (_ bv0 64))))))
(and $x13 $x80))))))
(check-sat)
