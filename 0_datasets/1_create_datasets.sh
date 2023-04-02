#!/usr/bin/env bash

set -euo pipefail

bq query --nouse_legacy_sql < merged_corpus.sql
bq query --nouse_legacy_sql < conference_corpus.sql
bq query --nouse_legacy_sql < arxiv_corpus.sql
