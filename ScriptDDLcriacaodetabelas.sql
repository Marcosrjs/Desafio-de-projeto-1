-- Criar banco de dados (opcional)
CREATE DATABASE ecommerce;
USE ecommerce;

-- Entidade central: Party (PF/PJ exclusivo)
CREATE TABLE party (
    party_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    party_type CHAR(2) NOT NULL, -- 'PF' ou 'PJ'
    name VARCHAR(200) NOT NULL,
    email VARCHAR(200) UNIQUE,
    phone VARCHAR(30),
    cpf CHAR(11),
    cnpj CHAR(14),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE (cpf),
    UNIQUE (cnpj)
);

-- Clientes
CREATE TABLE customer (
    customer_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    party_id BIGINT NOT NULL UNIQUE,
    loyalty_level VARCHAR(50),
    FOREIGN KEY (party_id) REFERENCES party(party_id)
);

-- Vendedores
CREATE TABLE seller (
    seller_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    party_id BIGINT NOT NULL UNIQUE,
    store_name VARCHAR(200),
    FOREIGN KEY (party_id) REFERENCES party(party_id)
);

-- Fornecedores
CREATE TABLE supplier (
    supplier_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    party_id BIGINT NOT NULL UNIQUE,
    contact_name VARCHAR(200),
    FOREIGN KEY (party_id) REFERENCES party(party_id)
);

-- Produtos
CREATE TABLE product (
    product_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    sku VARCHAR(50) NOT NULL UNIQUE,
    name VARCHAR(200) NOT NULL,
    description TEXT,
    unit_price DECIMAL(12,2) NOT NULL,
    active TINYINT(1) NOT NULL DEFAULT 1,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Estoque
CREATE TABLE inventory (
    inventory_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    product_id BIGINT NOT NULL UNIQUE,
    quantity INT NOT NULL,
    safety_stock INT NOT NULL DEFAULT 0,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (product_id) REFERENCES product(product_id)
);

-- Relação fornecedor-produto
CREATE TABLE supplier_product (
    supplier_id BIGINT NOT NULL,
    product_id BIGINT NOT NULL,
    supplier_sku VARCHAR(50),
    cost_price DECIMAL(12,2),
    PRIMARY KEY (supplier_id, product_id),
    FOREIGN KEY (supplier_id) REFERENCES supplier(supplier_id),
    FOREIGN KEY (product_id) REFERENCES product(product_id)
);

-- Formas de pagamento
CREATE TABLE customer_payment_method (
    payment_method_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    customer_id BIGINT NOT NULL,
    method_type VARCHAR(30) NOT NULL, -- 'CARTAO','PIX','BOLETO'
    brand VARCHAR(50),
    last4 CHAR(4),
    pix_key VARCHAR(100),
    active TINYINT(1) NOT NULL DEFAULT 1,
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);

-- Pedidos
CREATE TABLE orders (
    order_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    customer_id BIGINT NOT NULL,
    seller_id BIGINT,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(20) NOT NULL,
    total_amount DECIMAL(12,2) NOT NULL,
    payment_method_id BIGINT,
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (seller_id) REFERENCES seller(seller_id),
    FOREIGN KEY (payment_method_id) REFERENCES customer_payment_method(payment_method_id)
);

-- Itens do pedido
CREATE TABLE order_item (
    order_item_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    order_id BIGINT NOT NULL,
    product_id BIGINT NOT NULL,
    quantity INT NOT NULL,
    unit_price DECIMAL(12,2) NOT NULL,
    discount DECIMAL(12,2) NOT NULL DEFAULT 0,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES product(product_id)
);

-- Entrega
CREATE TABLE delivery (
    delivery_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    order_id BIGINT NOT NULL UNIQUE,
    carrier VARCHAR(100),
    tracking_code VARCHAR(100) UNIQUE,
    status VARCHAR(20) NOT NULL,
    shipped_at TIMESTAMP,
    delivered_at TIMESTAMP,
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);
