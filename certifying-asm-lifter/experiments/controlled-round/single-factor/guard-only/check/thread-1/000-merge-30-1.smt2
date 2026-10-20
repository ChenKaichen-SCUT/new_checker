; benchmark generated from python API
(set-info :status unknown)
(declare-fun |entry:LlvmCmpXchg.oldValue#1| () (_ BitVec 32))
(declare-fun u0 () (_ BitVec 32))
(assert
 (let (($x26 (not (not (= (_ bv0 32) (ite (or true) u0 |entry:LlvmCmpXchg.oldValue#1|))))))
(let (($x51 (or true)))
(let (($x75 (or $x51)))
(let (($x40 (and $x75 $x26)))
(let (($x46 (and $x75 (not $x26))))
(let (($x31 (or $x46)))
(let (($x57 (not (and $x31 $x40))))
(not $x57)))))))))
(check-sat)
