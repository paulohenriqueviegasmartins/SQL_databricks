-- Using to create age from birth date in Databricks--

-- CREATE OR REPLACE VIEW sb_squad.tab_standart as

SELECT
  distinct(tab_standart.nome),
  replace(tab_standart.cpf, "  ", "") as cpf,
  tab_standart.id,
  datediff(current_date(),
         TO_DATE(CAST(UNIX_TIMESTAMP
         (nome_tab_2.dat_nascimento,'yyyy-MM-dd') 
         AS TIMESTAMP)))/365 as idade
FROM db_diag.base_func funcionario
LEFT JOIN sb_squad.tab_standart_1 tab_standart
ON funcionario.cpf = tab_standart.cpf
where nome is not null

