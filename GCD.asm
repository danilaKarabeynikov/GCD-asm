CodeSegment segment
			assume cs:CodeSegment, ds:DataSegment, ss:StackSegment
			
Main		proc

			mov	ax, DataSegment
			mov ds, ax
			xor ax, ax
			
	@@algorithm:
			mov dx, 0
			mov ax, number1
			div number2
			cmp dx, 0
			jz @@exit
			
			mov bx, number2
			mov number1, bx
			mov number2, dx
			jmp @@algorithm
			
		@@exit:
			mov ax, number2
			aam
			add ax, 3030h
			mov bx, ax
			mov ah, 02h
			mov dl, bh
			int 21h
			mov dl, bl
			int 21h
			
			mov ax, 4c00h
			int 21h
Main		endp

CodeSegment ends

DataSegment segment
number1 dw 15
number2 dw 21
DataSegment ends

StackSegment segment stack 'stack'
			db 1024 dup (?)
StackSegment ends

	end Main