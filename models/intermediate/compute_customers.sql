{% set payment_methods = ['credit_card', 'coupon', 'bank_transfer', 'gift_card'] %}

with payments as (

    select * from {{ ref('stg_payments') }}

),

compute_table as (

SELECT ORDER_ID, sum(amount),count(PAYMENT_METHOD)  FROM payments 
GROUP BY ORDER_ID
)
select * from compute_table
