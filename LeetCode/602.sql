select id, sum(num) as num
from 
(
(select requester_id as id ,count(*) as num
from requestaccepted
group by requester_id) 
union all
(select accepter_id as id,count(*) as num
from requestaccepted
group by accepter_id)
) count
group by id
order by num desc
limit 1