select category_id, parent_category_id, category_name, level from shopping_categories
start with parent_category_id is null
connect by prior category_id = parent_category_id
order siblings by category_name;

select category_id, parent_category_id, category_name, level from shopping_categories
start with category_name like '%Phones%'
connect by prior category_id = parent_category_id;


select max(t.good) from 
(
select category_id, category_name, level as good from shopping_categories
start with parent_category_id is null
connect by prior category_id = parent_category_id
) t


