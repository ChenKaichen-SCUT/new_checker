; benchmark generated from python API
(set-info :status unknown)
(declare-fun |object:input_b| () (_ BitVec 64))
(declare-fun |object:x| () (_ BitVec 64))
(assert
 (let ((?x1173 ((_ zero_extend 1) |object:input_b|)))
(let (($x109 (or (bvule (bvadd ?x1173 (_ bv4 65)) ((_ zero_extend 1) |object:x|)) (bvule (bvadd ((_ zero_extend 1) |object:x|) (_ bv4 65)) ?x1173))))
(let (($x196 (and (and (distinct |object:input_b| (_ bv0 64)) true) (= (bvand |object:input_b| (_ bv3 64)) (_ bv0 64)))))
(and (and (distinct |object:input_b| |object:x|) true) $x196 (and (and (distinct |object:x| (_ bv0 64)) true) (= (bvand |object:x| (_ bv3 64)) (_ bv0 64))) $x109)))))
(check-sat)
