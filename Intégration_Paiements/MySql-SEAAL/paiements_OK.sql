SELECT
	* 
FROM
	epayment_transactions 
WHERE
	epayment_transaction_id IS NOT NULL 
	AND transaction_paid = 1