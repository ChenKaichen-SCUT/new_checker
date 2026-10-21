; benchmark generated from python API
(set-info :status unknown)
(declare-fun |object:x| () (_ BitVec 64))
(declare-fun |object:input_b| () (_ BitVec 64))
(assert
 (let (($x73 (and true true true true true true true true true true true true true true true true true true true true)))
(let (($x47 (and (and (distinct |object:input_b| (_ bv0 64)) true) (= (bvand |object:input_b| (_ bv3 64)) (_ bv0 64)))))
(let (($x28 (and (and (distinct |object:input_b| |object:x|) true) $x47 (and (and (distinct |object:x| (_ bv0 64)) true) (= (bvand |object:x| (_ bv3 64)) (_ bv0 64))))))
(and $x28 (not $x73))))))
(check-sat)
