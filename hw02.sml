fun andalso_list nil = true
| andalso_list (x::xs) = x andalso andalso_list(xs);

fun swap_pairs nil = nil
| swap_pairs ((x,y)::xs) = (y,x)::swap_pairs(xs);

fun make_trips (nil,nil,nil) = nil
| make_trips (a::ax,b::bx,c::cx) = (a,b,c)::make_trips(ax,bx,cx);

fun fun_pipe (x::nil) = x
| fun_pipe (x::xs) = x o fun_pipe(xs);

fun add3 x = x + 3;
fun add5 x = x + 5;
fun add7 x = x + 7;
val c = add3 o add5;
fun sub7 x = x - 7;
fun sub4 x = x - 4;
val h = fun_pipe [add3,add5,sub4];

fun inorder_insert nil n = n::nil
| inorder_insert (x::nil) n = if x < n then x::n::nil else n::x::nil
| inorder_insert (x::xs) n = if x > n then n::x::xs else x::inorder_insert xs n;

inorder_insert [1,3,5,7,9] 8;
inorder_insert [1,3,5,7,9] 2;
inorder_insert [1,3,5,7,9] 12;
inorder_insert [1,3,5,7,9] 0;

fun remove_item (p, nil) = nil
| remove_item (p, (x::xs)) = if p x then remove_item (p, xs) else x::remove_item (p, xs); 

remove_item ((fn n => n > 4),[1,2,3,4,5,6,7]);
remove_item ((fn l => length(l) > 2),[[1,2,3],[],[1],[2,3,4,5]]);

fun list_mult nil = 1
| list_mult (x::xs) = x * list_mult(xs);

list_mult [1,3,2];

fun super_mult nil = 1
| super_mult (x::xs) = list_mult x * super_mult xs;

super_mult [[1,3,2],[2],[2,3]];
super_mult [[],[],[2]];
super_mult [];
super_mult [[]];
super_mult [[2],[2],[2]];
