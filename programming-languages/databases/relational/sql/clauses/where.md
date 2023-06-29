# SQL WHERE Clause

[Go back](../index.md#sql-clauses-)

<div class="row row-cols-md-2"><div>

The WHERE clause is used to filter records that will be in the output.

* Test an attribute value

```sql!
-- you can use > >= = <> (same as !=) < <=
SELECT name FROM customer WHERE name <> 'Luna'; -- Henry
SELECT name FROM customer WHERE name = 'Luna'; -- Luna

SELECT name FROM customer WHERE name IS NULL; -- none
SELECT name FROM customer WHERE name IS NOT NULL; -- Both

-- age in [18,24], same as age >= 18 AND age <= 24
SELECT name FROM customer WHERE age BETWEEN 18 AND 24;
```

For strings, you can test if an attribute matches a pattern: `_` is an unknown character, and `%` is a string that may be empty.

```sql!
-- any character followed by una
SELECT name FROM customer WHERE name LIKE '_una';
-- Ending with una
SELECT name FROM customer WHERE name LIKE '%una';
-- Starting with Lun
SELECT name FROM customer WHERE name LIKE 'Lun%';
```

⚠️ Patterns are case-insensitive <small>(k is the same as K)</small>.
</div><div>

* Test multiple conditions

```sql!
-- && and || are working too, but we are using AND and OR
Select name FROM customer WHERE name = 'Luna' OR gender <> 'Woman'; -- Both
Select name FROM customer WHERE name = 'Luna' AND gender <> 'Woman'; -- None
```

* Test if an attribute is/isn't within a set

```sql!
SELECT name FROM customer WHERE name IN ('Luna'); -- Luna
SELECT name FROM customer WHERE name IN ('Luna', 'Henry'); -- Both
SELECT name FROM customer WHERE name NOT IN ('Luna');

-- set is generated with a request
SELECT name FROM customer WHERE name IN (SELECT [...])
SELECT name FROM customer WHERE name NOT IN (SELECT [...])

-- every record
SELECT name FROM customer c WHERE age >= ALL (SELECT 0)
-- at least one record
SELECT name FROM customer c WHERE age >= ANY (SELECT 0)
```

* Test if a record exists in another table. For instance, to test if a customer has made a purchase, we can test if the customer ID is inside the purchases table. The nested select must return zero or one row.

```
SELECT name FROM customer c WHERE EXISTS (SELECT [...] WHERE c.id = [...]);
SELECT name FROM customer c WHERE NOT EXISTS (SELECT [...] WHERE c.id = [...]);
```
</div></div>