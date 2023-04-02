with affiliations as (
  -- Create indicators for whether a paper has a given affiliation
  select
    merged_id,
    country = 'United States' as has_us,
    country in (
      'Austria',
      'Belgium',
      'Bulgaria',
      'Croatia',
      'Cyprus',
      'Czech Republic',
      'Denmark',
      'Estonia',
      'Finland',
      'France',
      'Germany',
      'Greece',
      'Hungary',
      'Ireland',
      'Italy',
      'Latvia',
      'Lithuania',
      'Luxembourg',
      'Malta',
      'Netherlands',
      'Poland',
      'Portugal',
      'Romania',
      'Slovakia',
      'Slovenia',
      'Spain',
      'Sweden') as has_eu,
    country = 'China' as has_china,
    country is null as has_null,
  from identifying_ai_research.merged_corpus
  left join identifying_ai_research.snapshot_paper_affiliations_merged using(merged_id)
)
select
  merged_id,
  logical_or(coalesce(has_us, false)) as has_us,
  logical_or(coalesce(has_eu, false)) as has_eu,
  logical_or(coalesce(has_china, false)) as has_china,
  logical_and(has_null) as has_none
from affiliations
group by merged_id

