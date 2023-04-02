select
  merged_id,
  coalesce(ai_pred, 0.0) >= 0.5 as is_ai
from identifying_ai_research.merged_corpus
left join identifying_ai_research.snapshot_dc5_cluster_assignment_stable using(merged_id)
left join identifying_ai_research.snapshot_dc5_cluster_description_stable using(cluster_id)
