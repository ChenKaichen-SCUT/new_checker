; benchmark generated from python API
(set-info :status unknown)
(declare-fun |object:input_b| () (_ BitVec 64))
(declare-fun |object:side| () (_ BitVec 64))
(assert
 (let (($x9 (= |object:side| |object:input_b|)))
(let (($x68 (not $x9)))
(let (($x512 (and (and (distinct |object:input_b| (_ bv0 64)) true) (= (bvand |object:input_b| (_ bv3 64)) (_ bv0 64)))))
(let (($x60 (and (and (distinct |object:input_b| |object:side|) true) $x512 (and (and (distinct |object:side| (_ bv0 64)) true) (= (bvand |object:side| (_ bv3 64)) (_ bv0 64))))))
(and $x60 $x68))))))
(check-sat)
