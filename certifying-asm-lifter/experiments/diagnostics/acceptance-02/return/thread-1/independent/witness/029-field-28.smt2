; benchmark generated from python API
(set-info :status unknown)
(declare-fun |pd-source-0:p1-open-rmw-3| () (_ BitVec 32))
(declare-fun |pd-source-0:p1-open-read-2| () (_ BitVec 32))
(declare-fun |object:x| () (_ BitVec 64))
(declare-fun |object:input_a| () (_ BitVec 64))
(assert
 (let (($x260 (= |pd-source-0:p1-open-read-2| (_ bv0 32))))
(let (($x207 (= $x260 (= |pd-source-0:p1-open-read-2| |pd-source-0:p1-open-rmw-3|))))
(let (($x3179 (not $x207)))
(let (($x100 (and (and (distinct |object:input_a| (_ bv0 64)) true) (= (bvand |object:input_a| (_ bv3 64)) (_ bv0 64)))))
(let (($x129 (and (and (distinct |object:input_a| |object:x|) true) $x100 (and (and (distinct |object:x| (_ bv0 64)) true) (= (bvand |object:x| (_ bv3 64)) (_ bv0 64))))))
(and $x129 $x3179)))))))
(check-sat)
