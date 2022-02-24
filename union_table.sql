create or replace view sb_nova.control_study as

select
  doc_pessoa doc_pessoa,
  nome_pessoa nome_pessoa,
  ambiente ambiente,
  unidade_cadastrada unidade_cadastrada,
  id_marca id_marca
from
api_study.control_unidade_1

union all

select
  doc_pessoa doc_pessoa,
  nome_pessoa nome_pessoa,
  ambiente ambiente,
  unidade_cadastrada unidade_cadastrada,
  id_marca id_marca
from
api_study.control_unidade_2

union all

select
  doc_pessoa doc_pessoa,
  nome_pessoa nome_pessoa,
  ambiente ambiente,
  unidade_cadastrada unidade_cadastrada,
  id_marca id_marca
from
api_study.control_unidade_3

union all

select
  doc_pessoa doc_pessoa,
  nome_pessoa nome_pessoa,
  ambiente ambiente,
  unidade_cadastrada unidade_cadastrada,
  id_marca id_marca
from
api_study.control_unidade_4
