#!/usr/bin/env bash

set -euo pipefail

bq cp science_map_v2.dc5_cluster_description_stable \
  identifying_ai_research.snapshot_dc5_cluster_description_stable

bq cp science_map_v2.dc5_cluster_assignment_stable \
  identifying_ai_research.snapshot_dc5_cluster_assignment_stable

bq cp gcp_cset_links_v2.corpus_merged \
  identifying_ai_research.snapshot_corpus_merged

bq cp gcp_cset_links_v2.paper_sources_merged \
  identifying_ai_research.snapshot_paper_sources_merged

bq cp staging_arxiv_classifier.predictions_ai \
  identifying_ai_research.snapshot_classifier_predictions

bq cp gcp_cset_links_v2.all_metadata_with_cld2_lid \
  identifying_ai_research.snapshot_all_metadata_with_cld2_lid

bq cp gcp_cset_links_v2.article_links_with_dataset \
  identifying_ai_research.snapshot_article_links_with_dataset

bq cp gcp_cset_links_v2.paper_affiliations_merged \
  identifying_ai_research.snapshot_paper_affiliations_merged

bq cp fields_of_study_v2.field_scores \
  identifying_ai_research.snapshot_field_scores

bq cp fields_of_study_v2.field_meta \
  identifying_ai_research.snapshot_field_meta
