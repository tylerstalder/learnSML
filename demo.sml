fun count nil = 0
| count (x::xs) = 1+count(xs);

val p = [6,5,3,1];

fun sum nil = 0
| sum (x::xs) = x+sum(xs);

fun inc nil = nil
| inc (x::xs) = (x+1)::inc(xs);

val li = [(1,2),(3,4),(5,6)];

fun inc_t nil = nil
| inc_t ((x,y)::xs) = (x+1,y+1)::inc_t(xs);
