(* use "task.ml"; *)
val tasks = [
  ("t1", 2, 4),
  ("t2", 4, 6),
  ("t3", 3, 7),
  ("t4", 8, 9),
  ("t5", 1, 10),
  ("t6", 10, 1)
] : (string * int * int) list;

fun internal_check_task(task : (string * int * int)) = #2 task < #3 task;

(*
  check_task("t1", tasks);
  check_task("t6", tasks);
 *)
fun check_task(taskName : string, tasks : (string * int * int) list) =
    let val optionTask = List.find (fn t => String.compare(#1 t, taskName) = EQUAL ) tasks
    in 
        case optionTask of
            SOME task => internal_check_task(task)
          | NONE => false
    end

(*
  compatible("t1", "t2", tasks);
  compatible("t1", "t5", tasks);
  compatible("t2", "t3", tasks);
  compatible("t3", "t4", tasks);
 *)
fun compatible(taskName1 : string, taskName2 : string, tasks : (string * int * int) list) =
    let val optionTask1 = List.find (fn t => String.compare(#1 t, taskName1) = EQUAL ) tasks
        val optionTask2 = List.find (fn t => String.compare(#1 t, taskName2) = EQUAL ) tasks
    in 
        case (optionTask1, optionTask2) of
            (SOME task1, SOME task2) => internal_check_task(task1) andalso internal_check_task(task2) andalso (#3 task1 <= #2 task2 orelse #3 task2 <= #2 task1)
          | _ => false
    end

fun get_pairs(elements : string list) =
    let val pairs : (string * string) list = []
    in
        List.filter (fn pair => #1 pair <> #2 pair)
            (List.concat
                (List.map (fn e1 => 
                    List.map (fn e2 => 
                        (e1,e2)
                    ) elements
                ) elements))
    end

(* 
  compatible_list(["t1", "t2", "t4"], tasks);
  compatible_list(["t1", "t2", "t3", "t4", "t5"], tasks);
  compatible_list(["t3", "t4"], tasks);
 *)
fun compatible_list(taskNames : string list, tasks : (string * int * int) list) =
    let val pairs = get_pairs(taskNames)
    in
        List.all (fn bool => bool)
            (List.map (fn pair => 
                compatible(#1 pair, #2 pair, tasks)
            ) pairs)
    end