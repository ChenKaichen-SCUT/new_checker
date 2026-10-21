; benchmark generated from python API
(set-info :status unknown)
(declare-fun |object:input_b| () (_ BitVec 64))
(declare-fun |object:side| () (_ BitVec 64))
(assert
 (let ((?x48 ((_ zero_extend 1) |object:input_b|)))
(let (($x31 (or (bvule (bvadd ?x48 (_ bv4 65)) ((_ zero_extend 1) |object:side|)) (bvule (bvadd ((_ zero_extend 1) |object:side|) (_ bv4 65)) ?x48))))
(let (($x651 (and (and (distinct |object:input_b| (_ bv0 64)) true) (= (bvand |object:input_b| (_ bv3 64)) (_ bv0 64)))))
(and (and (distinct |object:input_b| |object:side|) true) $x651 (and (and (distinct |object:side| (_ bv0 64)) true) (= (bvand |object:side| (_ bv3 64)) (_ bv0 64))) $x31)))))
(check-sat)
