
select
cpf_cliente,
name_cliente,
max(t_trab_d) as t_trab_d,
max(t_trab_d*12/365.25) as t_trab_m,
max(t_trab_d/365.25) as t_trab_a
from
(select
cliente.cpf_cliente cpf_cliente,
cliente.name_cliente name_cliente,
cliente.admissao_dt admissao_dt,
cliente.dat_desligamento dat_desligamento,
cliente.ativo ativo,
cliente.ativo cliente,
CASE
when cliente.ativo = 'S' then
datediff(current_date(),
TO_DATE(CAST(UNIX_TIMESTAMP
(cliente.admissao_dt,'yyyy-MM-dd')
AS TIMESTAMP)))
when cliente.ativo = 'N' and cliente.dat_desligamento is not null then
datediff(TO_DATE(CAST(UNIX_TIMESTAMP
(cliente.dat_desligamento,'yyyy-MM-dd')
AS TIMESTAMP)),
TO_DATE(CAST(UNIX_TIMESTAMP
(cliente.admissao_dt,'yyyy-MM-dd')
AS TIMESTAMP)))
else null
end as t_trab_d
FROM db_siaf.base_cliente cliente where cliente = 'S')
--where t_trab_d is not null
--where cpf_cliente like '%06316839685%'
group by
cpf_cliente,
name_cliente
order by
cpf_cliente

select
cpf_cliente,
name_cliente,
max(t_trab_d) as t_trab_d,
max(t_trab_d*12/365.25) as t_trab_m,
max(t_trab_d/365.25) as t_trab_a
from
(select
cliente.cpf_cliente cpf_cliente,
cliente.name_cliente name_cliente,
cliente.admissao_dt admissao_dt,
cliente.dat_desligamento dat_desligamento,
cliente.ativo ativo,
cliente.ativo cliente,
CASE
when cliente.ativo = 'S' then
datediff(current_date(),
TO_DATE(CAST(UNIX_TIMESTAMP
(cliente.admissao_dt,'yyyy-MM-dd')
AS TIMESTAMP)))
when cliente.ativo = 'N' and cliente.dat_desligamento is not null then
datediff(TO_DATE(CAST(UNIX_TIMESTAMP
(cliente.dat_desligamento,'yyyy-MM-dd')
AS TIMESTAMP)),
TO_DATE(CAST(UNIX_TIMESTAMP
(cliente.admissao_dt,'yyyy-MM-dd')
AS TIMESTAMP)))
else null
end as t_trab_d
FROM db_siaf.base_cliente cliente where cliente = 'S')

group by
cpf_cliente,
name_cliente
order by
cpf_cliente
