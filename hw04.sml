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