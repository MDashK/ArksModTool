INCLUDE <ASMInclude.asm>
INCLUDE <AMTFlags.asm>

public ToggleFarCulling
public ToggleFarCulling_End
public ToggleFarCulling_Bindings

.DATA

ToggleFarCulling_Bindings	DWORD		0
bind0						DWORD		b0+2

.CODE

ToggleFarCulling:
	test s8 [esi+1B], 20
	je d0
	mov eax, [esi+28]
	mov edx, [esi+2C]
	test edx, 00000600
	jne d1
d0:	jmp d3
d1:
b0:	test s8 ds:[NO_ADDRESS], FLAG1_DISABLE_FAR_CULLING
	jne d4
	movss xmm1, [esi+64]
	test al, 80
	je d2
	movss xmm1, [esi+60]
d2:	nopx 2
ToggleFarCulling_End:

d3 = ToggleFarCulling+280
d4 = ToggleFarCulling+52

END
