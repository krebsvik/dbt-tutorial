with payments as (
select
    order_id,
    sum(amount) as total_amount
from {{ ref('stg_stripe_payments') }}
group by order_id
)
select total_amount 
from payments
where total_amount < 0