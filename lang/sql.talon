mode: command
win.title: /(\.localdev)|(.sql)/
-
select star from: "select * from "
where: "where "
order by: "order by "
descending: " desc"
ascending: " asc"
dot i d: ".id"
is not null: " is not null"
is null: " is null"
inner join:
    insert("INNER JOIN  ON ")
    key(left:4)