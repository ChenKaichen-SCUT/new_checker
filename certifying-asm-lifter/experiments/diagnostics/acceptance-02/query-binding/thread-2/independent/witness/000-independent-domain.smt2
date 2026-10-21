; benchmark generated from python API
(set-info :status unknown)
(declare-fun |object:side| () (_ BitVec 64))
(declare-fun |object:input_b| () (_ BitVec 64))
(assert
 (let (($x404 (and (and (distinct |object:input_b| (_ bv0 64)) true) (= (bvand |object:input_b| (_ bv3 64)) (_ bv0 64)))))
(and (and (distinct |object:input_b| |object:side|) true) $x404 (and (and (distinct |object:side| (_ bv0 64)) true) (= (bvand |object:side| (_ bv3 64)) (_ bv0 64))))))
(check-sat)
