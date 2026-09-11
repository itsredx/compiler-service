; ModuleID = 'MantiqModule'
source_filename = "main.mq"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

declare void @quantum_measure(i32)
declare i32 @quantum_H(i32)
declare void @quantum_CNOT(i32, i32)
declare { ptr, i32 } @quantum_qreg(i32)
%Closure = type { ptr, ptr }
declare void @__mantiq_parallel_for(i32, i32, ptr, ptr)
declare ptr @mantiq_malloc(i64)
declare void @mantiq_free(ptr)
declare ptr @mantiq_realloc(ptr, i64)
declare void @mantiq_panic(ptr)
declare void @mantiq_panic_at(ptr, ptr, i32, i32)
declare { ptr, ptr } @make()
declare void @mantiq_print_i32(i32)
declare void @mantiq_print_bool(i32)
declare void @mantiq_print_float(float)
declare void @mantiq_print_ptr(ptr)
declare void @mantiq_print_space()
declare void @mantiq_print_newline()
declare void @mantiq_print_dict_start()
declare void @mantiq_print_dict_end()
declare void @mantiq_print_list_start()
declare void @mantiq_print_list_end()
declare void @mantiq_print_colon()
declare void @mantiq_print_comma()
declare void @mantiq_flush_stdout()
declare void @mantiq_print_str(ptr, i64)
declare void @mantiq_print_cstr(ptr)
declare void @mantiq_write(i32, ptr, i64)
declare ptr @mantiq_read(i32, i64, ptr)
declare i32 @mantiq_fs_open(ptr, i64, ptr, i64)
declare void @mantiq_fs_close(i32)
declare i8 @mantiq_fs_exists(ptr, i64)
declare void @mantiq_init(i32, ptr)
declare void @mantiq_process_exit(i32)
declare ptr @mantiq_process_args()
declare i64 @mantiq_time_now()
declare void @mantiq_time_sleep(i32)
declare ptr @mantiq_sys_os()
declare ptr @mantiq_sys_arch()
declare ptr @mantiq_sys_getenv(ptr, i64)
declare void @mantiq_sys_setenv(ptr, i64, ptr, i64)
declare void @mantiq_sys_unsetenv(ptr, i64)
declare i32 @__mantiq_streq(ptr, i64, ptr, i64)
%MantiqDict = type { ptr, ptr, ptr, ptr, i32, i32, i32, i32 }
declare i32 @__mantiq_hash_string(ptr, i64)
declare i32 @__mantiq_hash_bytes(ptr, i64)
declare ptr @__mantiq_dict_create(i32, i32, i32)
declare void @__mantiq_dict_set(ptr, ptr, ptr, i32)
declare void @__mantiq_dict_keys(ptr, ptr, i32)
declare ptr @__mantiq_dict_get(ptr, ptr, i32)
declare i8 @__mantiq_dict_remove(ptr, ptr, i32)
declare ptr @__mantiq_dict_get_or_insert(ptr, ptr, i32)
declare void @__mantiq_list_append(ptr, ptr, i64)
declare void @__mantiq_dict_clear(ptr)
declare ptr @mantiq_concat_str(ptr, i64, ptr, i64)
declare ptr @mantiq_i32_to_str(i32, ptr)
declare ptr @mantiq_float_to_str(float, ptr)
declare ptr @mantiq_bool_to_str(i32, ptr)
declare ptr @mantiq_spawn(ptr, ptr)
declare ptr @mantiq_await(ptr)
declare void @llvm.memcpy.p0.p0.i64(ptr, ptr, i64, i1)

@.panic_str_bounds = private unnamed_addr constant [20 x i8] c"Index out of bounds\00"
@.panic_str_div_zero = private unnamed_addr constant [17 x i8] c"Division by zero\00"
@.str_file = private unnamed_addr constant [8 x i8] c"main.mq\00"
%String = type { ptr, i64, i64 }

%StringBuilder = type { ptr, i64, i64 }

  ; Span: [row: 28, col: 1] - Node: FunDecl
declare i64 @strlen(ptr %s.param)
  ; Span: [row: 29, col: 1] - Node: FunDecl
declare ptr @memcpy(ptr %dest.param, ptr %src.param, i64 %n.param)
  ; Span: [row: 48, col: 1] - Node: StructDecl
  ; Span: [row: 59, col: 12] - Node: FunDecl
define void @String___init__(ptr %env, ptr %self.param, ptr %s.param, ptr %data.param, i64 %len.param, i64 %capacity.param) {
entry:
  %self_0_1 = alloca ptr, align 8
  store ptr %self.param, ptr %self_0_1, align 8
  %s_0_2 = alloca ptr, align 8
  store ptr %s.param, ptr %s_0_2, align 8
  %data_0_3 = alloca ptr, align 8
  store ptr %data.param, ptr %data_0_3, align 8
  %len_0_4 = alloca i64, align 8
  store i64 %len.param, ptr %len_0_4, align 8
  %capacity_0_5 = alloca i64, align 8
  store i64 %capacity.param, ptr %capacity_0_5, align 8
  ; Span: [row: 60, col: 9] - Node: IfStmt
  ; Span: [row: 60, col: 9] - Expr: IfStmt
  ; Span: [row: 60, col: 12] - Expr: BinaryExpr
  ; Span: [row: 60, col: 12] - Expr: CastExpr
  ; Span: [row: 60, col: 12] - Expr: Identifier
  %t.1 = load ptr, ptr %data_0_3
  ; Span: [row: 60, col: 27] - Expr: Identifier
  %t.3 = icmp ne ptr %t.1, null
  %t.2 = zext i1 %t.3 to i8
  %t.4 = icmp ne i8 %t.2, 0
  %res_alloc.5 = alloca i64
  br i1 %t.4, label %if.then.4, label %if.else.4
if.then.4:
  ; Span: [row: 60, col: 32] - Expr: BlockStmt
  ; Span: [row: 61, col: 13] - Node: BinaryExpr
  ; Span: [row: 61, col: 13] - Expr: BinaryExpr
  ; Span: [row: 61, col: 33] - Expr: Identifier
  %t.6 = load ptr, ptr %data_0_3
  ; Span: [row: 61, col: 20] - Expr: Identifier
  %t.7 = load ptr, ptr %self_0_1
  %t.8 = getelementptr %String, ptr %t.7, i32 0, i32 0
  store ptr %t.6, ptr %t.8
  ; Span: [row: 62, col: 13] - Node: BinaryExpr
  ; Span: [row: 62, col: 13] - Expr: BinaryExpr
  ; Span: [row: 62, col: 32] - Expr: Identifier
  %t.9 = load i64, ptr %len_0_4
  ; Span: [row: 62, col: 20] - Expr: Identifier
  %t.10 = load ptr, ptr %self_0_1
  %t.11 = getelementptr %String, ptr %t.10, i32 0, i32 1
  store i64 %t.9, ptr %t.11
  ; Span: [row: 63, col: 13] - Expr: BinaryExpr
  ; Span: [row: 63, col: 37] - Expr: Identifier
  %t.12 = load i64, ptr %capacity_0_5
  ; Span: [row: 63, col: 20] - Expr: Identifier
  %t.13 = load ptr, ptr %self_0_1
  %t.14 = getelementptr %String, ptr %t.13, i32 0, i32 2
  store i64 %t.12, ptr %t.14
  store i64 %t.12, ptr %res_alloc.5
  br label %if.end.4
if.else.4:
  ; Span: [row: 64, col: 31] - Expr: IfStmt
  ; Span: [row: 64, col: 14] - Expr: BinaryExpr
  ; Span: [row: 64, col: 14] - Expr: CastExpr
  ; Span: [row: 64, col: 14] - Expr: Identifier
  %t.15 = load ptr, ptr %s_0_2
  ; Span: [row: 64, col: 26] - Expr: Identifier
  %t.17 = icmp ne ptr %t.15, null
  %t.16 = zext i1 %t.17 to i8
  %t.18 = icmp ne i8 %t.16, 0
  %res_alloc.19 = alloca i64
  br i1 %t.18, label %if.then.18, label %if.else.18
if.then.18:
  ; Span: [row: 64, col: 31] - Expr: BlockStmt
  ; Span: [row: 65, col: 13] - Node: VarDecl
  %l_1_6 = alloca i64
  ; Span: [row: 65, col: 30] - Expr: CallExpr
  ; Span: [row: 65, col: 37] - Expr: Identifier
  %t.20 = load ptr, ptr %s_0_2
  %t.21 = call i64 @strlen(ptr %t.20)
  store i64 %t.21, ptr %l_1_6
  ; Span: [row: 66, col: 13] - Node: VarDecl
  %cap_1_7 = alloca i64
  ; Span: [row: 66, col: 32] - Expr: BinaryExpr
  ; Span: [row: 66, col: 32] - Expr: Identifier
  %t.22 = load i64, ptr %l_1_6
  ; Span: [row: 66, col: 36] - Expr: NumberLiteral
  %t.23 = add i64 %t.22, 1
  store i64 %t.23, ptr %cap_1_7
  ; Span: [row: 67, col: 13] - Node: VarDecl
  %d_1_8 = alloca ptr
  ; Span: [row: 67, col: 32] - Expr: CastExpr
  ; Span: [row: 67, col: 32] - Expr: CallExpr
  ; Span: [row: 67, col: 37] - Expr: Identifier
  %t.24 = load i64, ptr %cap_1_7
  %t.25 = mul i64 %t.24, 1
  %t.26 = call ptr @mantiq_malloc(i64 %t.25)
  store ptr %t.26, ptr %d_1_8
  ; Span: [row: 68, col: 13] - Node: CallExpr
  ; Span: [row: 68, col: 13] - Expr: CallExpr
  ; Span: [row: 68, col: 20] - Expr: CastExpr
  ; Span: [row: 68, col: 20] - Expr: Identifier
  %t.27 = load ptr, ptr %d_1_8
  ; Span: [row: 68, col: 30] - Expr: CastExpr
  ; Span: [row: 68, col: 30] - Expr: Identifier
  %t.28 = load ptr, ptr %s_0_2
  ; Span: [row: 68, col: 40] - Expr: Identifier
  %t.29 = load i64, ptr %cap_1_7
  %t.30 = call ptr @memcpy(ptr %t.27, ptr %t.28, i64 %t.29)
  call void @mantiq_print_ptr(ptr %t.30)
  call void @mantiq_print_newline()
  ; Span: [row: 69, col: 13] - Node: BinaryExpr
  ; Span: [row: 69, col: 13] - Expr: BinaryExpr
  ; Span: [row: 69, col: 33] - Expr: Identifier
  %t.31 = load ptr, ptr %d_1_8
  ; Span: [row: 69, col: 20] - Expr: Identifier
  %t.32 = load ptr, ptr %self_0_1
  %t.33 = getelementptr %String, ptr %t.32, i32 0, i32 0
  store ptr %t.31, ptr %t.33
  ; Span: [row: 70, col: 13] - Node: BinaryExpr
  ; Span: [row: 70, col: 13] - Expr: BinaryExpr
  ; Span: [row: 70, col: 32] - Expr: Identifier
  %t.34 = load i64, ptr %l_1_6
  ; Span: [row: 70, col: 20] - Expr: Identifier
  %t.35 = load ptr, ptr %self_0_1
  %t.36 = getelementptr %String, ptr %t.35, i32 0, i32 1
  store i64 %t.34, ptr %t.36
  ; Span: [row: 71, col: 13] - Expr: BinaryExpr
  ; Span: [row: 71, col: 37] - Expr: Identifier
  %t.37 = load i64, ptr %cap_1_7
  ; Span: [row: 71, col: 20] - Expr: Identifier
  %t.38 = load ptr, ptr %self_0_1
  %t.39 = getelementptr %String, ptr %t.38, i32 0, i32 2
  store i64 %t.37, ptr %t.39
  store i64 %t.37, ptr %res_alloc.19
  br label %if.end.18
if.else.18:
  ; Span: [row: 72, col: 14] - Expr: BlockStmt
  ; Span: [row: 73, col: 13] - Node: BinaryExpr
  ; Span: [row: 73, col: 13] - Expr: BinaryExpr
  ; Span: [row: 73, col: 33] - Expr: CastExpr
  ; Span: [row: 73, col: 33] - Expr: Identifier
  ; Span: [row: 73, col: 20] - Expr: Identifier
  %t.40 = load ptr, ptr %self_0_1
  %t.41 = getelementptr %String, ptr %t.40, i32 0, i32 0
  store ptr null, ptr %t.41
  ; Span: [row: 74, col: 13] - Node: BinaryExpr
  ; Span: [row: 74, col: 13] - Expr: BinaryExpr
  ; Span: [row: 74, col: 32] - Expr: NumberLiteral
  ; Span: [row: 74, col: 20] - Expr: Identifier
  %t.42 = load ptr, ptr %self_0_1
  %t.43 = getelementptr %String, ptr %t.42, i32 0, i32 1
  store i64 0, ptr %t.43
  ; Span: [row: 75, col: 13] - Expr: BinaryExpr
  ; Span: [row: 75, col: 37] - Expr: NumberLiteral
  ; Span: [row: 75, col: 20] - Expr: Identifier
  %t.44 = load ptr, ptr %self_0_1
  %t.45 = getelementptr %String, ptr %t.44, i32 0, i32 2
  store i64 0, ptr %t.45
  store i64 0, ptr %res_alloc.19
  br label %if.end.18
if.end.18:
  %t.46 = load i64, ptr %res_alloc.19
  store i64 %t.46, ptr %res_alloc.5
  br label %if.end.4
if.end.4:
  %t.47 = load i64, ptr %res_alloc.5
  ret void
}

  ; Span: [row: 82, col: 12] - Node: FunDecl
define void @String___del__(ptr %env, ptr %self.param) {
entry:
  %self_0_1 = alloca ptr, align 8
  store ptr %self.param, ptr %self_0_1, align 8
  ; Span: [row: 83, col: 9] - Node: IfStmt
  ; Span: [row: 83, col: 9] - Expr: IfStmt
  ; Span: [row: 83, col: 12] - Expr: BinaryExpr
  ; Span: [row: 83, col: 12] - Expr: CastExpr
  ; Span: [row: 83, col: 12] - Expr: MemberExpr
  ; Span: [row: 83, col: 13] - Expr: UnaryExpr
  ; Span: [row: 83, col: 19] - Expr: Identifier
  %t.1 = load ptr, ptr %self_0_1
  %t.2 = load %String, ptr %t.1
  %t.3 = extractvalue %String %t.2, 0
  ; Span: [row: 83, col: 40] - Expr: Identifier
  %t.5 = icmp ne ptr %t.3, null
  %t.4 = zext i1 %t.5 to i8
  %t.6 = icmp ne i8 %t.4, 0
  br i1 %t.6, label %if.then.6, label %if.else.6
if.then.6:
  ; Span: [row: 83, col: 45] - Expr: BlockStmt
  ; Span: [row: 84, col: 13] - Node: CallExpr
  ; Span: [row: 84, col: 13] - Expr: CallExpr
  ; Span: [row: 84, col: 18] - Expr: CastExpr
  ; Span: [row: 84, col: 18] - Expr: MemberExpr
  ; Span: [row: 84, col: 19] - Expr: UnaryExpr
  ; Span: [row: 84, col: 25] - Expr: Identifier
  %t.7 = load ptr, ptr %self_0_1
  %t.8 = load %String, ptr %t.7
  %t.9 = extractvalue %String %t.8, 0
  call void @mantiq_free(ptr %t.9)
  ; Span: [row: 85, col: 13] - Expr: BinaryExpr
  ; Span: [row: 85, col: 33] - Expr: CastExpr
  ; Span: [row: 85, col: 33] - Expr: Identifier
  ; Span: [row: 85, col: 20] - Expr: Identifier
  %t.10 = load ptr, ptr %self_0_1
  %t.11 = getelementptr %String, ptr %t.10, i32 0, i32 0
  store ptr null, ptr %t.11
  br label %if.end.6
if.else.6:
  br label %if.end.6
if.end.6:
  ret void
}

  ; Span: [row: 92, col: 12] - Node: FunDecl
define i8 @String___getitem__(ptr %env, ptr byval(%String) %self.param, i64 %idx.param) {
entry:
  %self_0_1 = alloca %String, align 8
  %t.1 = load %String, ptr %self.param, align 8
  store %String %t.1, ptr %self_0_1, align 8
  %idx_0_2 = alloca i64, align 8
  store i64 %idx.param, ptr %idx_0_2, align 8
  ; Span: [row: 93, col: 9] - Node: ReturnStmt
  ; Span: [row: 93, col: 16] - Expr: IndexExpr
  ; Span: [row: 93, col: 16] - Expr: MemberExpr
  ; Span: [row: 93, col: 16] - Expr: Identifier
  %t.2 = load %String, ptr %self_0_1
  %t.3 = extractvalue %String %t.2, 0
  ; Span: [row: 93, col: 26] - Expr: Identifier
  %t.4 = load i64, ptr %idx_0_2
  %t.5 = getelementptr inbounds i8, ptr %t.3, i64 %t.4
  %t.6 = load i8, ptr %t.5
  ret i8 %t.6
}

  ; Span: [row: 95, col: 5] - Node: FunDecl
define %String @String_make(ptr %env, ptr %s.param) {
entry:
  %s_0_1 = alloca ptr, align 8
  store ptr %s.param, ptr %s_0_1, align 8
  ; Span: [row: 96, col: 9] - Node: ReturnStmt
  ; Span: [row: 96, col: 16] - Expr: CallExpr
  %t.1 = alloca %String, align 8
  store %String zeroinitializer, ptr %t.1, align 8
  ; Span: [row: 96, col: 23] - Expr: Identifier
  %t.2 = load ptr, ptr %s_0_1
  ; Span: [row: 59, col: 89] - Expr: CastExpr
  ; Span: [row: 59, col: 89] - Expr: Identifier
  ; Span: [row: 59, col: 121] - Expr: NumberLiteral
  %t.3 = zext i32 0 to i64
  ; Span: [row: 59, col: 144] - Expr: NumberLiteral
  %t.4 = zext i32 0 to i64
  call void @String___init__(ptr null, ptr %t.1, ptr %t.2, ptr null, i64 %t.3, i64 %t.4)
  %t.5 = load %String, ptr %t.1, align 8
  ret %String %t.5
}

  ; Span: [row: 98, col: 5] - Node: FunDecl
define void @String_deinit(ptr %env, ptr %self.param) {
entry:
  %self_0_1 = alloca ptr, align 8
  store ptr %self.param, ptr %self_0_1, align 8
  ; Span: [row: 99, col: 9] - Node: MethodCallExpr
  ; Span: [row: 99, col: 9] - Expr: MethodCallExpr
  ; Span: [row: 99, col: 9] - Expr: Identifier
  %t.1 = load ptr, ptr %self_0_1
  call void @String___del__(ptr null, ptr %t.1)
  ret void
}

  ; Span: [row: 118, col: 5] - Node: FunDecl
define void @String_append(ptr %env, ptr %self.param, ptr %other.param) {
entry:
  %self_0_1 = alloca ptr, align 8
  store ptr %self.param, ptr %self_0_1, align 8
  %other_0_2 = alloca ptr, align 8
  store ptr %other.param, ptr %other_0_2, align 8
  ; Span: [row: 119, col: 9] - Node: VarDecl
  %new_len_0_3 = alloca i64
  ; Span: [row: 119, col: 32] - Expr: BinaryExpr
  ; Span: [row: 119, col: 32] - Expr: MemberExpr
  ; Span: [row: 119, col: 33] - Expr: UnaryExpr
  ; Span: [row: 119, col: 39] - Expr: Identifier
  %t.1 = load ptr, ptr %self_0_1
  %t.2 = load %String, ptr %t.1
  %t.3 = extractvalue %String %t.2, 1
  ; Span: [row: 119, col: 51] - Expr: MemberExpr
  ; Span: [row: 119, col: 52] - Expr: UnaryExpr
  ; Span: [row: 119, col: 58] - Expr: Identifier
  %t.4 = load ptr, ptr %other_0_2
  %t.5 = load %String, ptr %t.4
  %t.6 = extractvalue %String %t.5, 1
  %t.7 = add i64 %t.3, %t.6
  store i64 %t.7, ptr %new_len_0_3
  ; Span: [row: 120, col: 9] - Node: IfStmt
  ; Span: [row: 120, col: 9] - Expr: IfStmt
  ; Span: [row: 120, col: 12] - Expr: BinaryExpr
  ; Span: [row: 120, col: 12] - Expr: Identifier
  %t.8 = load i64, ptr %new_len_0_3
  ; Span: [row: 120, col: 23] - Expr: MemberExpr
  ; Span: [row: 120, col: 24] - Expr: UnaryExpr
  ; Span: [row: 120, col: 30] - Expr: Identifier
  %t.9 = load ptr, ptr %self_0_1
  %t.10 = load %String, ptr %t.9
  %t.11 = extractvalue %String %t.10, 2
  %t.13 = icmp sge i64 %t.8, %t.11
  %t.12 = zext i1 %t.13 to i8
  %t.14 = icmp ne i8 %t.12, 0
  br i1 %t.14, label %if.then.14, label %if.else.14
if.then.14:
  ; Span: [row: 120, col: 45] - Expr: BlockStmt
  ; Span: [row: 121, col: 13] - Node: VarDecl
  %new_cap_1_4 = alloca i64
  ; Span: [row: 121, col: 36] - Expr: BinaryExpr
  ; Span: [row: 121, col: 37] - Expr: BinaryExpr
  ; Span: [row: 121, col: 37] - Expr: Identifier
  %t.15 = load i64, ptr %new_len_0_3
  ; Span: [row: 121, col: 47] - Expr: NumberLiteral
  %t.16 = add i64 %t.15, 1
  ; Span: [row: 121, col: 52] - Expr: NumberLiteral
  %t.17 = mul i64 %t.16, 2
  store i64 %t.17, ptr %new_cap_1_4
  ; Span: [row: 122, col: 13] - Node: BinaryExpr
  ; Span: [row: 122, col: 13] - Expr: BinaryExpr
  ; Span: [row: 122, col: 33] - Expr: CastExpr
  ; Span: [row: 122, col: 33] - Expr: CallExpr
  ; Span: [row: 122, col: 40] - Expr: CastExpr
  ; Span: [row: 122, col: 40] - Expr: MemberExpr
  ; Span: [row: 122, col: 41] - Expr: UnaryExpr
  ; Span: [row: 122, col: 47] - Expr: Identifier
  %t.18 = load ptr, ptr %self_0_1
  %t.19 = load %String, ptr %t.18
  %t.20 = extractvalue %String %t.19, 0
  ; Span: [row: 122, col: 66] - Expr: Identifier
  %t.21 = load i64, ptr %new_cap_1_4
  %t.22 = call ptr @mantiq_realloc(ptr %t.20, i64 %t.21)
  ; Span: [row: 122, col: 20] - Expr: Identifier
  %t.23 = load ptr, ptr %self_0_1
  %t.24 = getelementptr %String, ptr %t.23, i32 0, i32 0
  store ptr %t.22, ptr %t.24
  ; Span: [row: 123, col: 13] - Expr: BinaryExpr
  ; Span: [row: 123, col: 37] - Expr: Identifier
  %t.25 = load i64, ptr %new_cap_1_4
  ; Span: [row: 123, col: 20] - Expr: Identifier
  %t.26 = load ptr, ptr %self_0_1
  %t.27 = getelementptr %String, ptr %t.26, i32 0, i32 2
  store i64 %t.25, ptr %t.27
  br label %if.end.14
if.else.14:
  br label %if.end.14
if.end.14:
  ; Span: [row: 125, col: 9] - Node: VarDecl
  %dest_ptr_0_5 = alloca ptr
  ; Span: [row: 125, col: 35] - Expr: UnaryExpr
  ; Span: [row: 125, col: 39] - Expr: MemberExpr
  ; Span: [row: 125, col: 40] - Expr: UnaryExpr
  ; Span: [row: 125, col: 46] - Expr: Identifier
  %t.28 = load ptr, ptr %self_0_1
  %t.29 = load %String, ptr %t.28
  %t.30 = extractvalue %String %t.29, 0
  ; Span: [row: 125, col: 57] - Expr: MemberExpr
  ; Span: [row: 125, col: 58] - Expr: UnaryExpr
  ; Span: [row: 125, col: 64] - Expr: Identifier
  %t.31 = load ptr, ptr %self_0_1
  %t.32 = load %String, ptr %t.31
  %t.33 = extractvalue %String %t.32, 1
  %t.34 = getelementptr inbounds i8, ptr %t.30, i64 %t.33
  store ptr %t.34, ptr %dest_ptr_0_5
  ; Span: [row: 126, col: 9] - Node: CallExpr
  ; Span: [row: 126, col: 9] - Expr: CallExpr
  ; Span: [row: 126, col: 16] - Expr: CastExpr
  ; Span: [row: 126, col: 16] - Expr: Identifier
  %t.35 = load ptr, ptr %dest_ptr_0_5
  ; Span: [row: 126, col: 33] - Expr: CastExpr
  ; Span: [row: 126, col: 33] - Expr: MemberExpr
  ; Span: [row: 126, col: 34] - Expr: UnaryExpr
  ; Span: [row: 126, col: 40] - Expr: Identifier
  %t.36 = load ptr, ptr %other_0_2
  %t.37 = load %String, ptr %t.36
  %t.38 = extractvalue %String %t.37, 0
  ; Span: [row: 126, col: 60] - Expr: BinaryExpr
  ; Span: [row: 126, col: 60] - Expr: MemberExpr
  ; Span: [row: 126, col: 61] - Expr: UnaryExpr
  ; Span: [row: 126, col: 67] - Expr: Identifier
  %t.39 = load ptr, ptr %other_0_2
  %t.40 = load %String, ptr %t.39
  %t.41 = extractvalue %String %t.40, 1
  ; Span: [row: 126, col: 80] - Expr: NumberLiteral
  %t.42 = add i64 %t.41, 1
  %t.43 = call ptr @memcpy(ptr %t.35, ptr %t.38, i64 %t.42)
  call void @mantiq_print_ptr(ptr %t.43)
  call void @mantiq_print_newline()
  ; Span: [row: 127, col: 9] - Node: BinaryExpr
  ; Span: [row: 127, col: 9] - Expr: BinaryExpr
  ; Span: [row: 127, col: 28] - Expr: Identifier
  %t.44 = load i64, ptr %new_len_0_3
  ; Span: [row: 127, col: 16] - Expr: Identifier
  %t.45 = load ptr, ptr %self_0_1
  %t.46 = getelementptr %String, ptr %t.45, i32 0, i32 1
  store i64 %t.44, ptr %t.46
  ret void
}

  ; Span: [row: 151, col: 1] - Node: StructDecl
  ; Span: [row: 161, col: 12] - Node: FunDecl
define void @StringBuilder___init__(ptr %env, ptr %self.param) {
entry:
  %self_0_1 = alloca ptr, align 8
  store ptr %self.param, ptr %self_0_1, align 8
  ; Span: [row: 162, col: 9] - Node: VarDecl
  %cap_0_2 = alloca i64
  ; Span: [row: 162, col: 28] - Expr: NumberLiteral
  %t.1 = zext i32 16 to i64
  store i64 %t.1, ptr %cap_0_2
  ; Span: [row: 163, col: 9] - Node: VarDecl
  %buf_0_3 = alloca ptr
  ; Span: [row: 163, col: 30] - Expr: CastExpr
  ; Span: [row: 163, col: 30] - Expr: CallExpr
  ; Span: [row: 163, col: 35] - Expr: Identifier
  %t.2 = load i64, ptr %cap_0_2
  %t.3 = mul i64 %t.2, 1
  %t.4 = call ptr @mantiq_malloc(i64 %t.3)
  store ptr %t.4, ptr %buf_0_3
  ; Span: [row: 164, col: 9] - Node: BinaryExpr
  ; Span: [row: 164, col: 9] - Expr: BinaryExpr
  ; Span: [row: 164, col: 18] - Expr: NumberLiteral
  ; Span: [row: 164, col: 9] - Expr: Identifier
  %t.5 = load ptr, ptr %buf_0_3
  ; Span: [row: 164, col: 13] - Expr: NumberLiteral
  %t.6 = zext i32 0 to i64
  %t.7 = getelementptr inbounds i8, ptr %t.5, i64 %t.6
  store i8 0, ptr %t.7
  ; Span: [row: 165, col: 9] - Node: BinaryExpr
  ; Span: [row: 165, col: 9] - Expr: BinaryExpr
  ; Span: [row: 165, col: 31] - Expr: Identifier
  %t.8 = load ptr, ptr %buf_0_3
  ; Span: [row: 165, col: 16] - Expr: Identifier
  %t.9 = load ptr, ptr %self_0_1
  %t.10 = getelementptr %StringBuilder, ptr %t.9, i32 0, i32 0
  store ptr %t.8, ptr %t.10
  ; Span: [row: 166, col: 9] - Node: BinaryExpr
  ; Span: [row: 166, col: 9] - Expr: BinaryExpr
  ; Span: [row: 166, col: 28] - Expr: NumberLiteral
  ; Span: [row: 166, col: 16] - Expr: Identifier
  %t.11 = load ptr, ptr %self_0_1
  %t.12 = getelementptr %StringBuilder, ptr %t.11, i32 0, i32 1
  store i64 0, ptr %t.12
  ; Span: [row: 167, col: 9] - Node: BinaryExpr
  ; Span: [row: 167, col: 9] - Expr: BinaryExpr
  ; Span: [row: 167, col: 33] - Expr: Identifier
  %t.13 = load i64, ptr %cap_0_2
  ; Span: [row: 167, col: 16] - Expr: Identifier
  %t.14 = load ptr, ptr %self_0_1
  %t.15 = getelementptr %StringBuilder, ptr %t.14, i32 0, i32 2
  store i64 %t.13, ptr %t.15
  ret void
}

  ; Span: [row: 174, col: 12] - Node: FunDecl
define void @StringBuilder___del__(ptr %env, ptr %self.param) {
entry:
  %self_0_1 = alloca ptr, align 8
  store ptr %self.param, ptr %self_0_1, align 8
  ; Span: [row: 175, col: 9] - Node: IfStmt
  ; Span: [row: 175, col: 9] - Expr: IfStmt
  ; Span: [row: 175, col: 12] - Expr: BinaryExpr
  ; Span: [row: 175, col: 12] - Expr: CastExpr
  ; Span: [row: 175, col: 12] - Expr: MemberExpr
  ; Span: [row: 175, col: 13] - Expr: UnaryExpr
  ; Span: [row: 175, col: 19] - Expr: Identifier
  %t.1 = load ptr, ptr %self_0_1
  %t.2 = load %StringBuilder, ptr %t.1
  %t.3 = extractvalue %StringBuilder %t.2, 0
  ; Span: [row: 175, col: 42] - Expr: Identifier
  %t.5 = icmp ne ptr %t.3, null
  %t.4 = zext i1 %t.5 to i8
  %t.6 = icmp ne i8 %t.4, 0
  br i1 %t.6, label %if.then.6, label %if.else.6
if.then.6:
  ; Span: [row: 175, col: 47] - Expr: BlockStmt
  ; Span: [row: 176, col: 13] - Node: CallExpr
  ; Span: [row: 176, col: 13] - Expr: CallExpr
  ; Span: [row: 176, col: 18] - Expr: CastExpr
  ; Span: [row: 176, col: 18] - Expr: MemberExpr
  ; Span: [row: 176, col: 19] - Expr: UnaryExpr
  ; Span: [row: 176, col: 25] - Expr: Identifier
  %t.7 = load ptr, ptr %self_0_1
  %t.8 = load %StringBuilder, ptr %t.7
  %t.9 = extractvalue %StringBuilder %t.8, 0
  call void @mantiq_free(ptr %t.9)
  ; Span: [row: 177, col: 13] - Expr: BinaryExpr
  ; Span: [row: 177, col: 35] - Expr: CastExpr
  ; Span: [row: 177, col: 35] - Expr: Identifier
  ; Span: [row: 177, col: 20] - Expr: Identifier
  %t.10 = load ptr, ptr %self_0_1
  %t.11 = getelementptr %StringBuilder, ptr %t.10, i32 0, i32 0
  store ptr null, ptr %t.11
  br label %if.end.6
if.else.6:
  br label %if.end.6
if.end.6:
  ret void
}

  ; Span: [row: 179, col: 5] - Node: FunDecl
define %StringBuilder @StringBuilder_make(ptr %env) {
entry:
  ; Span: [row: 180, col: 9] - Node: ReturnStmt
  ; Span: [row: 180, col: 16] - Expr: CallExpr
  %t.1 = alloca %StringBuilder, align 8
  store %StringBuilder zeroinitializer, ptr %t.1, align 8
  call void @StringBuilder___init__(ptr null, ptr %t.1)
  %t.2 = load %StringBuilder, ptr %t.1, align 8
  ret %StringBuilder %t.2
}

  ; Span: [row: 182, col: 5] - Node: FunDecl
define %StringBuilder @StringBuilder_make_builder(ptr %env) {
entry:
  ; Span: [row: 183, col: 9] - Node: ReturnStmt
  ; Span: [row: 183, col: 16] - Expr: CallExpr
  %t.1 = alloca %StringBuilder, align 8
  store %StringBuilder zeroinitializer, ptr %t.1, align 8
  call void @StringBuilder___init__(ptr null, ptr %t.1)
  %t.2 = load %StringBuilder, ptr %t.1, align 8
  ret %StringBuilder %t.2
}

  ; Span: [row: 185, col: 5] - Node: FunDecl
define void @StringBuilder_deinit(ptr %env, ptr %self.param) {
entry:
  %self_0_1 = alloca ptr, align 8
  store ptr %self.param, ptr %self_0_1, align 8
  ; Span: [row: 186, col: 9] - Node: MethodCallExpr
  ; Span: [row: 186, col: 9] - Expr: MethodCallExpr
  ; Span: [row: 186, col: 9] - Expr: Identifier
  %t.1 = load ptr, ptr %self_0_1
  call void @StringBuilder___del__(ptr null, ptr %t.1)
  ret void
}

  ; Span: [row: 188, col: 5] - Node: FunDecl
define void @StringBuilder_deinit_builder(ptr %env, ptr %self.param) {
entry:
  %self_0_1 = alloca ptr, align 8
  store ptr %self.param, ptr %self_0_1, align 8
  ; Span: [row: 189, col: 9] - Node: MethodCallExpr
  ; Span: [row: 189, col: 9] - Expr: MethodCallExpr
  ; Span: [row: 189, col: 9] - Expr: Identifier
  %t.1 = load ptr, ptr %self_0_1
  call void @StringBuilder___del__(ptr null, ptr %t.1)
  ret void
}

  ; Span: [row: 197, col: 5] - Node: FunDecl
define void @StringBuilder_append(ptr %env, ptr %self.param, ptr %s.param) {
entry:
  %self_0_1 = alloca ptr, align 8
  store ptr %self.param, ptr %self_0_1, align 8
  %s_0_2 = alloca ptr, align 8
  store ptr %s.param, ptr %s_0_2, align 8
  ; Span: [row: 198, col: 9] - Node: MethodCallExpr
  ; Span: [row: 198, col: 9] - Expr: MethodCallExpr
  ; Span: [row: 198, col: 9] - Expr: Identifier
  %t.1 = load ptr, ptr %self_0_1
  ; Span: [row: 198, col: 29] - Expr: Identifier
  %t.2 = load ptr, ptr %s_0_2
  call void @StringBuilder_append_builder(ptr null, ptr %t.1, ptr %t.2)
  ret void
}

  ; Span: [row: 211, col: 5] - Node: FunDecl
define void @StringBuilder_append_builder(ptr %env, ptr %self.param, ptr %s.param) {
entry:
  %self_0_1 = alloca ptr, align 8
  store ptr %self.param, ptr %self_0_1, align 8
  %s_0_2 = alloca ptr, align 8
  store ptr %s.param, ptr %s_0_2, align 8
  ; Span: [row: 212, col: 9] - Node: VarDecl
  %add_len_0_3 = alloca i64
  ; Span: [row: 212, col: 32] - Expr: CallExpr
  ; Span: [row: 212, col: 39] - Expr: Identifier
  %t.1 = load ptr, ptr %s_0_2
  %t.2 = call i64 @strlen(ptr %t.1)
  store i64 %t.2, ptr %add_len_0_3
  ; Span: [row: 213, col: 9] - Node: VarDecl
  %new_len_0_4 = alloca i64
  ; Span: [row: 213, col: 32] - Expr: BinaryExpr
  ; Span: [row: 213, col: 32] - Expr: MemberExpr
  ; Span: [row: 213, col: 33] - Expr: UnaryExpr
  ; Span: [row: 213, col: 39] - Expr: Identifier
  %t.3 = load ptr, ptr %self_0_1
  %t.4 = load %StringBuilder, ptr %t.3
  %t.5 = extractvalue %StringBuilder %t.4, 1
  ; Span: [row: 213, col: 51] - Expr: Identifier
  %t.6 = load i64, ptr %add_len_0_3
  %t.7 = add i64 %t.5, %t.6
  store i64 %t.7, ptr %new_len_0_4
  ; Span: [row: 214, col: 9] - Node: IfStmt
  ; Span: [row: 214, col: 9] - Expr: IfStmt
  ; Span: [row: 214, col: 12] - Expr: BinaryExpr
  ; Span: [row: 214, col: 12] - Expr: Identifier
  %t.8 = load i64, ptr %new_len_0_4
  ; Span: [row: 214, col: 23] - Expr: MemberExpr
  ; Span: [row: 214, col: 24] - Expr: UnaryExpr
  ; Span: [row: 214, col: 30] - Expr: Identifier
  %t.9 = load ptr, ptr %self_0_1
  %t.10 = load %StringBuilder, ptr %t.9
  %t.11 = extractvalue %StringBuilder %t.10, 2
  %t.13 = icmp sge i64 %t.8, %t.11
  %t.12 = zext i1 %t.13 to i8
  %t.14 = icmp ne i8 %t.12, 0
  br i1 %t.14, label %if.then.14, label %if.else.14
if.then.14:
  ; Span: [row: 214, col: 45] - Expr: BlockStmt
  ; Span: [row: 215, col: 13] - Node: VarDecl
  %new_cap_1_5 = alloca i64
  ; Span: [row: 215, col: 36] - Expr: BinaryExpr
  ; Span: [row: 215, col: 37] - Expr: BinaryExpr
  ; Span: [row: 215, col: 37] - Expr: Identifier
  %t.15 = load i64, ptr %new_len_0_4
  ; Span: [row: 215, col: 47] - Expr: NumberLiteral
  %t.16 = add i64 %t.15, 1
  ; Span: [row: 215, col: 52] - Expr: NumberLiteral
  %t.17 = mul i64 %t.16, 2
  store i64 %t.17, ptr %new_cap_1_5
  ; Span: [row: 216, col: 13] - Node: BinaryExpr
  ; Span: [row: 216, col: 13] - Expr: BinaryExpr
  ; Span: [row: 216, col: 35] - Expr: CastExpr
  ; Span: [row: 216, col: 35] - Expr: CallExpr
  ; Span: [row: 216, col: 42] - Expr: CastExpr
  ; Span: [row: 216, col: 42] - Expr: MemberExpr
  ; Span: [row: 216, col: 43] - Expr: UnaryExpr
  ; Span: [row: 216, col: 49] - Expr: Identifier
  %t.18 = load ptr, ptr %self_0_1
  %t.19 = load %StringBuilder, ptr %t.18
  %t.20 = extractvalue %StringBuilder %t.19, 0
  ; Span: [row: 216, col: 70] - Expr: Identifier
  %t.21 = load i64, ptr %new_cap_1_5
  %t.22 = call ptr @mantiq_realloc(ptr %t.20, i64 %t.21)
  ; Span: [row: 216, col: 20] - Expr: Identifier
  %t.23 = load ptr, ptr %self_0_1
  %t.24 = getelementptr %StringBuilder, ptr %t.23, i32 0, i32 0
  store ptr %t.22, ptr %t.24
  ; Span: [row: 217, col: 13] - Expr: BinaryExpr
  ; Span: [row: 217, col: 37] - Expr: Identifier
  %t.25 = load i64, ptr %new_cap_1_5
  ; Span: [row: 217, col: 20] - Expr: Identifier
  %t.26 = load ptr, ptr %self_0_1
  %t.27 = getelementptr %StringBuilder, ptr %t.26, i32 0, i32 2
  store i64 %t.25, ptr %t.27
  br label %if.end.14
if.else.14:
  br label %if.end.14
if.end.14:
  ; Span: [row: 218, col: 9] - Node: VarDecl
  %dest_ptr_0_6 = alloca ptr
  ; Span: [row: 218, col: 35] - Expr: UnaryExpr
  ; Span: [row: 218, col: 39] - Expr: MemberExpr
  ; Span: [row: 218, col: 40] - Expr: UnaryExpr
  ; Span: [row: 218, col: 46] - Expr: Identifier
  %t.28 = load ptr, ptr %self_0_1
  %t.29 = load %StringBuilder, ptr %t.28
  %t.30 = extractvalue %StringBuilder %t.29, 0
  ; Span: [row: 218, col: 59] - Expr: MemberExpr
  ; Span: [row: 218, col: 60] - Expr: UnaryExpr
  ; Span: [row: 218, col: 66] - Expr: Identifier
  %t.31 = load ptr, ptr %self_0_1
  %t.32 = load %StringBuilder, ptr %t.31
  %t.33 = extractvalue %StringBuilder %t.32, 1
  %t.34 = getelementptr inbounds i8, ptr %t.30, i64 %t.33
  store ptr %t.34, ptr %dest_ptr_0_6
  ; Span: [row: 219, col: 9] - Node: CallExpr
  ; Span: [row: 219, col: 9] - Expr: CallExpr
  ; Span: [row: 219, col: 16] - Expr: CastExpr
  ; Span: [row: 219, col: 16] - Expr: Identifier
  %t.35 = load ptr, ptr %dest_ptr_0_6
  ; Span: [row: 219, col: 33] - Expr: CastExpr
  ; Span: [row: 219, col: 33] - Expr: Identifier
  %t.36 = load ptr, ptr %s_0_2
  ; Span: [row: 219, col: 43] - Expr: BinaryExpr
  ; Span: [row: 219, col: 43] - Expr: Identifier
  %t.37 = load i64, ptr %add_len_0_3
  ; Span: [row: 219, col: 53] - Expr: NumberLiteral
  %t.38 = add i64 %t.37, 1
  %t.39 = call ptr @memcpy(ptr %t.35, ptr %t.36, i64 %t.38)
  call void @mantiq_print_ptr(ptr %t.39)
  call void @mantiq_print_newline()
  ; Span: [row: 220, col: 9] - Node: BinaryExpr
  ; Span: [row: 220, col: 9] - Expr: BinaryExpr
  ; Span: [row: 220, col: 28] - Expr: Identifier
  %t.40 = load i64, ptr %new_len_0_4
  ; Span: [row: 220, col: 16] - Expr: Identifier
  %t.41 = load ptr, ptr %self_0_1
  %t.42 = getelementptr %StringBuilder, ptr %t.41, i32 0, i32 1
  store i64 %t.40, ptr %t.42
  ret void
}

  ; Span: [row: 231, col: 5] - Node: FunDecl
define %String @StringBuilder_to_string(ptr %env, ptr %self.param) {
entry:
  %self_0_1 = alloca ptr, align 8
  store ptr %self.param, ptr %self_0_1, align 8
  ; Span: [row: 232, col: 9] - Node: ReturnStmt
  ; Span: [row: 232, col: 16] - Expr: MethodCallExpr
  ; Span: [row: 232, col: 16] - Expr: Identifier
  %t.1 = load ptr, ptr %self_0_1
  %t.2 = call %String @StringBuilder_builder_to_string(ptr null, ptr %t.1)
  ret %String %t.2
}

  ; Span: [row: 244, col: 5] - Node: FunDecl
define %String @StringBuilder_builder_to_string(ptr %env, ptr %self.param) {
entry:
  %self_0_1 = alloca ptr, align 8
  store ptr %self.param, ptr %self_0_1, align 8
  ; Span: [row: 245, col: 9] - Node: ReturnStmt
  ; Span: [row: 245, col: 16] - Expr: CallExpr
  %t.1 = alloca %String, align 8
  store %String zeroinitializer, ptr %t.1, align 8
  ; Span: [row: 245, col: 23] - Expr: CastExpr
  ; Span: [row: 245, col: 23] - Expr: MemberExpr
  ; Span: [row: 245, col: 24] - Expr: UnaryExpr
  ; Span: [row: 245, col: 30] - Expr: Identifier
  %t.2 = load ptr, ptr %self_0_1
  %t.3 = load %StringBuilder, ptr %t.2
  %t.4 = extractvalue %StringBuilder %t.3, 0
  ; Span: [row: 59, col: 89] - Expr: CastExpr
  ; Span: [row: 59, col: 89] - Expr: Identifier
  ; Span: [row: 59, col: 121] - Expr: NumberLiteral
  %t.5 = zext i32 0 to i64
  ; Span: [row: 59, col: 144] - Expr: NumberLiteral
  %t.6 = zext i32 0 to i64
  call void @String___init__(ptr null, ptr %t.1, ptr %t.4, ptr null, i64 %t.5, i64 %t.6)
  %t.7 = load %String, ptr %t.1, align 8
  ret %String %t.7
}

define i32 @main() {
entry:
  ; Span: [row: 1, col: 1] - Node: PassStmt
  ; Span: [row: 1, col: 1] - Expr: PassStmt
  ; Span: [row: 2, col: 1] - Node: PassStmt
  ; Span: [row: 2, col: 1] - Expr: PassStmt
  ; Span: [row: 3, col: 1] - Node: PassStmt
  ; Span: [row: 3, col: 1] - Expr: PassStmt
  ; Span: [row: 4, col: 1] - Node: PassStmt
  ; Span: [row: 4, col: 1] - Expr: PassStmt
  ; Span: [row: 5, col: 1] - Node: PassStmt
  ; Span: [row: 5, col: 1] - Expr: PassStmt
  ; Span: [row: 6, col: 1] - Node: PassStmt
  ; Span: [row: 6, col: 1] - Expr: PassStmt
  ; Span: [row: 7, col: 1] - Node: PassStmt
  ; Span: [row: 7, col: 1] - Expr: PassStmt
  ; Span: [row: 8, col: 1] - Node: PassStmt
  ; Span: [row: 8, col: 1] - Expr: PassStmt
  ; Span: [row: 9, col: 1] - Node: PassStmt
  ; Span: [row: 9, col: 1] - Expr: PassStmt
  ; Span: [row: 10, col: 1] - Node: PassStmt
  ; Span: [row: 10, col: 1] - Expr: PassStmt
  ; Span: [row: 11, col: 1] - Node: PassStmt
  ; Span: [row: 11, col: 1] - Expr: PassStmt
  ; Span: [row: 12, col: 1] - Node: PassStmt
  ; Span: [row: 12, col: 1] - Expr: PassStmt
  ; Span: [row: 13, col: 1] - Node: PassStmt
  ; Span: [row: 13, col: 1] - Expr: PassStmt
  ; Span: [row: 14, col: 1] - Node: PassStmt
  ; Span: [row: 14, col: 1] - Expr: PassStmt
  ; Span: [row: 16, col: 1] - Node: PassStmt
  ; Span: [row: 16, col: 1] - Expr: PassStmt
  ; Span: [row: 17, col: 1] - Node: PassStmt
  ; Span: [row: 17, col: 1] - Expr: PassStmt
  ; Span: [row: 18, col: 1] - Node: PassStmt
  ; Span: [row: 18, col: 1] - Expr: PassStmt
  ; Span: [row: 19, col: 1] - Node: PassStmt
  ; Span: [row: 19, col: 1] - Expr: PassStmt
  ; Span: [row: 22, col: 1] - Node: PassStmt
  ; Span: [row: 22, col: 1] - Expr: PassStmt
  ; Span: [row: 23, col: 1] - Node: PassStmt
  ; Span: [row: 23, col: 1] - Expr: PassStmt
  ; Span: [row: 24, col: 1] - Node: PassStmt
  ; Span: [row: 24, col: 1] - Expr: PassStmt
  ; Span: [row: 25, col: 1] - Node: PassStmt
  ; Span: [row: 25, col: 1] - Expr: PassStmt
  ; Span: [row: 26, col: 1] - Node: PassStmt
  ; Span: [row: 26, col: 1] - Expr: PassStmt
  ; Span: [row: 27, col: 1] - Node: PassStmt
  ; Span: [row: 27, col: 1] - Expr: PassStmt
  ; Span: [row: 31, col: 1] - Node: PassStmt
  ; Span: [row: 31, col: 1] - Expr: PassStmt
  ; Span: [row: 32, col: 1] - Node: PassStmt
  ; Span: [row: 32, col: 1] - Expr: PassStmt
  ; Span: [row: 33, col: 1] - Node: PassStmt
  ; Span: [row: 33, col: 1] - Expr: PassStmt
  ; Span: [row: 34, col: 1] - Node: PassStmt
  ; Span: [row: 34, col: 1] - Expr: PassStmt
  ; Span: [row: 35, col: 1] - Node: PassStmt
  ; Span: [row: 35, col: 1] - Expr: PassStmt
  ; Span: [row: 36, col: 1] - Node: PassStmt
  ; Span: [row: 36, col: 1] - Expr: PassStmt
  ; Span: [row: 37, col: 1] - Node: PassStmt
  ; Span: [row: 37, col: 1] - Expr: PassStmt
  ; Span: [row: 38, col: 1] - Node: PassStmt
  ; Span: [row: 38, col: 1] - Expr: PassStmt
  ; Span: [row: 39, col: 1] - Node: PassStmt
  ; Span: [row: 39, col: 1] - Expr: PassStmt
  ; Span: [row: 40, col: 1] - Node: PassStmt
  ; Span: [row: 40, col: 1] - Expr: PassStmt
  ; Span: [row: 41, col: 1] - Node: PassStmt
  ; Span: [row: 41, col: 1] - Expr: PassStmt
  ; Span: [row: 42, col: 1] - Node: PassStmt
  ; Span: [row: 42, col: 1] - Expr: PassStmt
  ; Span: [row: 43, col: 1] - Node: PassStmt
  ; Span: [row: 43, col: 1] - Expr: PassStmt
  ; Span: [row: 44, col: 1] - Node: PassStmt
  ; Span: [row: 44, col: 1] - Expr: PassStmt
  ; Span: [row: 45, col: 1] - Node: PassStmt
  ; Span: [row: 45, col: 1] - Expr: PassStmt
  ; Span: [row: 46, col: 1] - Node: PassStmt
  ; Span: [row: 46, col: 1] - Expr: PassStmt
  ; Span: [row: 47, col: 1] - Node: PassStmt
  ; Span: [row: 47, col: 1] - Expr: PassStmt
  ; Span: [row: 129, col: 1] - Node: PassStmt
  ; Span: [row: 129, col: 1] - Expr: PassStmt
  ; Span: [row: 130, col: 1] - Node: PassStmt
  ; Span: [row: 130, col: 1] - Expr: PassStmt
  ; Span: [row: 131, col: 1] - Node: PassStmt
  ; Span: [row: 131, col: 1] - Expr: PassStmt
  ; Span: [row: 132, col: 1] - Node: PassStmt
  ; Span: [row: 132, col: 1] - Expr: PassStmt
  ; Span: [row: 133, col: 1] - Node: PassStmt
  ; Span: [row: 133, col: 1] - Expr: PassStmt
  ; Span: [row: 134, col: 1] - Node: PassStmt
  ; Span: [row: 134, col: 1] - Expr: PassStmt
  ; Span: [row: 135, col: 1] - Node: PassStmt
  ; Span: [row: 135, col: 1] - Expr: PassStmt
  ; Span: [row: 136, col: 1] - Node: PassStmt
  ; Span: [row: 136, col: 1] - Expr: PassStmt
  ; Span: [row: 137, col: 1] - Node: PassStmt
  ; Span: [row: 137, col: 1] - Expr: PassStmt
  ; Span: [row: 138, col: 1] - Node: PassStmt
  ; Span: [row: 138, col: 1] - Expr: PassStmt
  ; Span: [row: 139, col: 1] - Node: PassStmt
  ; Span: [row: 139, col: 1] - Expr: PassStmt
  ; Span: [row: 140, col: 1] - Node: PassStmt
  ; Span: [row: 140, col: 1] - Expr: PassStmt
  ; Span: [row: 141, col: 1] - Node: PassStmt
  ; Span: [row: 141, col: 1] - Expr: PassStmt
  ; Span: [row: 142, col: 1] - Node: PassStmt
  ; Span: [row: 142, col: 1] - Expr: PassStmt
  ; Span: [row: 143, col: 1] - Node: PassStmt
  ; Span: [row: 143, col: 1] - Expr: PassStmt
  ; Span: [row: 144, col: 1] - Node: PassStmt
  ; Span: [row: 144, col: 1] - Expr: PassStmt
  ; Span: [row: 145, col: 1] - Node: PassStmt
  ; Span: [row: 145, col: 1] - Expr: PassStmt
  ; Span: [row: 146, col: 1] - Node: PassStmt
  ; Span: [row: 146, col: 1] - Expr: PassStmt
  ; Span: [row: 147, col: 1] - Node: PassStmt
  ; Span: [row: 147, col: 1] - Expr: PassStmt
  ; Span: [row: 148, col: 1] - Node: PassStmt
  ; Span: [row: 148, col: 1] - Expr: PassStmt
  ; Span: [row: 149, col: 1] - Node: PassStmt
  ; Span: [row: 149, col: 1] - Expr: PassStmt
  ; Span: [row: 150, col: 1] - Node: PassStmt
  ; Span: [row: 150, col: 1] - Expr: PassStmt
  ; Span: [row: 247, col: 1] - Node: PassStmt
  ; Span: [row: 247, col: 1] - Expr: PassStmt
  ; Span: [row: 248, col: 1] - Node: PassStmt
  ; Span: [row: 248, col: 1] - Expr: PassStmt
  ; Span: [row: 249, col: 1] - Node: PassStmt
  ; Span: [row: 249, col: 1] - Expr: PassStmt
  ; Span: [row: 250, col: 1] - Node: PassStmt
  ; Span: [row: 250, col: 1] - Expr: PassStmt
  ; Span: [row: 251, col: 1] - Node: PassStmt
  ; Span: [row: 251, col: 1] - Expr: PassStmt
  ; Span: [row: 252, col: 1] - Node: PassStmt
  ; Span: [row: 252, col: 1] - Expr: PassStmt
  ; Span: [row: 253, col: 1] - Node: PassStmt
  ; Span: [row: 253, col: 1] - Expr: PassStmt
  ; Span: [row: 254, col: 1] - Node: PassStmt
  ; Span: [row: 254, col: 1] - Expr: PassStmt
  ; Span: [row: 255, col: 1] - Node: PassStmt
  ; Span: [row: 255, col: 1] - Expr: PassStmt
  ; Span: [row: 256, col: 1] - Node: PassStmt
  ; Span: [row: 256, col: 1] - Expr: PassStmt
  ; Span: [row: 257, col: 1] - Node: PassStmt
  ; Span: [row: 257, col: 1] - Expr: PassStmt
  ; Span: [row: 258, col: 1] - Node: PassStmt
  ; Span: [row: 258, col: 1] - Expr: PassStmt
  ; Span: [row: 259, col: 1] - Node: PassStmt
  ; Span: [row: 259, col: 1] - Expr: PassStmt
  ; Span: [row: 260, col: 1] - Node: PassStmt
  ; Span: [row: 260, col: 1] - Expr: PassStmt
  ; Span: [row: 261, col: 1] - Node: PassStmt
  ; Span: [row: 261, col: 1] - Expr: PassStmt
  ; Span: [row: 262, col: 1] - Node: PassStmt
  ; Span: [row: 262, col: 1] - Expr: PassStmt
  ; Span: [row: 263, col: 1] - Node: PassStmt
  ; Span: [row: 263, col: 1] - Expr: PassStmt
  ; Span: [row: 264, col: 1] - Node: PassStmt
  ; Span: [row: 264, col: 1] - Expr: PassStmt
  ; Span: [row: 265, col: 1] - Node: PassStmt
  ; Span: [row: 265, col: 1] - Expr: PassStmt
  ; Span: [row: 266, col: 1] - Node: PassStmt
  ; Span: [row: 266, col: 1] - Expr: PassStmt
  ; Span: [row: 267, col: 1] - Node: PassStmt
  ; Span: [row: 267, col: 1] - Expr: PassStmt
  ; Span: [row: 268, col: 1] - Node: PassStmt
  ; Span: [row: 268, col: 1] - Expr: PassStmt
  ; Span: [row: 269, col: 1] - Node: PassStmt
  ; Span: [row: 269, col: 1] - Expr: PassStmt
  ret i32 0
}

