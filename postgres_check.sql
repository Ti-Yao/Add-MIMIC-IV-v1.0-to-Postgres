with expected as
(
select 'labevents' as tbl, 122103667 as row_count UNION ALL 
select 'services' as tbl, 562892 as row_count UNION ALL 
select 'd_icd_procedures' as tbl, 85257 as row_count UNION ALL 
select 'poe' as tbl, 42483962 as row_count UNION ALL 
select 'poe_detail' as tbl, 3256358 as row_count UNION ALL 
select 'drgcodes' as tbl, 769622 as row_count UNION ALL 
select 'emar' as tbl, 27464367 as row_count UNION ALL 
select 'd_labitems' as tbl, 1630 as row_count UNION ALL 
select 'd_hcpcs' as tbl, 89200 as row_count UNION ALL 
select 'diagnoses_icd' as tbl, 5280351 as row_count UNION ALL 
select 'microbiologyevents' as tbl, 3397914 as row_count UNION ALL 
select 'pharmacy' as tbl, 14736386 as row_count UNION ALL 
select 'procedures_icd' as tbl, 779625 as row_count UNION ALL 
select 'd_icd_diagnoses' as tbl, 109775 as row_count UNION ALL 
select 'hcpcsevents' as tbl, 160727 as row_count UNION ALL 
select 'prescriptions' as tbl, 17008053 as row_count UNION ALL 
select 'emar_detail' as tbl, 55947921 as row_count UNION ALL 
select 'd_items' as tbl, 3861 as row_count UNION ALL 
select 'procedureevents' as tbl, 731247 as row_count UNION ALL 
select 'datetimeevents' as tbl, 7495712 as row_count UNION ALL 
select 'outputevents' as tbl, 4457381 as row_count UNION ALL 
select 'icustays' as tbl, 76540 as row_count UNION ALL 
select 'inputevents' as tbl, 9460658 as row_count UNION ALL 
select 'chartevents' as tbl, 329499788 as row_count UNION ALL 
select 'patients' as tbl, 382278 as row_count UNION ALL 
select 'transfers' as tbl, 2189535 as row_count UNION ALL 
select 'admissions' as tbl, 523740 as row_count 

)
, observed as
(
select 'labevents' as tbl, count(*) as row_count from labevents UNION ALL 
select 'services' as tbl, count(*) as row_count from services UNION ALL 
select 'd_icd_procedures' as tbl, count(*) as row_count from d_icd_procedures UNION ALL 
select 'poe' as tbl, count(*) as row_count from poe UNION ALL 
select 'poe_detail' as tbl, count(*) as row_count from poe_detail UNION ALL 
select 'drgcodes' as tbl, count(*) as row_count from drgcodes UNION ALL 
select 'emar' as tbl, count(*) as row_count from emar UNION ALL 
select 'd_labitems' as tbl, count(*) as row_count from d_labitems UNION ALL 
select 'd_hcpcs' as tbl, count(*) as row_count from d_hcpcs UNION ALL 
select 'diagnoses_icd' as tbl, count(*) as row_count from diagnoses_icd UNION ALL 
select 'microbiologyevents' as tbl, count(*) as row_count from microbiologyevents UNION ALL 
select 'pharmacy' as tbl, count(*) as row_count from pharmacy UNION ALL 
select 'procedures_icd' as tbl, count(*) as row_count from procedures_icd UNION ALL 
select 'd_icd_diagnoses' as tbl, count(*) as row_count from d_icd_diagnoses UNION ALL 
select 'hcpcsevents' as tbl, count(*) as row_count from hcpcsevents UNION ALL 
select 'prescriptions' as tbl, count(*) as row_count from prescriptions UNION ALL 
select 'emar_detail' as tbl, count(*) as row_count from emar_detail UNION ALL 
select 'd_items' as tbl, count(*) as row_count from d_items UNION ALL 
select 'procedureevents' as tbl, count(*) as row_count from procedureevents UNION ALL 
select 'datetimeevents' as tbl, count(*) as row_count from datetimeevents UNION ALL 
select 'outputevents' as tbl, count(*) as row_count from outputevents UNION ALL 
select 'icustays' as tbl, count(*) as row_count from icustays UNION ALL 
select 'inputevents' as tbl, count(*) as row_count from inputevents UNION ALL 
select 'chartevents' as tbl, count(*) as row_count from chartevents UNION ALL 
select 'patients' as tbl, count(*) as row_count from patients UNION ALL 
select 'transfers' as tbl, count(*) as row_count from transfers UNION ALL 
select 'admissions' as tbl, count(*) as row_count from admissions 

)
select
exp.tbl
, exp.row_count as expected_count
, obs.row_count as observed_count
, case
	when exp.row_count = obs.row_count
	then 'PASSED'
	else 'FAILED'
	end as ROW_COUNT_CHECK
from expected exp
inner join observed obs
	on exp.tbl=obs.tbl
	order by exp.tbl;
