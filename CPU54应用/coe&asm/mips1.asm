.text 0x00000000
start:
addi $s0, $zero, 0x00001000
addi $s1, $zero, 0x00001028
addi $s2, $zero, 0x00001034
addi $s3, $zero, 0x00001044
addi $s4, $zero, 0x0000104c
addi $s5, $zero, 128
addi $s6, $zero, 50
addi $s7, $zero, 240
addi $t8, $zero, 50
addi $t9, $zero, 240
lui $k0, 0x1		
addi $gp, $zero, 8		
addi $at, $zero, 0	
addi $t1, $zero, 100
sw $t1, 0($s2)	


add $t1, $zero, $zero
add $t2, $zero, $zero
addi $t3, $zero, 512
addi $t4, $zero, 140
lw $t5, 12($s4)		
lw $t7, 8($s1)	
estart1:
sw $t7, 0($t5)
addi $t5, $t5, 1
addi $t1, $t1, 1
bne $t1, $t3, estart1
add $t1, $zero, $zero
addi $t2, $t2, 1
bne $t2, $t4, estart1

lw $v0, 16($s4)		
add $t1, $zero, $zero	//���ڱ�����Ļ��x
addi $t4, $zero, 340	//��Ļ���
lw $t7, 8($s1)		//��ȡ��ɫ������
estart2:
lw $t7, 0($v0)		//ȡpicstart����
sw $t7, 0($t5)
addi $t5, $t5, 1
addi $t1, $t1, 1
addi $v0, $v0, 1		//ȡ��һ����
bne $t1, $t3, estart2
add $t1, $zero, $zero
addi $t2, $t2, 1
bne $t2, $t4, estart2

add $t1, $zero, $zero	//���ڱ�����Ļ��x
addi $t4, $zero, 480	//��Ļ���
lw $t7, 8($s1)		//��ȡ��ɫ������
estart3:
sw $t7, 0($t5)
addi $t5, $t5, 1
addi $t1, $t1, 1
bne $t1, $t3, estart3
add $t1, $zero, $zero
addi $t2, $t2, 1
bne $t2, $t4, estart3
//д��ӭ������ɣ��ȴ��س���ʼ��Ϸ

judgeplay:
//�س���ʼ,sw keyboard ˫�ؿ���
lw $t3, 0($s4)		//��ȡ�洢��sw����LEDд��ַ
lw $t1, 0($t3)		//��ȡsw����
add $t4, $t1, $t1		//������λ��sw��LED����
add $t4, $t4, $t4
sw $t4, 0($t3)		//��LED��ʾ
lw $t2, 36($s0)		//��ȡsw12 �س���ֵ
and $t2, $t1, $t2		//sw12=1������
bne $t2, $zero, wbackground	//if sw12 == 1, play
lw $t3, 8($s4)		//��ȡ�洢��keyboard��ַ
lw $t1, 0($t3)		//��ȡkeyboard����
lw $t2, 16($s0)		//��ȡkbenter �س���ֵ
beq $t1, $t2, wbackground	//if kbkey == enter, play
j judgeplay

wbackground:
//д������ɫ��
add $t1, $zero, $zero	//���ڱ�����Ļ��x
add $t2, $zero, $zero	//���ڱ�����Ļ��y
addi $t3, $zero, 512	//��Ļ����
addi $t4, $zero, 480	//��Ļ���
lw $t5, 12($s4)		//��ȡ�洢��vram��ַ
lw $t7, 8($s1)		//��ȡ��ɫ������
wbg:
sw $t7, 0($t5)
addi $t5, $t5, 1
addi $t1, $t1, 1
bne $t1, $t3, wbg
add $t1, $zero, $zero
addi $t2, $t2, 1
bne $t2, $t4, wbg
//д������ɣ���ʽ��ʼ��Ϸ

play:
//��ȡsw��keyboard������������
addi $k0, $k0, -1		//��ȡsw������ӳ�
bne $k0, $zero, play
lui $k0, 0x1		//player������ 65536
//��ȡsw
lw $t3, 0($s4)		//��ȡ�洢��sw����LEDд��ַ
lw $t1, 0($t3)		//��ȡsw����
add $t4, $t1, $t1		//������λ��sw��LED����
add $t4, $t4, $t4
sw $t4, 0($t3)		//��LED��ʾ
lw $t2, 20($s0)		//��ȡsw11 �ϵ�����
and $t2, $t1, $t2		//sw12=1������
bne $t2, $zero, up		//if sw12 == 1, play
lw $t2, 24($s0)		//��ȡsw10 �ϵ�����
and $t2, $t1, $t2		//sw12=1������
bne $t2, $zero, down	//if sw12 == 1, play
lw $t2, 28($s0)		//��ȡsw9 �ϵ�����
and $t2, $t1, $t2		//sw12=1������
bne $t2, $zero, left	//if sw12 == 1, play
lw $t2, 32($s0)		//��ȡsw8 �ϵ�����
and $t2, $t1, $t2		//sw12=1������
bne $t2, $zero, right	//if sw12 == 1, play
//��ȡkeyboard
lw $t3, 8($s4)		//��ȡ�洢��keyboard��ַ
lw $t1, 0($t3)		//��ȡkeyboard����
lw $t2, 0($s0)		//��ȡkbenter ����ֵ
beq $t1, $t2, up		//if kbkey == up, up
lw $t2, 4($s0)		//��ȡkbenter ����ֵ
beq $t1, $t2, down		//if kbkey == down, down
lw $t2, 8($s0)		//��ȡkbenter ����ֵ
beq $t1, $t2, left		//if kbkey == left, left
lw $t2, 12($s0)		//��ȡkbenter ����ֵ
beq $t1, $t2, right		//if kbkey == right, right
addi $t9, $t9, 3		//���������ƶ�
j judgeplayer

up:
addi $t9, $t9, -3		//�����ƶ�
j judgeplayer
down:
addi $t9, $t9, 3		//�����ƶ�
addi $t9, $t9, 3		//���������ƶ�
j judgeplayer
left:
addi $t8, $t8, -3		//�����ƶ�
addi $t9, $t9, 3		//���������ƶ�
j judgeplayer
right:
addi $t8, $t8, 3		//�����ƶ�
addi $t9, $t9, 3		//���������ƶ�
j judgeplayer

judgeplayer:
//�ж�next player�Ƿ����Ļ
lw $t0, 0($s3)		//��ȡplayer size
addi $t3, $zero, 512	//��Ļx-player size
addi $t4, $zero, 480	//��Ļy-player size
sub $t3, $t3, $t0
sub $t4, $t4, $t0
slt $t1, $t8, $t3		//wether cat_x < 502
slt $t2, $t9, $t4		//wether cat_y < 470
and $t7, $t1, $t2		//�ȽϽ���ݴ���t7
//�ж�player�Ƿ���������ײ
add $a2, $t0, $t0		//x���������ȣ�player width+wall width��
lw $a3, 4($s3)		//y���������ȣ�ȱ�ڿ��-player length��
sub $a3, $a3, $t0
addi $t2, $zero, 4		//��ʼ��ǽ�ڸ����ƴ�
add $t3, $zero, $s5		//��һ��ǽ�ڵ�x
add $t4, $zero, $s2		//����ǽ��y���׵�ַ
add $t5, $s6, $t0		//curr player x����+player width
add $t6, $zero, $s7		

judgenextw:
beq $t2, $zero, endjudge	
lw $a0, 0($t4)		
sub $t1, $t5, $t3	
slt $t1, $t1, $a2		
addi $t2, $t2, -1		
addi $t3, $t3, 128	
addi $t4, $t4, 4 		
beq $t1, $zero, judgenextw	
sub $t1, $t6, $a0		
slt $t1, $t1, $a3 	
and $t7, $t7, $t1	
bne $t2, $zero, judgenextw

endjudge:
beq $t7, $zero, start

displayplayer:
addi $gp, $gp, -1
lw $t2, 0($s3)	
lw $t6, 12($s4)	
lw $t7, 8($s1)	
add $t1, $s7, $s7
add $t1, $t1, $t1
add $t1, $t1, $t1
add $t1, $t1, $t1
add $t1, $t1, $t1
add $t1, $t1, $t1
add $t1, $t1, $t1
add $t1, $t1, $t1
add $t1, $t1, $t1
add $t1, $t1, $s6	
add $t1, $t1, $t6
eplayercol:
lw $t3, 0($s3)	
add $t4, $zero, $t1
eplayerrow:
sw 	$t7, 0($t4)
addi $t4, $t4, 1
addi $t3, $t3, -1
bne $t3, $zero, eplayerrow
addi $t1, $t1, 512
addi $t2, $t2, -1
bne $t2, $zero, eplayercol

wplayer:

add $s6, $zero, $t8
add $s7, $zero ,$t9
lw $t2, 0($s3)		
lw $t6, 12($s4)		
//lw $t7, 0($s1)		
lw $v0, 24($s4)		
add $t1, $s7, $s7		
add $t1, $t1, $t1
add $t1, $t1, $t1
add $t1, $t1, $t1
add $t1, $t1, $t1
add $t1, $t1, $t1
add $t1, $t1, $t1
add $t1, $t1, $t1
add $t1, $t1, $t1
add $t1, $t1, $s6		
add $t1, $t1, $t6	
wplayercol:
lw $t3, 0($s3)		
add $t4, $zero, $t1
wplayerrow:
lw $t7, 0($v0)
sw 	$t7, 0($t4)
addi $v0, $v0, 1	
addi $t4, $t4, 1
addi $t3, $t3, -1
bne $t3, $zero, wplayerrow
addi $t1, $t1, 512
addi $t2, $t2, -1
bne $t2, $zero, wplayercol

wall:
bne $gp, $zero, play	
addi $gp, $zero, 8		
addi $at, $at, 1	
//��������ǽ��
addi $t3, $zero, 480
lw $t7, 8($s1)		
lw $t1, 12($s4)		
add $t1, $t1, $s5		
enextrow:
addi $t4, $zero, 4		
add $t2, $zero, $t1
enextwall:
lw $t0, 0($s3)		
add $t5, $zero, $t2
esize:
sw $t7, 0($t5)
addi $t5, $t5, 1		
addi $t0, $t0, -1
bne $t0, $zero, esize
addi $t2, $t2, 128		
addi $t4, $t4, -1		
bne $t4, $zero, enextwall
addi $t1, $t1, 512		
addi $t3, $t3, -1		
bne $t3, $zero, enextrow	

addi $s5, $s5, -10
addi $t1, $zero, 480
slt $t1, $s5, $t1	
bne $t1, $zero, wwall	
addi $s5, $zero, 128	
lw $t2, 0($s2)		
lw $t1, 4($s2)	
sw $t1, 0($s2)
lw $t1, 8($s2)
sw $t1, 4($s2)
lw $t1, 12($s2)
sw $t1, 8($s2)
add $t1, $t2, $t2		
addi $t1, $t1, 88		
andi $t1, $t1, 399	
sw $t1, 12($s2)		

wwall:
addi $t3, $zero, 480	
lw $t1, 12($s4)	
lw $v0, 20($s4)		
add $t1, $t1, $s5	
wnextrow:
addi $t4, $zero, 4		
add $t2, $zero, $t1
wnextwall:
lw $t0, 0($s3)		
add $t5, $zero, $t2
wsize:
lw $t7, 0($v0)	
sw $t7, 0($t5)
addi $t5, $t5, 1		
addi $v0, $v0, 1		
addi $t0, $t0, -1
bne $t0, $zero, wsize
addi $t2, $t2, 128
addi $v0, $v0, -20		
addi $t4, $t4, -1	
bne $t4, $zero, wnextwall
addi $t1, $t1, 512
addi $t3, $t3, -1	
bne $t3, $zero, wnextrow
lw $t6, 12($s4)		
lw $t7, 8($s1)		
addi $t4, $zero, 4		
add $t3, $zero, $s5		
add $t2, $zero, $s2	
eopenings:
lw $t5, 4($s3)		
lw $t1, 0($t2)		
add $t1, $t1, $t1		
add $t1, $t1, $t1
add $t1, $t1, $t1
add $t1, $t1, $t1
add $t1, $t1, $t1
add $t1, $t1, $t1
add $t1, $t1, $t1
add $t1, $t1, $t1
add $t1, $t1, $t1
add $t1, $t1, $t3		
add $t1, $t1, $t6	
eopenrow:
lw $t0, 0($s3)		
add $k1, $zero, $t1
eopensize:
sw $t7, 0($k1)
addi $k1, $k1, 1
addi $t0, $t0, -1
bne $t0, $zero, eopensize
addi $t1, $t1, 512
addi $t5, $t5, -1
bne $t5, $zero, eopenrow
addi $t2, $t2, 4
addi $t3, $t3, 128
addi $t4, $t4, -1
bne $t4, $zero, eopenings

live:
lw $t3, 4($s4)
sw $at, 0($t3)

j play


.data 0x00001000
kbup: 	.word 629
kbdown:	.word 626
kbleft:	.word 619
kbright:	.word 628
kbenter:	.word 90
swup:	.word 2048	
swdown:	.word 1024	
swleft:	.word 512	
swright:	.word 256	
swenter:	.word 4096


red:	.word 0x00f
green:	.word 0x3b7
blue:	.word 0xcc4

wall_y1:	.word 100
wall_y2:	.word 400
wall_y3:	.word 300
wall_y4:	.word 200

playerlen:	.word 20
openinglen:	.word 80
LEDcounter:	.word 0xf0000000
seg7:	.word 0xe0000000
keyborad:	.word 0xd0000000
vram:	.word 0xc0000000
picstart:	.word 0xb0000000
picwall:	.word 0xa0000000
picbird:	.word 0x90000000