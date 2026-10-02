INCLUDE <ASMInclude.asm>
INCLUDE <AMTFlags.asm>

public ToggleUpdateCulling
public ToggleUpdateCulling_End
public ToggleUpdateCulling_Bindings

.DATA

ToggleUpdateCulling_Bindings	DWORD		0
bind0							DWORD		b0+2
bind1							DWORD		b1+4
bind2							DWORD		b2+4

.CODE

ToggleUpdateCulling:
b0:	test s8 ds:[NO_ADDRESS], FLAG1_DISABLE_UPDATE_CULLING
	jne d2
	cvtss2sd xmm1, [ecx+000000D0]
	cvtss2sd xmm0, [ecx+64]
	comisd xmm1, xmm0
	ja d3
	test al, 04
	jne d0
	test al, 01
	je d1
	test al, 02
	jne d1
d0:
b1:	comisd xmm1, qword ptr ds:[NO_ADDRESS]
	ja d3
d1:	cvtss2sd xmm0, [ebp+1C]
b2:	comisd xmm0, qword ptr ds:[NO_ADDRESS]
	jna d2
	test s8 [ecx+2C], 01
	jne d3
	comisd xmm1, xmm0
	ja d3
d2:	xor esi, esi
	jmp d4
d3:	xor esi, esi
	inc esi
	nopx 1
d4:
ToggleUpdateCulling_End:

END
