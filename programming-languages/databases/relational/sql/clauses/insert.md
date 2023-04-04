# SQL INSERT Clause

<div class="row row-cols-md-2"><div>

Insert a new record.

```sql!
INSERT INTO client VALUES ('Luna', 18, 'Japan')
```

👉 You don't have to give a value to an "AUTO_INCREMENT" attribute.

</div><div>

You can also specify for which column you give a value. It's required when giving values in a different order than the table column order.

```sql!
INSERT INTO client(name, age, country) VALUES ('Luna', 18, 'Japan')
```
</div></div>