
fun Power (x,0) = 1
| Power (x,1) = x
| Power (x,y) = x * Power(x, y-1);

val exp1 = Lit(5.2);
val exp2 = Times(exp1,exp1);
val exp3 = Power(Lit(5.0),2);
val exp4 = Plus(Times(exp1,exp2),exp3);

eval(exp1);
eval(exp2);
eval(exp3);
eval(exp4);