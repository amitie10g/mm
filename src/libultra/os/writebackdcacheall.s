#include "PR/asm.h"
#include "PR/regdef.h"
#include "PR/R4300.h"

.text

LEAF(osWritebackDCacheAll)
    li      t0, K0BASE
    li      t2, DCACHE_SIZE
    addu    t1, t0, t2
    addu    t1, t1, -DCACHE_LINESIZE
1:
    CACHE(  (CACH_PD | C_IWBINV), (t0))
.set noreorder
    bltu    t0, t1, 1b
     addu   t0, DCACHE_LINESIZE
.set reorder
    jr      ra
END(osWritebackDCacheAll)
