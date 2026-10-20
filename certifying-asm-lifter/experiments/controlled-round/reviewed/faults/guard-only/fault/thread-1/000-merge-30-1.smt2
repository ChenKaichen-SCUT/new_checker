; benchmark generated from python API
(set-info :status unknown)
(declare-fun |entry:LlvmCmpXchg.oldValue#1| () (_ BitVec 32))
(declare-fun u0 () (_ BitVec 32))
(assert
 (let (($x35 (not (not (= (_ bv0 32) (ite (or true) u0 |entry:LlvmCmpXchg.oldValue#1|))))))
(let (($x76 (or true)))
(let (($x72 (or $x76)))
(let (($x37 (and $x72 $x35)))
(let (($x27 (and $x72 (not $x35))))
(let (($x14 (or $x27)))
(let (($x51 (not (and $x14 $x37))))
(not $x51)))))))))
(check-sat)
