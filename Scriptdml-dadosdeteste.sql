-- Parties PF e PJ
INSERT INTO party (party_type, name, email, phone, cpf) VALUES
('PF','Marcos Silva','marcos@example.com','+55 71 99999-1111','12345678901'),
('PF','Ana Souza','ana@example.com','+55 11 98888-2222','23456789012');

INSERT INTO party (party_type, name, email, phone, cnpj) VALUES
('PJ','Tech Vendas Ltda','contato@techvendas.com','+55 21 97777-3333','12345678000199'),
('PJ','Fornecedora Alpha SA','alpha@fornecedora.com','+55 31 96666-4444','99887766000155');

-- Papéis
INSERT INTO customer (party_id, loyalty_level) VALUES (1,'GOLD'),(2,'SILVER');
INSERT INTO seller (party_id, store_name) VALUES (3,'Tech Vendas Store');
INSERT INTO supplier (party_id, contact_name) VALUES (4,'Carlos Andrade');

-- Produtos
INSERT INTO product (sku,name,description,unit_price) VALUES
('SKU-001','Mouse Óptico','Mouse 1600 DPI',50.00),
('SKU-002','Teclado Mecânico','Switches azuis',250.00),
('SKU-003','Monitor 24"','IPS Full HD',900.00);

-- Estoque
INSERT INTO inventory (product_id, quantity, safety_stock) VALUES
(1,100,10),(2,50,5),(3,20,2);

-- Fornecedor oferece produtos
INSERT INTO supplier_product (supplier_id, product_id, supplier_sku, cost_price) VALUES
(1,1,'F-001',35.00),(1,2,'F-002',180.00),(1,3,'F-003',700.00);

-- Formas de pagamento
INSERT INTO customer_payment_method (customer_id, method_type, brand, last4, active) VALUES
(1,'CARTAO','Visa','1234',1),
(1,'PIX',NULL,NULL,1),
(2,'BOLETO',NULL,NULL,1);

-- Pedido
INSERT INTO orders (customer_id, seller_id, status, total_amount, payment_method_id)
VALUES (1,1,'PAGO',300.00,1);

-- Itens do pedido
INSERT INTO order_item (order_id, product_id, quantity, unit_price, discount) VALUES
(1,1,2,50.00,0.00),(1,2,1,250.00,50.00);

-- Entrega
INSERT INTO delivery (order_id, carrier, tracking_code, status, shipped_at)
VALUES (1,'Correios','BR123456789XYZ','EM_TRANSITO',NOW());
