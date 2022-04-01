SELECT
cpf_cliente,
name_cliente,
max(t_trab_a) as t_trab_a,
max(t_trab_m) as t_trab_m,
max(t_trab_d) as t_trab_d
FROM
(SELECT
  cliente.cpf_cliente cpf_cliente,
  cliente.name_cliente name_cliente,
  cliente.admissao_dt admissao_dt,
  
  /* ////////////////////////// */
  /* TEMPO EM ANOS//// */
  /* ////////////////////////// */
  
  CASE
  WHEN ativo = 'S'
  THEN
  datediff(current_date(),
         TO_DATE(CAST(UNIX_TIMESTAMP
         (cliente.admissao_dt,'yyyy-MM-dd') 
         AS TIMESTAMP)))/365.25
  WHEN ativo = 'N' and desligamento_dt is not null
  THEN
  datediff(desligamento_dt, admissao_dt)/365.25
  --ELSE 'outro_caso'  
  END AS t_trab_a,
  
  /* //////////////////////////// */
  /* TEMPO EM MESES///// */
  /* //////////////////////////// */
  
  CASE
  WHEN ativo = 'S'
  THEN
  ((datediff(current_date(),
         TO_DATE(CAST(UNIX_TIMESTAMP
         (cliente.admissao_dt,'yyyy-MM-dd') 
         AS TIMESTAMP)))/365.25)*12)
         
  WHEN ativo = 'N' and desligamento_dt is not null
  THEN
  (datediff(desligamento_dt, admissao_dt)/365.25)*12
  --ELSE 'outro_caso'  
  END AS t_trab_m,
  
  /* //////////////////////////// */
  /* TEMPO EM DIAS////// */
  /* //////////////////////////// */
  
  CASE
  WHEN ativo = 'S'
  THEN
  datediff(current_date(),
         TO_DATE(CAST(UNIX_TIMESTAMP
         (cliente.admissao_dt,'yyyy-MM-dd') 
         AS TIMESTAMP)))
  WHEN ativo = 'N' and desligamento_dt is not null
  THEN
  datediff(desligamento_dt, admissao_dt)
  --ELSE 'outro_caso'
  END AS t_trab_d
  
  
FROM db_siaf.base_cliente cliente
WHERE ind_professor = 'S')
GROUP BY
cpf_cliente,
name_cliente
ORDER BY
cpf_cliente