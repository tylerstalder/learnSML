fun fun_pipe (x::nil) = x
| fun_pipe (x::xs) = x o fun_pipe(xs);

fun add3 x = x + 3;
fun add5 x = x + 5;
fun add7 x = x + 7;
val c = add3 o add5;
fun sub7 x = x - 7;
fun sub4 x = x - 4;
val h = fun_pipe [add3,add5,sub4];