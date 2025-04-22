	.att_syntax
	.text
	.p2align	5
	.globl	_jyh_aria_set_encrypt_key
	.globl	jyh_aria_set_encrypt_key
_jyh_aria_set_encrypt_key:
jyh_aria_set_encrypt_key:
	movq	%rsp, %r10
	leaq	-16(%rsp), %rsp
	andq	$-1, %rsp
	movl	$0, %eax
	cmpl	$128, %esi
	je  	Ljyh_aria_set_encrypt_key$9
	cmpl	$192, %esi
	je  	Ljyh_aria_set_encrypt_key$11
	cmpl	$256, %esi
	je  	Ljyh_aria_set_encrypt_key$13
	movl	$-2, %eax
	jmp 	Ljyh_aria_set_encrypt_key$10
Ljyh_aria_set_encrypt_key$13:
	movl	$16, %ecx
Ljyh_aria_set_encrypt_key$14:
	jmp 	Ljyh_aria_set_encrypt_key$10
Ljyh_aria_set_encrypt_key$11:
	movl	$14, %ecx
Ljyh_aria_set_encrypt_key$12:
	jmp 	Ljyh_aria_set_encrypt_key$10
Ljyh_aria_set_encrypt_key$9:
	movl	$12, %ecx
Ljyh_aria_set_encrypt_key$10:
	movl	%ecx, 272(%rdx)
	movl	$0, %esi
	jmp 	Ljyh_aria_set_encrypt_key$7
Ljyh_aria_set_encrypt_key$8:
	addl	$4, %esi
Ljyh_aria_set_encrypt_key$7:
	cmpl	$16, %esi
	jb  	Ljyh_aria_set_encrypt_key$8
	movl	$0, %esi
	jmp 	Ljyh_aria_set_encrypt_key$5
Ljyh_aria_set_encrypt_key$6:
	addl	$4, %esi
Ljyh_aria_set_encrypt_key$5:
	cmpl	$16, %esi
	jb  	Ljyh_aria_set_encrypt_key$6
	movl	$0, %esi
	jmp 	Ljyh_aria_set_encrypt_key$3
Ljyh_aria_set_encrypt_key$4:
	addl	$4, %esi
Ljyh_aria_set_encrypt_key$3:
	cmpl	$16, %esi
	jb  	Ljyh_aria_set_encrypt_key$4
	movb	(%rsp), %sil
	movb	%sil, (%rdx)
	movb	1(%rsp), %sil
	movb	%sil, 1(%rdx)
	movb	2(%rsp), %sil
	movb	%sil, 2(%rdx)
	movb	3(%rsp), %sil
	movb	%sil, 3(%rdx)
	movb	4(%rsp), %sil
	movb	%sil, 4(%rdx)
	movb	5(%rsp), %sil
	movb	%sil, 5(%rdx)
	movb	6(%rsp), %sil
	movb	%sil, 6(%rdx)
	movb	7(%rsp), %sil
	movb	%sil, 7(%rdx)
	movb	8(%rsp), %sil
	movb	%sil, 8(%rdx)
	movb	9(%rsp), %sil
	movb	%sil, 9(%rdx)
	movb	10(%rsp), %sil
	movb	%sil, 10(%rdx)
	movb	11(%rsp), %sil
	movb	%sil, 11(%rdx)
	movb	12(%rsp), %sil
	movb	%sil, 12(%rdx)
	movb	13(%rsp), %sil
	movb	%sil, 13(%rdx)
	movb	14(%rsp), %sil
	movb	%sil, 14(%rdx)
	movb	(%rsp), %sil
	movb	%sil, 16(%rdx)
	movb	1(%rsp), %sil
	movb	%sil, 17(%rdx)
	movb	2(%rsp), %sil
	movb	%sil, 18(%rdx)
	movb	3(%rsp), %sil
	movb	%sil, 19(%rdx)
	movb	4(%rsp), %sil
	movb	%sil, 20(%rdx)
	movb	5(%rsp), %sil
	movb	%sil, 21(%rdx)
	movb	6(%rsp), %sil
	movb	%sil, 22(%rdx)
	movb	7(%rsp), %sil
	movb	%sil, 23(%rdx)
	movb	8(%rsp), %sil
	movb	%sil, 24(%rdx)
	movb	9(%rsp), %sil
	movb	%sil, 25(%rdx)
	movb	10(%rsp), %sil
	movb	%sil, 26(%rdx)
	movb	11(%rsp), %sil
	movb	%sil, 27(%rdx)
	movb	12(%rsp), %sil
	movb	%sil, 28(%rdx)
	movb	13(%rsp), %sil
	movb	%sil, 29(%rdx)
	movb	14(%rsp), %sil
	movb	%sil, 30(%rdx)
	movb	(%rsp), %sil
	movb	%sil, 32(%rdx)
	movb	1(%rsp), %sil
	movb	%sil, 33(%rdx)
	movb	2(%rsp), %sil
	movb	%sil, 34(%rdx)
	movb	3(%rsp), %sil
	movb	%sil, 35(%rdx)
	movb	4(%rsp), %sil
	movb	%sil, 36(%rdx)
	movb	5(%rsp), %sil
	movb	%sil, 37(%rdx)
	movb	6(%rsp), %sil
	movb	%sil, 38(%rdx)
	movb	7(%rsp), %sil
	movb	%sil, 39(%rdx)
	movb	8(%rsp), %sil
	movb	%sil, 40(%rdx)
	movb	9(%rsp), %sil
	movb	%sil, 41(%rdx)
	movb	10(%rsp), %sil
	movb	%sil, 42(%rdx)
	movb	11(%rsp), %sil
	movb	%sil, 43(%rdx)
	movb	12(%rsp), %sil
	movb	%sil, 44(%rdx)
	movb	13(%rsp), %sil
	movb	%sil, 45(%rdx)
	movb	14(%rsp), %sil
	movb	%sil, 46(%rdx)
	movb	(%rsp), %sil
	movb	%sil, 64(%rdx)
	movb	1(%rsp), %sil
	movb	%sil, 65(%rdx)
	movb	2(%rsp), %sil
	movb	%sil, 66(%rdx)
	movb	3(%rsp), %sil
	movb	%sil, 67(%rdx)
	movb	4(%rsp), %sil
	movb	%sil, 68(%rdx)
	movb	5(%rsp), %sil
	movb	%sil, 69(%rdx)
	movb	6(%rsp), %sil
	movb	%sil, 70(%rdx)
	movb	7(%rsp), %sil
	movb	%sil, 71(%rdx)
	movb	8(%rsp), %sil
	movb	%sil, 72(%rdx)
	movb	9(%rsp), %sil
	movb	%sil, 73(%rdx)
	movb	10(%rsp), %sil
	movb	%sil, 74(%rdx)
	movb	11(%rsp), %sil
	movb	%sil, 75(%rdx)
	movb	12(%rsp), %sil
	movb	%sil, 76(%rdx)
	movb	13(%rsp), %sil
	movb	%sil, 77(%rdx)
	movb	14(%rsp), %sil
	movb	%sil, 78(%rdx)
	movb	(%rsp), %sil
	movb	%sil, 80(%rdx)
	movb	1(%rsp), %sil
	movb	%sil, 81(%rdx)
	movb	2(%rsp), %sil
	movb	%sil, 82(%rdx)
	movb	3(%rsp), %sil
	movb	%sil, 83(%rdx)
	movb	4(%rsp), %sil
	movb	%sil, 84(%rdx)
	movb	5(%rsp), %sil
	movb	%sil, 85(%rdx)
	movb	6(%rsp), %sil
	movb	%sil, 86(%rdx)
	movb	7(%rsp), %sil
	movb	%sil, 87(%rdx)
	movb	8(%rsp), %sil
	movb	%sil, 88(%rdx)
	movb	9(%rsp), %sil
	movb	%sil, 89(%rdx)
	movb	10(%rsp), %sil
	movb	%sil, 90(%rdx)
	movb	11(%rsp), %sil
	movb	%sil, 91(%rdx)
	movb	12(%rsp), %sil
	movb	%sil, 92(%rdx)
	movb	13(%rsp), %sil
	movb	%sil, 93(%rdx)
	movb	14(%rsp), %sil
	movb	%sil, 94(%rdx)
	movb	(%rsp), %sil
	movb	%sil, 96(%rdx)
	movb	1(%rsp), %sil
	movb	%sil, 97(%rdx)
	movb	2(%rsp), %sil
	movb	%sil, 98(%rdx)
	movb	3(%rsp), %sil
	movb	%sil, 99(%rdx)
	movb	4(%rsp), %sil
	movb	%sil, 100(%rdx)
	movb	5(%rsp), %sil
	movb	%sil, 101(%rdx)
	movb	6(%rsp), %sil
	movb	%sil, 102(%rdx)
	movb	7(%rsp), %sil
	movb	%sil, 103(%rdx)
	movb	8(%rsp), %sil
	movb	%sil, 104(%rdx)
	movb	9(%rsp), %sil
	movb	%sil, 105(%rdx)
	movb	10(%rsp), %sil
	movb	%sil, 106(%rdx)
	movb	11(%rsp), %sil
	movb	%sil, 107(%rdx)
	movb	12(%rsp), %sil
	movb	%sil, 108(%rdx)
	movb	13(%rsp), %sil
	movb	%sil, 109(%rdx)
	movb	14(%rsp), %sil
	movb	%sil, 110(%rdx)
	movb	(%rsp), %sil
	movb	%sil, 128(%rdx)
	movb	1(%rsp), %sil
	movb	%sil, 129(%rdx)
	movb	2(%rsp), %sil
	movb	%sil, 130(%rdx)
	movb	3(%rsp), %sil
	movb	%sil, 131(%rdx)
	movb	4(%rsp), %sil
	movb	%sil, 132(%rdx)
	movb	5(%rsp), %sil
	movb	%sil, 133(%rdx)
	movb	6(%rsp), %sil
	movb	%sil, 134(%rdx)
	movb	7(%rsp), %sil
	movb	%sil, 135(%rdx)
	movb	8(%rsp), %sil
	movb	%sil, 136(%rdx)
	movb	9(%rsp), %sil
	movb	%sil, 137(%rdx)
	movb	10(%rsp), %sil
	movb	%sil, 138(%rdx)
	movb	11(%rsp), %sil
	movb	%sil, 139(%rdx)
	movb	12(%rsp), %sil
	movb	%sil, 140(%rdx)
	movb	13(%rsp), %sil
	movb	%sil, 141(%rdx)
	movb	14(%rsp), %sil
	movb	%sil, 142(%rdx)
	movb	(%rsp), %sil
	movb	%sil, 144(%rdx)
	movb	1(%rsp), %sil
	movb	%sil, 145(%rdx)
	movb	2(%rsp), %sil
	movb	%sil, 146(%rdx)
	movb	3(%rsp), %sil
	movb	%sil, 147(%rdx)
	movb	4(%rsp), %sil
	movb	%sil, 148(%rdx)
	movb	5(%rsp), %sil
	movb	%sil, 149(%rdx)
	movb	6(%rsp), %sil
	movb	%sil, 150(%rdx)
	movb	7(%rsp), %sil
	movb	%sil, 151(%rdx)
	movb	8(%rsp), %sil
	movb	%sil, 152(%rdx)
	movb	9(%rsp), %sil
	movb	%sil, 153(%rdx)
	movb	10(%rsp), %sil
	movb	%sil, 154(%rdx)
	movb	11(%rsp), %sil
	movb	%sil, 155(%rdx)
	movb	12(%rsp), %sil
	movb	%sil, 156(%rdx)
	movb	13(%rsp), %sil
	movb	%sil, 157(%rdx)
	movb	14(%rsp), %sil
	movb	%sil, 158(%rdx)
	movb	(%rsp), %sil
	movb	%sil, 160(%rdx)
	movb	1(%rsp), %sil
	movb	%sil, 161(%rdx)
	movb	2(%rsp), %sil
	movb	%sil, 162(%rdx)
	movb	3(%rsp), %sil
	movb	%sil, 163(%rdx)
	movb	4(%rsp), %sil
	movb	%sil, 164(%rdx)
	movb	5(%rsp), %sil
	movb	%sil, 165(%rdx)
	movb	6(%rsp), %sil
	movb	%sil, 166(%rdx)
	movb	7(%rsp), %sil
	movb	%sil, 167(%rdx)
	movb	8(%rsp), %sil
	movb	%sil, 168(%rdx)
	movb	9(%rsp), %sil
	movb	%sil, 169(%rdx)
	movb	10(%rsp), %sil
	movb	%sil, 170(%rdx)
	movb	11(%rsp), %sil
	movb	%sil, 171(%rdx)
	movb	12(%rsp), %sil
	movb	%sil, 172(%rdx)
	movb	13(%rsp), %sil
	movb	%sil, 173(%rdx)
	movb	14(%rsp), %sil
	movb	%sil, 174(%rdx)
	movb	(%rsp), %sil
	movb	%sil, 192(%rdx)
	movb	1(%rsp), %sil
	movb	%sil, 193(%rdx)
	movb	2(%rsp), %sil
	movb	%sil, 194(%rdx)
	movb	3(%rsp), %sil
	movb	%sil, 195(%rdx)
	movb	4(%rsp), %sil
	movb	%sil, 196(%rdx)
	movb	5(%rsp), %sil
	movb	%sil, 197(%rdx)
	movb	6(%rsp), %sil
	movb	%sil, 198(%rdx)
	movb	7(%rsp), %sil
	movb	%sil, 199(%rdx)
	movb	8(%rsp), %sil
	movb	%sil, 200(%rdx)
	movb	9(%rsp), %sil
	movb	%sil, 201(%rdx)
	movb	10(%rsp), %sil
	movb	%sil, 202(%rdx)
	movb	11(%rsp), %sil
	movb	%sil, 203(%rdx)
	movb	12(%rsp), %sil
	movb	%sil, 204(%rdx)
	movb	13(%rsp), %sil
	movb	%sil, 205(%rdx)
	movb	14(%rsp), %sil
	movb	%sil, 206(%rdx)
	cmpl	$12, %ecx
	jbe 	Ljyh_aria_set_encrypt_key$2
	movb	(%rsp), %sil
	movb	%sil, 208(%rdx)
	movb	1(%rsp), %sil
	movb	%sil, 209(%rdx)
	movb	2(%rsp), %sil
	movb	%sil, 210(%rdx)
	movb	3(%rsp), %sil
	movb	%sil, 211(%rdx)
	movb	4(%rsp), %sil
	movb	%sil, 212(%rdx)
	movb	5(%rsp), %sil
	movb	%sil, 213(%rdx)
	movb	6(%rsp), %sil
	movb	%sil, 214(%rdx)
	movb	7(%rsp), %sil
	movb	%sil, 215(%rdx)
	movb	8(%rsp), %sil
	movb	%sil, 216(%rdx)
	movb	9(%rsp), %sil
	movb	%sil, 217(%rdx)
	movb	10(%rsp), %sil
	movb	%sil, 218(%rdx)
	movb	11(%rsp), %sil
	movb	%sil, 219(%rdx)
	movb	12(%rsp), %sil
	movb	%sil, 220(%rdx)
	movb	13(%rsp), %sil
	movb	%sil, 221(%rdx)
	movb	14(%rsp), %sil
	movb	%sil, 222(%rdx)
	movb	(%rsp), %sil
	movb	%sil, 224(%rdx)
	movb	1(%rsp), %sil
	movb	%sil, 225(%rdx)
	movb	2(%rsp), %sil
	movb	%sil, 226(%rdx)
	movb	3(%rsp), %sil
	movb	%sil, 227(%rdx)
	movb	4(%rsp), %sil
	movb	%sil, 228(%rdx)
	movb	5(%rsp), %sil
	movb	%sil, 229(%rdx)
	movb	6(%rsp), %sil
	movb	%sil, 230(%rdx)
	movb	7(%rsp), %sil
	movb	%sil, 231(%rdx)
	movb	8(%rsp), %sil
	movb	%sil, 232(%rdx)
	movb	9(%rsp), %sil
	movb	%sil, 233(%rdx)
	movb	10(%rsp), %sil
	movb	%sil, 234(%rdx)
	movb	11(%rsp), %sil
	movb	%sil, 235(%rdx)
	movb	12(%rsp), %sil
	movb	%sil, 236(%rdx)
	movb	13(%rsp), %sil
	movb	%sil, 237(%rdx)
	movb	14(%rsp), %sil
	movb	%sil, 238(%rdx)
Ljyh_aria_set_encrypt_key$2:
	cmpl	$14, %ecx
	jbe 	Ljyh_aria_set_encrypt_key$1
	movb	(%rsp), %cl
	movb	%cl, 240(%rdx)
	movb	1(%rsp), %cl
	movb	%cl, 241(%rdx)
	movb	2(%rsp), %cl
	movb	%cl, 242(%rdx)
	movb	3(%rsp), %cl
	movb	%cl, 243(%rdx)
	movb	4(%rsp), %cl
	movb	%cl, 244(%rdx)
	movb	5(%rsp), %cl
	movb	%cl, 245(%rdx)
	movb	6(%rsp), %cl
	movb	%cl, 246(%rdx)
	movb	7(%rsp), %cl
	movb	%cl, 247(%rdx)
	movb	8(%rsp), %cl
	movb	%cl, 248(%rdx)
	movb	9(%rsp), %cl
	movb	%cl, 249(%rdx)
	movb	10(%rsp), %cl
	movb	%cl, 250(%rdx)
	movb	11(%rsp), %cl
	movb	%cl, 251(%rdx)
	movb	12(%rsp), %cl
	movb	%cl, 252(%rdx)
	movb	13(%rsp), %cl
	movb	%cl, 253(%rdx)
	movb	14(%rsp), %cl
	movb	%cl, 254(%rdx)
	movb	(%rsp), %cl
	movb	%cl, 256(%rdx)
	movb	1(%rsp), %cl
	movb	%cl, 257(%rdx)
	movb	2(%rsp), %cl
	movb	%cl, 258(%rdx)
	movb	3(%rsp), %cl
	movb	%cl, 259(%rdx)
	movb	4(%rsp), %cl
	movb	%cl, 260(%rdx)
	movb	5(%rsp), %cl
	movb	%cl, 261(%rdx)
	movb	6(%rsp), %cl
	movb	%cl, 262(%rdx)
	movb	7(%rsp), %cl
	movb	%cl, 263(%rdx)
	movb	8(%rsp), %cl
	movb	%cl, 264(%rdx)
	movb	9(%rsp), %cl
	movb	%cl, 265(%rdx)
	movb	10(%rsp), %cl
	movb	%cl, 266(%rdx)
	movb	11(%rsp), %cl
	movb	%cl, 267(%rdx)
	movb	12(%rsp), %cl
	movb	%cl, 268(%rdx)
	movb	13(%rsp), %cl
	movb	%cl, 269(%rdx)
	movb	14(%rsp), %cl
	movb	%cl, 270(%rdx)
Ljyh_aria_set_encrypt_key$1:
	movq	%r10, %rsp
	ret
	.data
	.p2align	5
_glob_data:
glob_data:
G$sb4:
	.byte	48
	.byte	104
	.byte	-103
	.byte	27
	.byte	-121
	.byte	-71
	.byte	33
	.byte	120
	.byte	80
	.byte	57
	.byte	-37
	.byte	-31
	.byte	114
	.byte	9
	.byte	98
	.byte	60
	.byte	62
	.byte	126
	.byte	94
	.byte	-114
	.byte	-15
	.byte	-96
	.byte	-52
	.byte	-93
	.byte	42
	.byte	29
	.byte	-5
	.byte	-74
	.byte	-42
	.byte	32
	.byte	-60
	.byte	-115
	.byte	-127
	.byte	101
	.byte	-11
	.byte	-119
	.byte	-53
	.byte	-99
	.byte	119
	.byte	-58
	.byte	87
	.byte	67
	.byte	86
	.byte	23
	.byte	-44
	.byte	64
	.byte	26
	.byte	77
	.byte	-64
	.byte	99
	.byte	108
	.byte	-29
	.byte	-73
	.byte	-56
	.byte	100
	.byte	106
	.byte	83
	.byte	-86
	.byte	56
	.byte	-104
	.byte	12
	.byte	-12
	.byte	-101
	.byte	-19
	.byte	127
	.byte	34
	.byte	118
	.byte	-81
	.byte	-35
	.byte	58
	.byte	11
	.byte	88
	.byte	103
	.byte	-120
	.byte	6
	.byte	-61
	.byte	53
	.byte	13
	.byte	1
	.byte	-117
	.byte	-116
	.byte	-62
	.byte	-26
	.byte	95
	.byte	2
	.byte	36
	.byte	117
	.byte	-109
	.byte	102
	.byte	30
	.byte	-27
	.byte	-30
	.byte	84
	.byte	-40
	.byte	16
	.byte	-50
	.byte	122
	.byte	-24
	.byte	8
	.byte	44
	.byte	18
	.byte	-105
	.byte	50
	.byte	-85
	.byte	-76
	.byte	39
	.byte	10
	.byte	35
	.byte	-33
	.byte	-17
	.byte	-54
	.byte	-39
	.byte	-72
	.byte	-6
	.byte	-36
	.byte	49
	.byte	107
	.byte	-47
	.byte	-83
	.byte	25
	.byte	73
	.byte	-67
	.byte	81
	.byte	-106
	.byte	-18
	.byte	-28
	.byte	-88
	.byte	65
	.byte	-38
	.byte	-1
	.byte	-51
	.byte	85
	.byte	-122
	.byte	54
	.byte	-66
	.byte	97
	.byte	82
	.byte	-8
	.byte	-69
	.byte	14
	.byte	-126
	.byte	72
	.byte	105
	.byte	-102
	.byte	-32
	.byte	71
	.byte	-98
	.byte	92
	.byte	4
	.byte	75
	.byte	52
	.byte	21
	.byte	121
	.byte	38
	.byte	-89
	.byte	-34
	.byte	41
	.byte	-82
	.byte	-110
	.byte	-41
	.byte	-124
	.byte	-23
	.byte	-46
	.byte	-70
	.byte	93
	.byte	-13
	.byte	-59
	.byte	-80
	.byte	-65
	.byte	-92
	.byte	59
	.byte	113
	.byte	68
	.byte	70
	.byte	43
	.byte	-4
	.byte	-21
	.byte	111
	.byte	-43
	.byte	-10
	.byte	20
	.byte	-2
	.byte	124
	.byte	112
	.byte	90
	.byte	125
	.byte	-3
	.byte	47
	.byte	24
	.byte	-125
	.byte	22
	.byte	-91
	.byte	-111
	.byte	31
	.byte	5
	.byte	-107
	.byte	116
	.byte	-87
	.byte	-63
	.byte	91
	.byte	74
	.byte	-123
	.byte	109
	.byte	19
	.byte	7
	.byte	79
	.byte	78
	.byte	69
	.byte	-78
	.byte	15
	.byte	-55
	.byte	28
	.byte	-90
	.byte	-68
	.byte	-20
	.byte	115
	.byte	-112
	.byte	123
	.byte	-49
	.byte	89
	.byte	-113
	.byte	-95
	.byte	-7
	.byte	45
	.byte	-14
	.byte	-79
	.byte	0
	.byte	-108
	.byte	55
	.byte	-97
	.byte	-48
	.byte	46
	.byte	-100
	.byte	110
	.byte	40
	.byte	63
	.byte	-128
	.byte	-16
	.byte	61
	.byte	-45
	.byte	37
	.byte	-118
	.byte	-75
	.byte	-25
	.byte	66
	.byte	-77
	.byte	-57
	.byte	-22
	.byte	-9
	.byte	76
	.byte	17
	.byte	51
	.byte	3
	.byte	-94
	.byte	-84
	.byte	96
G$sb3:
	.byte	82
	.byte	9
	.byte	106
	.byte	-43
	.byte	48
	.byte	54
	.byte	-91
	.byte	56
	.byte	-65
	.byte	64
	.byte	-93
	.byte	-98
	.byte	-127
	.byte	-13
	.byte	-41
	.byte	-5
	.byte	124
	.byte	-29
	.byte	57
	.byte	-126
	.byte	-101
	.byte	47
	.byte	-1
	.byte	-121
	.byte	52
	.byte	-114
	.byte	67
	.byte	68
	.byte	-60
	.byte	-34
	.byte	-23
	.byte	-53
	.byte	84
	.byte	123
	.byte	-108
	.byte	50
	.byte	-90
	.byte	-62
	.byte	35
	.byte	61
	.byte	-18
	.byte	76
	.byte	-107
	.byte	11
	.byte	66
	.byte	-6
	.byte	-61
	.byte	78
	.byte	8
	.byte	46
	.byte	-95
	.byte	102
	.byte	40
	.byte	-39
	.byte	36
	.byte	-78
	.byte	118
	.byte	91
	.byte	-94
	.byte	73
	.byte	109
	.byte	-117
	.byte	-47
	.byte	37
	.byte	114
	.byte	-8
	.byte	-10
	.byte	100
	.byte	-122
	.byte	104
	.byte	-104
	.byte	22
	.byte	-44
	.byte	-92
	.byte	92
	.byte	-52
	.byte	93
	.byte	101
	.byte	-74
	.byte	-110
	.byte	108
	.byte	112
	.byte	72
	.byte	80
	.byte	-3
	.byte	-19
	.byte	-71
	.byte	-38
	.byte	94
	.byte	21
	.byte	70
	.byte	87
	.byte	-89
	.byte	-115
	.byte	-99
	.byte	-124
	.byte	-112
	.byte	-40
	.byte	-85
	.byte	0
	.byte	-116
	.byte	-68
	.byte	-45
	.byte	10
	.byte	-9
	.byte	-28
	.byte	88
	.byte	5
	.byte	-72
	.byte	-77
	.byte	69
	.byte	6
	.byte	-48
	.byte	44
	.byte	30
	.byte	-113
	.byte	-54
	.byte	63
	.byte	15
	.byte	2
	.byte	-63
	.byte	-81
	.byte	-67
	.byte	3
	.byte	1
	.byte	19
	.byte	-118
	.byte	107
	.byte	58
	.byte	-111
	.byte	17
	.byte	65
	.byte	79
	.byte	103
	.byte	-36
	.byte	-22
	.byte	-105
	.byte	-14
	.byte	-49
	.byte	-50
	.byte	-16
	.byte	-76
	.byte	-26
	.byte	115
	.byte	-106
	.byte	-84
	.byte	116
	.byte	34
	.byte	-25
	.byte	-83
	.byte	53
	.byte	-123
	.byte	-30
	.byte	-7
	.byte	55
	.byte	-24
	.byte	28
	.byte	117
	.byte	-33
	.byte	110
	.byte	71
	.byte	-15
	.byte	26
	.byte	113
	.byte	29
	.byte	41
	.byte	-59
	.byte	-119
	.byte	111
	.byte	-73
	.byte	98
	.byte	14
	.byte	-86
	.byte	24
	.byte	-66
	.byte	27
	.byte	-4
	.byte	86
	.byte	62
	.byte	75
	.byte	-58
	.byte	-46
	.byte	121
	.byte	32
	.byte	-102
	.byte	-37
	.byte	-64
	.byte	-2
	.byte	120
	.byte	-51
	.byte	90
	.byte	-12
	.byte	31
	.byte	-35
	.byte	-88
	.byte	51
	.byte	-120
	.byte	7
	.byte	-57
	.byte	49
	.byte	-79
	.byte	18
	.byte	16
	.byte	89
	.byte	39
	.byte	-128
	.byte	-20
	.byte	95
	.byte	96
	.byte	81
	.byte	127
	.byte	-87
	.byte	25
	.byte	-75
	.byte	74
	.byte	13
	.byte	45
	.byte	-27
	.byte	122
	.byte	-97
	.byte	-109
	.byte	-55
	.byte	-100
	.byte	-17
	.byte	-96
	.byte	-32
	.byte	59
	.byte	77
	.byte	-82
	.byte	42
	.byte	-11
	.byte	-80
	.byte	-56
	.byte	-21
	.byte	-69
	.byte	60
	.byte	-125
	.byte	83
	.byte	-103
	.byte	97
	.byte	23
	.byte	43
	.byte	4
	.byte	126
	.byte	-70
	.byte	119
	.byte	-42
	.byte	38
	.byte	-31
	.byte	105
	.byte	20
	.byte	99
	.byte	85
	.byte	33
	.byte	12
	.byte	125
G$sb2:
	.byte	-30
	.byte	78
	.byte	84
	.byte	-4
	.byte	-108
	.byte	-62
	.byte	74
	.byte	-52
	.byte	98
	.byte	13
	.byte	106
	.byte	70
	.byte	60
	.byte	77
	.byte	-117
	.byte	-47
	.byte	94
	.byte	-6
	.byte	100
	.byte	-53
	.byte	-76
	.byte	-105
	.byte	-66
	.byte	43
	.byte	-68
	.byte	119
	.byte	46
	.byte	3
	.byte	-45
	.byte	25
	.byte	89
	.byte	-63
	.byte	29
	.byte	6
	.byte	65
	.byte	107
	.byte	85
	.byte	-16
	.byte	-103
	.byte	105
	.byte	-22
	.byte	-100
	.byte	24
	.byte	-82
	.byte	99
	.byte	-33
	.byte	-25
	.byte	-69
	.byte	0
	.byte	115
	.byte	102
	.byte	-5
	.byte	-106
	.byte	76
	.byte	-123
	.byte	-28
	.byte	58
	.byte	9
	.byte	69
	.byte	-86
	.byte	15
	.byte	-18
	.byte	16
	.byte	-21
	.byte	45
	.byte	127
	.byte	-12
	.byte	41
	.byte	-84
	.byte	-49
	.byte	-83
	.byte	-111
	.byte	-115
	.byte	120
	.byte	-56
	.byte	-107
	.byte	-7
	.byte	47
	.byte	-50
	.byte	-51
	.byte	8
	.byte	122
	.byte	-120
	.byte	56
	.byte	92
	.byte	-125
	.byte	42
	.byte	40
	.byte	71
	.byte	-37
	.byte	-72
	.byte	-57
	.byte	-109
	.byte	-92
	.byte	18
	.byte	83
	.byte	-1
	.byte	-121
	.byte	14
	.byte	49
	.byte	54
	.byte	33
	.byte	88
	.byte	72
	.byte	1
	.byte	-114
	.byte	55
	.byte	116
	.byte	50
	.byte	-54
	.byte	-23
	.byte	-79
	.byte	-73
	.byte	-85
	.byte	12
	.byte	-41
	.byte	-60
	.byte	86
	.byte	66
	.byte	38
	.byte	7
	.byte	-104
	.byte	96
	.byte	-39
	.byte	-74
	.byte	-71
	.byte	17
	.byte	64
	.byte	-20
	.byte	32
	.byte	-116
	.byte	-67
	.byte	-96
	.byte	-55
	.byte	-124
	.byte	4
	.byte	73
	.byte	35
	.byte	-15
	.byte	79
	.byte	80
	.byte	31
	.byte	19
	.byte	-36
	.byte	-40
	.byte	-64
	.byte	-98
	.byte	87
	.byte	-29
	.byte	-61
	.byte	123
	.byte	101
	.byte	59
	.byte	2
	.byte	-113
	.byte	62
	.byte	-24
	.byte	37
	.byte	-110
	.byte	-27
	.byte	21
	.byte	-35
	.byte	-3
	.byte	23
	.byte	-87
	.byte	-65
	.byte	-44
	.byte	-102
	.byte	126
	.byte	-59
	.byte	57
	.byte	103
	.byte	-2
	.byte	118
	.byte	-99
	.byte	67
	.byte	-89
	.byte	-31
	.byte	-48
	.byte	-11
	.byte	104
	.byte	-14
	.byte	27
	.byte	52
	.byte	112
	.byte	5
	.byte	-93
	.byte	-118
	.byte	-43
	.byte	121
	.byte	-122
	.byte	-88
	.byte	48
	.byte	-58
	.byte	81
	.byte	75
	.byte	30
	.byte	-90
	.byte	39
	.byte	-10
	.byte	53
	.byte	-46
	.byte	110
	.byte	36
	.byte	22
	.byte	-126
	.byte	95
	.byte	-38
	.byte	-26
	.byte	117
	.byte	-94
	.byte	-17
	.byte	44
	.byte	-78
	.byte	28
	.byte	-97
	.byte	93
	.byte	111
	.byte	-128
	.byte	10
	.byte	114
	.byte	68
	.byte	-101
	.byte	108
	.byte	-112
	.byte	11
	.byte	91
	.byte	51
	.byte	125
	.byte	90
	.byte	82
	.byte	-13
	.byte	97
	.byte	-95
	.byte	-9
	.byte	-80
	.byte	-42
	.byte	63
	.byte	124
	.byte	109
	.byte	-19
	.byte	20
	.byte	-32
	.byte	-91
	.byte	61
	.byte	34
	.byte	-77
	.byte	-8
	.byte	-119
	.byte	-34
	.byte	113
	.byte	26
	.byte	-81
	.byte	-70
	.byte	-75
	.byte	-127
G$sb1:
	.byte	99
	.byte	124
	.byte	119
	.byte	123
	.byte	-14
	.byte	107
	.byte	111
	.byte	-59
	.byte	48
	.byte	1
	.byte	103
	.byte	43
	.byte	-2
	.byte	-41
	.byte	-85
	.byte	118
	.byte	-54
	.byte	-126
	.byte	-55
	.byte	125
	.byte	-6
	.byte	89
	.byte	71
	.byte	-16
	.byte	-83
	.byte	-44
	.byte	-94
	.byte	-81
	.byte	-100
	.byte	-92
	.byte	114
	.byte	-64
	.byte	-73
	.byte	-3
	.byte	-109
	.byte	38
	.byte	54
	.byte	63
	.byte	-9
	.byte	-52
	.byte	52
	.byte	-91
	.byte	-27
	.byte	-15
	.byte	113
	.byte	-40
	.byte	49
	.byte	21
	.byte	4
	.byte	-57
	.byte	35
	.byte	-61
	.byte	24
	.byte	-106
	.byte	5
	.byte	-102
	.byte	7
	.byte	18
	.byte	-128
	.byte	-30
	.byte	-21
	.byte	39
	.byte	-78
	.byte	117
	.byte	9
	.byte	-125
	.byte	44
	.byte	26
	.byte	27
	.byte	110
	.byte	90
	.byte	-96
	.byte	82
	.byte	59
	.byte	-42
	.byte	-77
	.byte	41
	.byte	-29
	.byte	47
	.byte	-124
	.byte	83
	.byte	-47
	.byte	0
	.byte	-19
	.byte	32
	.byte	-4
	.byte	-79
	.byte	91
	.byte	106
	.byte	-53
	.byte	-66
	.byte	57
	.byte	74
	.byte	76
	.byte	88
	.byte	-49
	.byte	-48
	.byte	-17
	.byte	-86
	.byte	-5
	.byte	67
	.byte	77
	.byte	51
	.byte	-123
	.byte	69
	.byte	-7
	.byte	2
	.byte	127
	.byte	80
	.byte	60
	.byte	-97
	.byte	-88
	.byte	81
	.byte	-93
	.byte	64
	.byte	-113
	.byte	-110
	.byte	-99
	.byte	56
	.byte	-11
	.byte	-68
	.byte	-74
	.byte	-38
	.byte	33
	.byte	16
	.byte	-1
	.byte	-13
	.byte	-46
	.byte	-51
	.byte	12
	.byte	19
	.byte	-20
	.byte	95
	.byte	-105
	.byte	68
	.byte	23
	.byte	-60
	.byte	-89
	.byte	126
	.byte	61
	.byte	100
	.byte	93
	.byte	25
	.byte	115
	.byte	96
	.byte	-127
	.byte	79
	.byte	-36
	.byte	34
	.byte	42
	.byte	-112
	.byte	-120
	.byte	70
	.byte	-18
	.byte	-72
	.byte	20
	.byte	-34
	.byte	94
	.byte	11
	.byte	-37
	.byte	-32
	.byte	50
	.byte	58
	.byte	10
	.byte	73
	.byte	6
	.byte	36
	.byte	92
	.byte	-62
	.byte	-45
	.byte	-84
	.byte	98
	.byte	-111
	.byte	-107
	.byte	-28
	.byte	121
	.byte	-25
	.byte	-56
	.byte	55
	.byte	109
	.byte	-115
	.byte	-43
	.byte	78
	.byte	-87
	.byte	108
	.byte	86
	.byte	-12
	.byte	-22
	.byte	101
	.byte	122
	.byte	-82
	.byte	8
	.byte	-70
	.byte	120
	.byte	37
	.byte	46
	.byte	28
	.byte	-90
	.byte	-76
	.byte	-58
	.byte	-24
	.byte	-35
	.byte	116
	.byte	31
	.byte	75
	.byte	-67
	.byte	-117
	.byte	-118
	.byte	112
	.byte	62
	.byte	-75
	.byte	102
	.byte	72
	.byte	3
	.byte	-10
	.byte	14
	.byte	97
	.byte	53
	.byte	87
	.byte	-71
	.byte	-122
	.byte	-63
	.byte	29
	.byte	-98
	.byte	-31
	.byte	-8
	.byte	-104
	.byte	17
	.byte	105
	.byte	-39
	.byte	-114
	.byte	-108
	.byte	-101
	.byte	30
	.byte	-121
	.byte	-23
	.byte	-50
	.byte	85
	.byte	40
	.byte	-33
	.byte	-116
	.byte	-95
	.byte	-119
	.byte	13
	.byte	-65
	.byte	-26
	.byte	66
	.byte	104
	.byte	65
	.byte	-103
	.byte	45
	.byte	15
	.byte	-80
	.byte	84
	.byte	-69
	.byte	22
G$c3:
	.byte	-37
	.byte	-110
	.byte	55
	.byte	29
	.byte	33
	.byte	38
	.byte	-23
	.byte	112
	.byte	3
	.byte	36
	.byte	-105
	.byte	117
	.byte	4
	.byte	-24
	.byte	-55
	.byte	14
G$c2:
	.byte	109
	.byte	-79
	.byte	74
	.byte	-52
	.byte	-98
	.byte	33
	.byte	-56
	.byte	32
	.byte	-1
	.byte	40
	.byte	-79
	.byte	-43
	.byte	-17
	.byte	93
	.byte	-30
	.byte	-80
G$c1:
	.byte	81
	.byte	124
	.byte	-63
	.byte	-73
	.byte	39
	.byte	34
	.byte	10
	.byte	-108
	.byte	-2
	.byte	19
	.byte	-85
	.byte	-24
	.byte	-6
	.byte	-102
	.byte	110
	.byte	-32
