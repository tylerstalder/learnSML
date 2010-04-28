fun update_table x y nil = (x,y)::nil
| update_table x y ((k, v)::zs) = if x = k then (x, y)::zs else (k, v)::update_table x y zs;

fun lookup_table x nil = NONE
| lookup_table x ((x',v')::t) = if x = x' then SOME(v') else lookup_table x t;

val empty_table = nil;
val t1 = update_table "john" 5 empty_table;
val t2 = update_table "mark" 12 t1;
val t3 = update_table "john" 99 t2;
val t4 = update_table "sam" 3 t3;

lookup_table "john" t4;
lookup_table "sam" t4;
lookup_table "jill" t4;

datatype 'a tree = Leaf of 'a | Node of 'a tree * 'a * 'a tree;

fun tree_swap_pairs (Leaf(x,y)) = Leaf(y,x)
| tree_swap_pairs (Node(x,(a,b),z)) = Node(tree_swap_pairs(x),(b,a),tree_swap_pairs(z));

val t1 = Leaf ("foo",3);
val t2 = Leaf ("bar",7);
val t3 = Node (t1,("baz",12),t1);
val t4 = Node (Leaf("boof",~1),("bletch",98),t3);
tree_swap_pairs t1;
tree_swap_pairs t2;
tree_swap_pairs t3;
tree_swap_pairs t4;

fun tree_map (Leaf(x)) y = Leaf(y(x))
| tree_map (Node(x,y,z)) a = Node(tree_map x a,a(y),tree_map z a);

val tree1 = Leaf(3);
val tree2 = Node(tree1,5,tree1);
val tree3 = Node(tree2,10,tree1);
val tree4 = Node(tree2,22,tree3);
fun add3 x = x + 3;
fun sub4 x = x - 4;

tree_map tree2 add3;
tree_map tree4 sub4;
tree_map tree4 (fn x => if x > 5 then true else false);