; benchmark generated from python API
(set-info :status unknown)
(declare-fun |object:input_b| () (_ BitVec 64))
(declare-fun |object:x| () (_ BitVec 64))
(assert
 (let (($x73 (and true true true true true true true true true true true true true true true true true true true true)))
(let ((?x20 ((_ zero_extend 1) |object:input_b|)))
(let (($x56 (or (bvule (bvadd ?x20 (_ bv4 65)) ((_ zero_extend 1) |object:x|)) (bvule (bvadd ((_ zero_extend 1) |object:x|) (_ bv4 65)) ?x20))))
(let (($x37 (and (and (distinct |object:input_b| (_ bv0 64)) true) (= (bvand |object:input_b| (_ bv3 64)) (_ bv0 64)))))
(let (($x128 (and (and (distinct |object:input_b| |object:x|) true) $x37 (and (and (distinct |object:x| (_ bv0 64)) true) (= (bvand |object:x| (_ bv3 64)) (_ bv0 64))) $x56)))
(and $x128 (not $x73))))))))
(check-sat)
