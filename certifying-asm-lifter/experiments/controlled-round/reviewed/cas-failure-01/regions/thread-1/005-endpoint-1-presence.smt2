; benchmark generated from python API
(set-info :status unknown)
(declare-fun |entry:LlvmCmpXchg.oldValue#1| () (_ BitVec 32))
(declare-fun u0 () (_ BitVec 32))
(assert
 (let (($x25 (not (= (_ bv0 32) (ite (or true) u0 |entry:LlvmCmpXchg.oldValue#1|)))))
(let (($x38 (or true)))
(let (($x43 (or $x38)))
(let (($x35 (and $x43 (not $x25))))
(let (($x70 (or $x35)))
(let (($x56 (= u0 (_ bv0 32))))
(let (($x64 (= $x56 $x70)))
(not $x64)))))))))
(check-sat)
