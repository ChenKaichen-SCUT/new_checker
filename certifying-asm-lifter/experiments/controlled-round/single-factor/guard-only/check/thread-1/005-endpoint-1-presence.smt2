; benchmark generated from python API
(set-info :status unknown)
(declare-fun |entry:LlvmCmpXchg.oldValue#1| () (_ BitVec 32))
(declare-fun u0 () (_ BitVec 32))
(assert
 (let (($x26 (not (not (= (_ bv0 32) (ite (or true) u0 |entry:LlvmCmpXchg.oldValue#1|))))))
(let (($x51 (or true)))
(let (($x75 (or $x51)))
(let (($x46 (and $x75 (not $x26))))
(let (($x31 (or $x46)))
(let (($x11 (= u0 (_ bv0 32))))
(let (($x35 (= $x11 $x31)))
(not $x35)))))))))
(check-sat)
