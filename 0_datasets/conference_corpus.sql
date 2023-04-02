-- Identify papers at top conferences from csrankings.org.
-- Regular expressions selected using DBLP to find all possibilities, then evaluating results to avoid false positives.
create or replace table identifying_ai_research.conference_corpus as (
  select distinct
    merged_id
  from identifying_ai_research.merged_corpus
  inner join identifying_ai_research.snapshot_paper_sources_merged using (merged_id)
  where
    regexp_contains(source_name, r'(?i)AAAI Conference on Artificial Intelligence')
    or regexp_contains(source_name, r'(?i)\(AAAI-')
    or (
      regexp_contains(source_name, r'(?i)International Joint Conference on Artificial Intelligence')
      or regexp_contains(source_name, r'(?i)IJCAI')
    ) and not regexp_contains(source_name, r'(?i)Multimedia for Cooking and Eating Activities')
    or regexp_contains(source_name, r'(?i)IEEE Conference on Computer Vision and Pattern Recognition')
    or (
      regexp_contains(source_name, r'(?i)\bCVPR')
      and not regexp_contains(source_name, r'(?i)旷视科技征战'))
    or regexp_contains(source_name, r'(?i)European Conference on Computer Vision')
    or regexp_contains(source_name, r'(?i)ECCV ')
    or regexp_contains(source_name, r'(?i)IEEE.*International Conference on Computer Vision')
    or regexp_contains(source_name, r'(?i)ICCV\b')
    or (
      regexp_contains(source_name, r'(?i)International Conference on Machine Learning')
      and not regexp_contains(source_name, r'(?i)(and)|(technologies)|(cybernetics)'))
    or (
      regexp_contains(source_name, r'(?i)\bICML\b')
      and not regexp_contains(source_name, r'(?i)(medical|lugano)'))
    or regexp_contains(source_name, r'(?i)International Conference on Knowledge Discovery [a|\&]n?d? Data Mining')
    or regexp_contains(source_name, r'(?i)SIGKDD')
    or regexp_contains(source_name, r'(?i)Neural Information Processing Systems')
    or regexp_contains(source_name, r'(?i)\bNeurIPS\b')
    or regexp_contains(source_name, r'(?i)Annual Meeting of the Association for Computational Linguistics')
    or (
      regexp_contains(source_name, r'\bACL\b')
      and conference = 1
      and not regexp_contains(source_name, r'(?i)(injur)|(special interest)|(coling)'))
    or regexp_contains(source_name, r'(?i)North American Chapter of the Association for Computational Linguistics')
    or regexp_contains(source_name, r'(?i)\bNAACL\b')
    or regexp_contains(source_name, r'(?i)Conference on Empirical Methods in Natural Language Processing')
    or regexp_contains(source_name, r'(?i)\bEMNLP\b')
    or (
      (
        regexp_contains(source_name, r'(?i)International.*Conference on Research and Development in Information Retrieval')
        or regexp_contains(source_name, r'(?i)\bSIGIR\b')
      ) and conference = 1
        and not regexp_contains(source_name, r'(?i)(ICTIR)|(CHIIR)')
    )
    or regexp_contains(source_name, r'(?i)International Conference on World Wide Web')
    or regexp_contains(source_name, r'(?i)International World Wide Web Conference')
    or regexp_contains(source_name, r'(?i)The Web Conference')
    or regexp_contains(source_name, r'(?i)world wide web conference')
)