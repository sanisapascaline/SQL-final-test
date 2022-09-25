select node node,
	case
	when parent is null then 'Akar'
	when node not in (select parent
	from nodes
	where parent is not null) then 'Daun'
	else 'Batang'
end position
from nodes
order by node;