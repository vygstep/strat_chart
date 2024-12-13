WITH RECURSIVE unit_hierarchy AS (
    -- Base case: Start with the specific unit
    SELECT 
        u.unit_id, 
        u.parent_unit_id, 
        u.unit_name,
        u.rank_id  -- Include rank_id here to use it later in the join
    FROM stratchart.units u
    WHERE u.unit_name = 'Meghalayan'  -- Replace with the stage you're querying
    
    UNION ALL

    -- Recursive case: Get parent units
    SELECT 
        u.unit_id, 
        u.parent_unit_id, 
        u.unit_name,
        u.rank_id  -- Include rank_id here as well
    FROM stratchart.units u
    JOIN unit_hierarchy uh ON u.unit_id = uh.parent_unit_id
)
SELECT
    uh.unit_name,
    r.rank_name
FROM unit_hierarchy uh
LEFT JOIN stratchart.ranks r ON uh.rank_id = r.rank_id;
