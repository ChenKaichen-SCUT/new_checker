; benchmark generated from python API
(set-info :status unknown)
(declare-fun |object:x| () (_ BitVec 64))
(declare-fun |object:input_a| () (_ BitVec 64))
(assert
 (let (($x126 (= |object:input_a| |object:x|)))
(let (($x301 (not $x126)))
(let ((?x155 ((_ zero_extend 1) |object:input_a|)))
(let (($x229 (or (bvule (bvadd ?x155 (_ bv4 65)) ((_ zero_extend 1) |object:x|)) (bvule (bvadd ((_ zero_extend 1) |object:x|) (_ bv4 65)) ?x155))))
(let (($x196 (and (and (distinct |object:input_a| (_ bv0 64)) true) (= (bvand |object:input_a| (_ bv3 64)) (_ bv0 64)))))
(let (($x25 (and (and (distinct |object:input_a| |object:x|) true) $x196 (and (and (distinct |object:x| (_ bv0 64)) true) (= (bvand |object:x| (_ bv3 64)) (_ bv0 64))) $x229)))
(and $x25 $x301))))))))
(check-sat)
