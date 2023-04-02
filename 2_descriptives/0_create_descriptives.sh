#!/usr/bin/env bash

set -euo pipefail

bq query --nouse_legacy_sql --destination_table identifying_ai_research.affiliations < affiliations.sql
bq query --nouse_legacy_sql --destination_table identifying_ai_research.languages < languages.sql
