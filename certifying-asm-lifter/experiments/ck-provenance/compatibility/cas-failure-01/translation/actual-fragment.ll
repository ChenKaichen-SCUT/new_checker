  %cert_8929d410e519_0 = cmpxchg i32* @x, i32 0, i32 2 monotonic monotonic, !dbg !13
  %cert_8929d410e519_1 = extractvalue {i32, i1} %cert_8929d410e519_0, 0, !dbg !13
  %2 = add i32 0, %cert_8929d410e519_1, !dbg !13
