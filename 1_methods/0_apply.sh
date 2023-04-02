#!/usr/bin/env bash

set -euo pipefail
set -x

bq query --nouse_legacy_sql --destination_table identifying_ai_research.ai_classifier_results < ai_classifier.sql
bq query --nouse_legacy_sql --destination_table identifying_ai_research.cluster_results < clusters.sql
bq query --nouse_legacy_sql --destination_table identifying_ai_research.field_results < fields.sql
bq query --nouse_legacy_sql --destination_table identifying_ai_research.keyword_results < keywords.sql
