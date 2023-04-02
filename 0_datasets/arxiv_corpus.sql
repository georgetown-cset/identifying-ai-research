create or replace table identifying_ai_research.arxiv_corpus as (
  select distinct
    merged_corpus.merged_id
  from identifying_ai_research.merged_corpus
  inner join identifying_ai_research.snapshot_article_links_with_dataset links on links.orig_id = merged_corpus.merged_id
  inner join identifying_ai_research.snapshot_all_metadata_with_cld2_lid meta on meta.id = links.orig_id
  where meta.dataset = 'arxiv'
)
