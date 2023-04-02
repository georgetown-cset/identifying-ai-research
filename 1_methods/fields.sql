with fields as (
  -- select L1 fields
  select
    merged_id,
    field.id as id,
    field.score as score,
    snapshot_field_meta.name as name,
    snapshot_field_meta.level as level,
  from identifying_ai_research.snapshot_field_scores,
    unnest(fields) as field
  inner join identifying_ai_research.snapshot_field_meta on field.id = field_id
  where snapshot_field_meta.level = 1
),
ranked_fields as (
  -- Rank L1 fields by score descending
  select
    merged_id,
    name,
    score,
    row_number() over(partition by merged_id order by score desc) as field_rank
  from fields
),
top_fields as (
  -- Restrict to the top 3 scoring fields for each ID
  select *
  from ranked_fields
  where field_rank <= 3
)
select
  -- Check if any of these is AI/ML
  merged_id,
  (
    logical_or(name = 'Machine learning')
    or logical_or(name = 'Artificial intelligence')
    or logical_or(name = 'Computer vision')
    or logical_or(name = 'Natural language processing')
    or logical_or(name = 'Pattern recognition')
    or logical_or(name = 'Robotics')
  ) as is_ai
from top_fields
group by merged_id