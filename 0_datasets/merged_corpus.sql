-- Generate a subset of publications from the merged corpus that are (1) assigned a research cluster id and (2)
-- published in 2010 or later. Results are saved to identifying_ai_research.merged_corpus.

create or replace table identifying_ai_research.merged_corpus as (
  select
    merged_id,
  from identifying_ai_research.snapshot_dc5_cluster_description_stable
  inner join identifying_ai_research.snapshot_dc5_cluster_assignment_stable using(cluster_id)
  inner join identifying_ai_research.snapshot_corpus_merged using(merged_id)
  where snapshot_corpus_merged.year >= 2010
)
