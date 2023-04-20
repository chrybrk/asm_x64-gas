
./main:     file format elf64-x86-64


Disassembly of section .init:

0000000000001000 <_init>:
    1000:	f3 0f 1e fa          	endbr64
    1004:	48 83 ec 08          	sub    $0x8,%rsp
    1008:	48 8b 05 c1 2f 00 00 	mov    0x2fc1(%rip),%rax        # 3fd0 <__gmon_start__@Base>
    100f:	48 85 c0             	test   %rax,%rax
    1012:	74 02                	je     1016 <_init+0x16>
    1014:	ff d0                	call   *%rax
    1016:	48 83 c4 08          	add    $0x8,%rsp
    101a:	c3                   	ret

Disassembly of section .plt:

0000000000001020 <printf@plt-0x10>:
    1020:	ff 35 ca 2f 00 00    	push   0x2fca(%rip)        # 3ff0 <_GLOBAL_OFFSET_TABLE_+0x8>
    1026:	ff 25 cc 2f 00 00    	jmp    *0x2fcc(%rip)        # 3ff8 <_GLOBAL_OFFSET_TABLE_+0x10>
    102c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000001030 <printf@plt>:
    1030:	ff 25 ca 2f 00 00    	jmp    *0x2fca(%rip)        # 4000 <printf@GLIBC_2.2.5>
    1036:	68 00 00 00 00       	push   $0x0
    103b:	e9 e0 ff ff ff       	jmp    1020 <_init+0x20>

0000000000001040 <calloc@plt>:
    1040:	ff 25 c2 2f 00 00    	jmp    *0x2fc2(%rip)        # 4008 <calloc@GLIBC_2.2.5>
    1046:	68 01 00 00 00       	push   $0x1
    104b:	e9 d0 ff ff ff       	jmp    1020 <_init+0x20>

0000000000001050 <scanf@plt>:
    1050:	ff 25 ba 2f 00 00    	jmp    *0x2fba(%rip)        # 4010 <scanf@GLIBC_2.2.5>
    1056:	68 02 00 00 00       	push   $0x2
    105b:	e9 c0 ff ff ff       	jmp    1020 <_init+0x20>

Disassembly of section .text:

0000000000001060 <_start>:
    1060:	f3 0f 1e fa          	endbr64
    1064:	31 ed                	xor    %ebp,%ebp
    1066:	49 89 d1             	mov    %rdx,%r9
    1069:	5e                   	pop    %rsi
    106a:	48 89 e2             	mov    %rsp,%rdx
    106d:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
    1071:	50                   	push   %rax
    1072:	54                   	push   %rsp
    1073:	45 31 c0             	xor    %r8d,%r8d
    1076:	31 c9                	xor    %ecx,%ecx
    1078:	48 8d 3d 7e 01 00 00 	lea    0x17e(%rip),%rdi        # 11fd <main>
    107f:	ff 15 3b 2f 00 00    	call   *0x2f3b(%rip)        # 3fc0 <__libc_start_main@GLIBC_2.34>
    1085:	f4                   	hlt
    1086:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    108d:	00 00 00 
    1090:	48 8d 3d 91 2f 00 00 	lea    0x2f91(%rip),%rdi        # 4028 <__TMC_END__>
    1097:	48 8d 05 8a 2f 00 00 	lea    0x2f8a(%rip),%rax        # 4028 <__TMC_END__>
    109e:	48 39 f8             	cmp    %rdi,%rax
    10a1:	74 15                	je     10b8 <_start+0x58>
    10a3:	48 8b 05 1e 2f 00 00 	mov    0x2f1e(%rip),%rax        # 3fc8 <_ITM_deregisterTMCloneTable@Base>
    10aa:	48 85 c0             	test   %rax,%rax
    10ad:	74 09                	je     10b8 <_start+0x58>
    10af:	ff e0                	jmp    *%rax
    10b1:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    10b8:	c3                   	ret
    10b9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    10c0:	48 8d 3d 61 2f 00 00 	lea    0x2f61(%rip),%rdi        # 4028 <__TMC_END__>
    10c7:	48 8d 35 5a 2f 00 00 	lea    0x2f5a(%rip),%rsi        # 4028 <__TMC_END__>
    10ce:	48 29 fe             	sub    %rdi,%rsi
    10d1:	48 89 f0             	mov    %rsi,%rax
    10d4:	48 c1 ee 3f          	shr    $0x3f,%rsi
    10d8:	48 c1 f8 03          	sar    $0x3,%rax
    10dc:	48 01 c6             	add    %rax,%rsi
    10df:	48 d1 fe             	sar    %rsi
    10e2:	74 14                	je     10f8 <_start+0x98>
    10e4:	48 8b 05 ed 2e 00 00 	mov    0x2eed(%rip),%rax        # 3fd8 <_ITM_registerTMCloneTable@Base>
    10eb:	48 85 c0             	test   %rax,%rax
    10ee:	74 08                	je     10f8 <_start+0x98>
    10f0:	ff e0                	jmp    *%rax
    10f2:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    10f8:	c3                   	ret
    10f9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    1100:	f3 0f 1e fa          	endbr64
    1104:	80 3d 1d 2f 00 00 00 	cmpb   $0x0,0x2f1d(%rip)        # 4028 <__TMC_END__>
    110b:	75 33                	jne    1140 <_start+0xe0>
    110d:	55                   	push   %rbp
    110e:	48 83 3d ca 2e 00 00 	cmpq   $0x0,0x2eca(%rip)        # 3fe0 <__cxa_finalize@GLIBC_2.2.5>
    1115:	00 
    1116:	48 89 e5             	mov    %rsp,%rbp
    1119:	74 0d                	je     1128 <_start+0xc8>
    111b:	48 8b 3d fe 2e 00 00 	mov    0x2efe(%rip),%rdi        # 4020 <__dso_handle>
    1122:	ff 15 b8 2e 00 00    	call   *0x2eb8(%rip)        # 3fe0 <__cxa_finalize@GLIBC_2.2.5>
    1128:	e8 63 ff ff ff       	call   1090 <_start+0x30>
    112d:	c6 05 f4 2e 00 00 01 	movb   $0x1,0x2ef4(%rip)        # 4028 <__TMC_END__>
    1134:	5d                   	pop    %rbp
    1135:	c3                   	ret
    1136:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    113d:	00 00 00 
    1140:	c3                   	ret
    1141:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
    1148:	00 00 00 00 
    114c:	0f 1f 40 00          	nopl   0x0(%rax)
    1150:	f3 0f 1e fa          	endbr64
    1154:	e9 67 ff ff ff       	jmp    10c0 <_start+0x60>

0000000000001159 <.p_size_value>:
    1159:	76 61                	jbe    11bc <scan+0x16>
    115b:	6c                   	insb   (%dx),%es:(%rdi)
    115c:	75 65                	jne    11c3 <scan+0x1d>
    115e:	20 73 69             	and    %dh,0x69(%rbx)
    1161:	7a 65                	jp     11c8 <scan+0x22>
    1163:	3a 20                	cmp    (%rax),%ah
	...

0000000000001166 <.p_size_operation>:
    1166:	6f                   	outsl  %ds:(%rsi),(%dx)
    1167:	70 65                	jo     11ce <scan+0x28>
    1169:	72 61                	jb     11cc <scan+0x26>
    116b:	74 69                	je     11d6 <get+0x3>
    116d:	6f                   	outsl  %ds:(%rsi),(%dx)
    116e:	6e                   	outsb  %ds:(%rsi),(%dx)
    116f:	20 73 69             	and    %dh,0x69(%rbx)
    1172:	7a 65                	jp     11d9 <get+0x6>
    1174:	3a 20                	cmp    (%rax),%ah
	...

0000000000001177 <.p_value>:
    1177:	76 61                	jbe    11da <get+0x7>
    1179:	6c                   	insb   (%dx),%es:(%rdi)
    117a:	75 65                	jne    11e1 <get+0xe>
    117c:	3a 20                	cmp    (%rax),%ah
	...

000000000000117f <.p_operation>:
    117f:	6f                   	outsl  %ds:(%rsi),(%dx)
    1180:	70 65                	jo     11e7 <get+0x14>
    1182:	72 61                	jb     11e5 <get+0x12>
    1184:	74 69                	je     11ef <get+0x1c>
    1186:	6f                   	outsl  %ds:(%rsi),(%dx)
    1187:	6e                   	outsb  %ds:(%rsi),(%dx)
    1188:	3a 20                	cmp    (%rax),%ah
	...

000000000000118b <.p_newline>:
    118b:	0a 00                	or     (%rax),%al

000000000000118d <.p_space>:
    118d:	20 00                	and    %al,(%rax)

000000000000118f <.value>:
    118f:	25                   	.byte 0x25
    1190:	64                   	fs
	...

0000000000001192 <.value_c>:
    1192:	25                   	.byte 0x25
    1193:	63 00                	movsxd (%rax),%eax

0000000000001195 <print>:
    1195:	48 89 c6             	mov    %rax,%rsi
    1198:	48 89 df             	mov    %rbx,%rdi
    119b:	b8 00 00 00 00       	mov    $0x0,%eax
    11a0:	e8 8b fe ff ff       	call   1030 <printf@plt>
    11a5:	c3                   	ret

00000000000011a6 <scan>:
    11a6:	48 89 c7             	mov    %rax,%rdi
    11a9:	55                   	push   %rbp
    11aa:	48 89 e5             	mov    %rsp,%rbp
    11ad:	48 83 ec 10          	sub    $0x10,%rsp
    11b1:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%rbp)
    11b8:	48 8d 45 f4          	lea    -0xc(%rbp),%rax
    11bc:	48 89 c6             	mov    %rax,%rsi
    11bf:	b8 00 00 00 00       	mov    $0x0,%eax
    11c4:	e8 87 fe ff ff       	call   1050 <scanf@plt>
    11c9:	48 8b 45 f4          	mov    -0xc(%rbp),%rax
    11cd:	48 83 c4 10          	add    $0x10,%rsp
    11d1:	5d                   	pop    %rbp
    11d2:	c3                   	ret

00000000000011d3 <get>:
    11d3:	55                   	push   %rbp
    11d4:	48 89 e5             	mov    %rsp,%rbp
    11d7:	48 83 ec 20          	sub    $0x20,%rsp
    11db:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    11df:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    11e3:	48 31 ff             	xor    %rdi,%rdi
    11e6:	48 31 f6             	xor    %rsi,%rsi
    11e9:	48 8b 5d f8          	mov    -0x8(%rbp),%rbx
    11ed:	e8 a3 ff ff ff       	call   1195 <print>
    11f2:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    11f6:	e8 ab ff ff ff       	call   11a6 <scan>
    11fb:	c9                   	leave
    11fc:	c3                   	ret

00000000000011fd <main>:
    11fd:	55                   	push   %rbp
    11fe:	48 89 e5             	mov    %rsp,%rbp
    1201:	48 83 ec 20          	sub    $0x20,%rsp
    1205:	48 8d 3d 4d ff ff ff 	lea    -0xb3(%rip),%rdi        # 1159 <.p_size_value>
    120c:	48 8d 35 7c ff ff ff 	lea    -0x84(%rip),%rsi        # 118f <.value>
    1213:	e8 bb ff ff ff       	call   11d3 <get>
    1218:	48 89 45 e4          	mov    %rax,-0x1c(%rbp)
    121c:	48 8d 3d 43 ff ff ff 	lea    -0xbd(%rip),%rdi        # 1166 <.p_size_operation>
    1223:	48 8d 35 65 ff ff ff 	lea    -0x9b(%rip),%rsi        # 118f <.value>
    122a:	e8 a4 ff ff ff       	call   11d3 <get>
    122f:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    1233:	8b 45 e4             	mov    -0x1c(%rbp),%eax
    1236:	03 45 e8             	add    -0x18(%rbp),%eax
    1239:	48 98                	cltq
    123b:	48 c7 c6 04 00 00 00 	mov    $0x4,%rsi
    1242:	48 89 c7             	mov    %rax,%rdi
    1245:	e8 f6 fd ff ff       	call   1040 <calloc@plt>
    124a:	48 89 45 fc          	mov    %rax,-0x4(%rbp)
    124e:	48 8d 1d 22 ff ff ff 	lea    -0xde(%rip),%rbx        # 1177 <.p_value>
    1255:	e8 3b ff ff ff       	call   1195 <print>
    125a:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%rbp)
    1261:	48 8d 05 27 ff ff ff 	lea    -0xd9(%rip),%rax        # 118f <.value>
    1268:	e8 39 ff ff ff       	call   11a6 <scan>
    126d:	49 89 c0             	mov    %rax,%r8
    1270:	8b 45 ec             	mov    -0x14(%rbp),%eax
    1273:	48 98                	cltq
    1275:	48 8d 14 85 00 00 00 	lea    0x0(,%rax,4),%rdx
    127c:	00 
    127d:	48 8b 45 fc          	mov    -0x4(%rbp),%rax
    1281:	48 01 d0             	add    %rdx,%rax
    1284:	4c 89 00             	mov    %r8,(%rax)
    1287:	83 45 ec 01          	addl   $0x1,-0x14(%rbp)
    128b:	8b 45 e4             	mov    -0x1c(%rbp),%eax
    128e:	39 45 ec             	cmp    %eax,-0x14(%rbp)
    1291:	7c ce                	jl     1261 <main+0x64>
    1293:	48 8d 1d e5 fe ff ff 	lea    -0x11b(%rip),%rbx        # 117f <.p_operation>
    129a:	e8 f6 fe ff ff       	call   1195 <print>
    129f:	48 8d 05 e7 fe ff ff 	lea    -0x119(%rip),%rax        # 118d <.p_space>
    12a6:	e8 fb fe ff ff       	call   11a6 <scan>
    12ab:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%rbp)
    12b2:	48 8d 05 d4 fe ff ff 	lea    -0x12c(%rip),%rax        # 118d <.p_space>
    12b9:	e8 e8 fe ff ff       	call   11a6 <scan>
    12be:	48 8d 05 cd fe ff ff 	lea    -0x133(%rip),%rax        # 1192 <.value_c>
    12c5:	e8 dc fe ff ff       	call   11a6 <scan>
    12ca:	49 89 c0             	mov    %rax,%r8
    12cd:	8b 45 ec             	mov    -0x14(%rbp),%eax
    12d0:	48 98                	cltq
    12d2:	48 8d 14 85 00 00 00 	lea    0x0(,%rax,4),%rdx
    12d9:	00 
    12da:	8b 45 e4             	mov    -0x1c(%rbp),%eax
    12dd:	6b c0 04             	imul   $0x4,%eax,%eax
    12e0:	48 98                	cltq
    12e2:	48 01 c2             	add    %rax,%rdx
    12e5:	48 8b 45 fc          	mov    -0x4(%rbp),%rax
    12e9:	48 01 d0             	add    %rdx,%rax
    12ec:	4c 89 00             	mov    %r8,(%rax)
    12ef:	83 45 ec 01          	addl   $0x1,-0x14(%rbp)
    12f3:	8b 45 e8             	mov    -0x18(%rbp),%eax
    12f6:	39 45 ec             	cmp    %eax,-0x14(%rbp)
    12f9:	7c b7                	jl     12b2 <main+0xb5>
    12fb:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%rbp)
    1302:	8b 45 ec             	mov    -0x14(%rbp),%eax
    1305:	48 98                	cltq
    1307:	48 8d 14 85 00 00 00 	lea    0x0(,%rax,4),%rdx
    130e:	00 
    130f:	8b 45 e4             	mov    -0x1c(%rbp),%eax
    1312:	6b c0 04             	imul   $0x4,%eax,%eax
    1315:	48 98                	cltq
    1317:	48 01 c2             	add    %rax,%rdx
    131a:	48 8b 45 fc          	mov    -0x4(%rbp),%rax
    131e:	48 01 d0             	add    %rdx,%rax
    1321:	48 8b 00             	mov    (%rax),%rax
    1324:	83 f8 2b             	cmp    $0x2b,%eax
    1327:	75 55                	jne    137e <main+0x181>
    1329:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%rbp)
    1330:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%rbp)
    1337:	8b 45 f0             	mov    -0x10(%rbp),%eax
    133a:	48 98                	cltq
    133c:	48 8d 14 85 00 00 00 	lea    0x0(,%rax,4),%rdx
    1343:	00 
    1344:	48 8b 45 fc          	mov    -0x4(%rbp),%rax
    1348:	48 01 d0             	add    %rdx,%rax
    134b:	48 8b 00             	mov    (%rax),%rax
    134e:	01 45 f4             	add    %eax,-0xc(%rbp)
    1351:	83 45 f0 01          	addl   $0x1,-0x10(%rbp)
    1355:	8b 45 e4             	mov    -0x1c(%rbp),%eax
    1358:	39 45 f0             	cmp    %eax,-0x10(%rbp)
    135b:	7c da                	jl     1337 <main+0x13a>
    135d:	48 8b 45 f4          	mov    -0xc(%rbp),%rax
    1361:	48 8d 1d 27 fe ff ff 	lea    -0x1d9(%rip),%rbx        # 118f <.value>
    1368:	e8 28 fe ff ff       	call   1195 <print>
    136d:	48 8d 1d 17 fe ff ff 	lea    -0x1e9(%rip),%rbx        # 118b <.p_newline>
    1374:	e8 1c fe ff ff       	call   1195 <print>
    1379:	e9 b7 00 00 00       	jmp    1435 <main+0x238>
    137e:	83 f8 2d             	cmp    $0x2d,%eax
    1381:	75 52                	jne    13d5 <main+0x1d8>
    1383:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%rbp)
    138a:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%rbp)
    1391:	8b 45 f0             	mov    -0x10(%rbp),%eax
    1394:	48 98                	cltq
    1396:	48 8d 14 85 00 00 00 	lea    0x0(,%rax,4),%rdx
    139d:	00 
    139e:	48 8b 45 fc          	mov    -0x4(%rbp),%rax
    13a2:	48 01 d0             	add    %rdx,%rax
    13a5:	48 8b 00             	mov    (%rax),%rax
    13a8:	29 45 f4             	sub    %eax,-0xc(%rbp)
    13ab:	83 45 f0 01          	addl   $0x1,-0x10(%rbp)
    13af:	8b 45 e4             	mov    -0x1c(%rbp),%eax
    13b2:	39 45 f0             	cmp    %eax,-0x10(%rbp)
    13b5:	7c da                	jl     1391 <main+0x194>
    13b7:	48 8b 45 f4          	mov    -0xc(%rbp),%rax
    13bb:	48 8d 1d cd fd ff ff 	lea    -0x233(%rip),%rbx        # 118f <.value>
    13c2:	e8 ce fd ff ff       	call   1195 <print>
    13c7:	48 8d 1d bd fd ff ff 	lea    -0x243(%rip),%rbx        # 118b <.p_newline>
    13ce:	e8 c2 fd ff ff       	call   1195 <print>
    13d3:	eb 60                	jmp    1435 <main+0x238>
    13d5:	83 f8 2a             	cmp    $0x2a,%eax
    13d8:	75 5b                	jne    1435 <main+0x238>
    13da:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%rbp)
    13e1:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%rbp)
    13e8:	8b 45 f0             	mov    -0x10(%rbp),%eax
    13eb:	48 98                	cltq
    13ed:	48 8d 14 85 00 00 00 	lea    0x0(,%rax,4),%rdx
    13f4:	00 
    13f5:	48 8b 45 fc          	mov    -0x4(%rbp),%rax
    13f9:	48 01 d0             	add    %rdx,%rax
    13fc:	4c 8b 08             	mov    (%rax),%r9
    13ff:	4c 8b 45 f4          	mov    -0xc(%rbp),%r8
    1403:	45 0f af c1          	imul   %r9d,%r8d
    1407:	44 89 45 f4          	mov    %r8d,-0xc(%rbp)
    140b:	83 45 f0 01          	addl   $0x1,-0x10(%rbp)
    140f:	8b 45 e4             	mov    -0x1c(%rbp),%eax
    1412:	39 45 f0             	cmp    %eax,-0x10(%rbp)
    1415:	7c d1                	jl     13e8 <main+0x1eb>
    1417:	48 8b 45 f4          	mov    -0xc(%rbp),%rax
    141b:	48 8d 1d 6d fd ff ff 	lea    -0x293(%rip),%rbx        # 118f <.value>
    1422:	e8 6e fd ff ff       	call   1195 <print>
    1427:	48 8d 1d 5d fd ff ff 	lea    -0x2a3(%rip),%rbx        # 118b <.p_newline>
    142e:	e8 62 fd ff ff       	call   1195 <print>
    1433:	eb 00                	jmp    1435 <main+0x238>
    1435:	83 45 ec 01          	addl   $0x1,-0x14(%rbp)
    1439:	8b 45 e8             	mov    -0x18(%rbp),%eax
    143c:	39 45 ec             	cmp    %eax,-0x14(%rbp)
    143f:	0f 8c bd fe ff ff    	jl     1302 <main+0x105>
    1445:	c9                   	leave
    1446:	b8 00 00 00 00       	mov    $0x0,%eax
    144b:	c3                   	ret

Disassembly of section .fini:

000000000000144c <_fini>:
    144c:	f3 0f 1e fa          	endbr64
    1450:	48 83 ec 08          	sub    $0x8,%rsp
    1454:	48 83 c4 08          	add    $0x8,%rsp
    1458:	c3                   	ret
