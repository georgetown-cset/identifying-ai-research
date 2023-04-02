select
  merged_id,
  (
    coalesce(shared_functions.isAI(lower(title_english)), false)
    or coalesce(shared_functions.isAI(lower(abstract_english)), false)
    or coalesce(shared_functions.isAI(lower(title_foreign)), false)
    or coalesce(shared_functions.isAI(lower(abstract_foreign)), false)
  ) as is_ai
-- This table just has merged_ids
from identifying_ai_research.merged_corpus
-- We get the titles and abstracts here
inner join identifying_ai_research.snapshot_corpus_merged using(merged_id)
