select
  merged_id,
  cast(prediction as bool) as is_ai
from identifying_ai_research.merged_corpus
left join identifying_ai_research.snapshot_classifier_predictions on merged_id = id
