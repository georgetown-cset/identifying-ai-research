with languages as (
  select
    merged_id,
    (title_cld2_lid_success
     and title_cld2_lid_is_reliable
     and lower(title_cld2_lid_first_result) = 'english') as has_en_title,
    (abstract_cld2_lid_success
     and abstract_cld2_lid_is_reliable
     and lower(abstract_cld2_lid_first_result) = 'english') as has_en_abstract,
    (title_cld2_lid_success
      and title_cld2_lid_is_reliable
      and lower(title_cld2_lid_first_result) = 'chinese') as has_zh_title,
    (abstract_cld2_lid_success
      and abstract_cld2_lid_is_reliable
      and lower(abstract_cld2_lid_first_result) = 'chinese') as has_zh_abstract,
  from identifying_ai_research.merged_corpus
  inner join identifying_ai_research.snapshot_article_links_with_dataset links using(merged_id)
  inner join identifying_ai_research.snapshot_all_metadata_with_cld2_lid meta on meta.id = links.orig_id
)
select
  merged_id,
  (
    logical_or(coalesce(has_en_title, false))
    or logical_or(coalesce(has_en_abstract, false))
  ) as has_en,
  (
    logical_or(coalesce(has_zh_title, false))
    or logical_or(coalesce(has_zh_abstract, false))
  ) as has_zh,
from languages
group by merged_id
