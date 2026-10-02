INCLUDE <ASMInclude.asm>
INCLUDE <AMTFlags.asm>

public ToggleNearCulling
public ToggleNearCulling_End
public ToggleNearCulling_Bindings

.DATA

ToggleNearCulling_Bindings	DWORD		0
bind0						DWORD		b0+2

.CODE

ToggleNearCulling:
b0:	test s8 ds:[NO_ADDRESS], FLAG1_DISABLE_NEAR_CULLING
	jne d0
	subss xmm3, xmm2
	xorps xmm2, xmm2
	maxss xmm2, xmm3
ToggleNearCulling_End:

d0 = ToggleNearCulling+21

END
