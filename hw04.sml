
fun power (x,0) = 1.0
| power (x,y) = x * power(x, y-1);

datatype exp = Lit of real
             | Plus  of exp * exp
             | Times of exp * exp
             | Power of exp * int;

val exp1 = Lit(5.2);
val exp2 = Times(exp1,exp1);
val exp3 = Power(Lit(5.0),2);
val exp4 = Plus(Times(exp1,exp2),exp3);

fun eval (Lit(x)) = x
| eval (Times(x,y)) = eval(x) * eval(y)
| eval (Power(x,y)) = power(eval(x), y)
| eval (Plus(x,y)) = eval(x) + eval(y);

eval(exp1);
eval(exp2);
eval(exp3);
eval(exp4);

type ring = int * int * int * int;
			 
datatype ringexp = RotateLeft of ringexp
                 | RotateRight of ringexp
                 | Add of ringexp * ringexp
                 | Lit of ring
                 | MakeConstant of int;

fun eval_ring (Lit(a)) = (a)
| eval_ring (RotateLeft(x)) = 
	let val(a,b,c,d) = eval_ring(x)
	in
		(b,c,d,a)
	end
| eval_ring (RotateRight(x)) = 
	let val(a,b,c,d) = eval_ring(x)
	in
		(d,a,b,c)
	end
| eval_ring (Add(x,y)) = 
	let val(a,b,c,d) = eval_ring(x)
		val(a1,b1,c1,d1) = eval_ring(y)
	in
		(a+a1, b+b1, c+c1, d+d1)
	end
| eval_ring (MakeConstant(x)) = eval_ring(Lit(x,x,x,x));
				 
val rexp1 = Lit(1,2,3,4);
val rexp2 = RotateLeft(RotateLeft(rexp1));
val rexp3 = Add(rexp2,MakeConstant(5));
val rexp4 = RotateRight(Add(rexp2,rexp3));

eval_ring(rexp1);
eval_ring(rexp2);
eval_ring(rexp3);
eval_ring(rexp4);