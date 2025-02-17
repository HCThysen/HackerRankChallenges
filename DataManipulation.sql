-- TASK: Remove duplicates two versions using a qualify statement, and one without
-- To inspect which rows would be deleted:
SELECT * FROM dup_table;
WHERE EXISTS (
    SELECT 1 FROM dup_table d2 
    WHERE dup_table.id = d2.id
    AND dup_table.name = d2.name
    AND dup_table.value = d2.value
    AND dup_table.rowid > d2.rowid
);

-- Now we delete the rows
DELETE FROM dup_table
WHERE EXISTS(
    SELECT 1 FROM dup_table d2 
    WHERE dup_table.id = d2.id
    AND dup_table.name = d2.name
    AND dup_table.value = d2.value
    AND dup_table.rowid > d2.rowid
);

INSERT INTO dup_table VALUES (1, 'Alice', 100);

-- Alternatively just select the first occurrence of the dublicates
SELECT * FROM dup_table
WHERE rowid = (
    SELECT MIN(rowid) FROM dup_table d2 
    WHERE dup_table.id = d2.id
    AND dup_table.name = d2.name
    AND dup_table.value = d2.value
);

-- Maybe this would work too?
SELECT DISTINCT * FROM dup_table;

-- Replace NULL with zeroes
SELECT id, coalesce(value1, 0), COALESCE(value2,0), COALESCE(value3,0) FROM null_table;