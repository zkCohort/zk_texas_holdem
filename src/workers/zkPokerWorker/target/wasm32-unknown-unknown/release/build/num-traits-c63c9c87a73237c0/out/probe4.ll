; ModuleID = 'probe4.99e04e0574a21546-cgu.0'
source_filename = "probe4.99e04e0574a21546-cgu.0"
target datalayout = "e-m:e-p:32:32-p10:8:8-p20:8:8-i64:64-n32:64-S128-ni:1:10:20"
target triple = "wasm32-unknown-unknown"

@alloc_db2a183589f2976dee4c4686db742a33 = private unnamed_addr constant <{ [75 x i8] }> <{ [75 x i8] c"/rustc/cd674d61790607dfb6faa9d754bd3adfa13aea7c/library/core/src/num/mod.rs" }>, align 1
@alloc_abdcb23421bec5e4e0080b975bdea6c1 = private unnamed_addr constant <{ ptr, [12 x i8] }> <{ ptr @alloc_db2a183589f2976dee4c4686db742a33, [12 x i8] c"K\00\00\00v\04\00\00\05\00\00\00" }>, align 4
@str.0 = internal constant [25 x i8] c"attempt to divide by zero"

; probe4::probe
; Function Attrs: nounwind
define hidden void @_ZN6probe45probe17ha321805efdae9dffE() unnamed_addr #0 {
start:
  %0 = call i1 @llvm.expect.i1(i1 false, i1 false)
  br i1 %0, label %panic.i, label %"_ZN4core3num21_$LT$impl$u20$u32$GT$10div_euclid17hef242fa49e3c00f1E.exit"

panic.i:                                          ; preds = %start
; call core::panicking::panic
  call void @_ZN4core9panicking5panic17h3f707f94f7ffdd55E(ptr align 1 @str.0, i32 25, ptr align 4 @alloc_abdcb23421bec5e4e0080b975bdea6c1) #3
  unreachable

"_ZN4core3num21_$LT$impl$u20$u32$GT$10div_euclid17hef242fa49e3c00f1E.exit": ; preds = %start
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare hidden i1 @llvm.expect.i1(i1, i1) #1

; core::panicking::panic
; Function Attrs: cold noinline noreturn nounwind
declare dso_local void @_ZN4core9panicking5panic17h3f707f94f7ffdd55E(ptr align 1, i32, ptr align 4) unnamed_addr #2

attributes #0 = { nounwind "target-cpu"="generic" }
attributes #1 = { nocallback nofree nosync nounwind willreturn memory(none) }
attributes #2 = { cold noinline noreturn nounwind "target-cpu"="generic" }
attributes #3 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"rustc version 1.75.0-nightly (cd674d617 2023-10-24)"}
