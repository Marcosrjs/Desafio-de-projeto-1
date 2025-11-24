-- Pedidos por cliente
SELECT c.customer_id, p.name AS customer_name, COUNT(o.order_id) AS total_orders
FROM customer c
JOIN party p ON p.party_id = c.party_id
LEFT JOIN orders o ON o.customer_id = c.customer_id
GROUP BY c.customer_id, p.name
ORDER BY total_orders DESC;

-- Vendedor também é fornecedor
SELECT p.party_id, p.name
FROM party p
JOIN seller s ON s.party_id = p.party_id
JOIN supplier sup ON sup.party_id = p.party_id;

-- Produtos, fornecedores e estoques
SELECT p.product_id, p.name AS product_name, pa_sup.name AS supplier_name,
       sp.cost_price, inv.quantity AS stock_qty, inv.safety_stock
FROM product p
JOIN supplier_product sp ON sp.product_id = p.product_id
JOIN supplier sup ON sup.supplier_id = sp.supplier_id
JOIN party pa_sup ON pa_sup.party_id = sup.party_id
JOIN inventory inv ON inv.product_id = p.product_id
ORDER BY supplier_name, product_name;

-- Clientes com mais de 1 forma de pagamento
SELECT c.customer_id, p.name, COUNT(pm.payment_method_id) AS methods_count
FROM customer c
JOIN party p ON p.party_id = c.party_id
JOIN customer_payment_method pm ON pm.customer_id = c.customer_id
GROUP BY c.customer_id, p.name
HAVING COUNT(pm.payment_method_id) > 1
ORDER BY methods_count DESC;
