; benchmark generated from python API
(set-info :status unknown)
(declare-fun |object:input_b| () (_ BitVec 64))
(declare-fun |object:x| () (_ BitVec 64))
(assert
 (let ((?x252 ((_ zero_extend 1) |object:input_b|)))
(let (($x2562 (or (bvule (bvadd ?x252 (_ bv4 65)) ((_ zero_extend 1) |object:x|)) (bvule (bvadd ((_ zero_extend 1) |object:x|) (_ bv4 65)) ?x252))))
(let (($x143 (and (and (distinct |object:input_b| (_ bv0 64)) true) (= (bvand |object:input_b| (_ bv3 64)) (_ bv0 64)))))
(and (and (distinct |object:input_b| |object:x|) true) $x143 (and (and (distinct |object:x| (_ bv0 64)) true) (= (bvand |object:x| (_ bv3 64)) (_ bv0 64))) $x2562)))))
(check-sat)
