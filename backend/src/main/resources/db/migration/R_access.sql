CREATE ROLE tables_readonly;
GRANT CONNECT ON DATABASE sausage TO tables_readonly;
GRANT USAGE ON SCHEMA dw TO tables_readonly;
GRANT SELECT ON TABLE "sausage"."product" TO tables_readonly;
GRANT SELECT ON TABLE "sausage"."orders" TO tables_readonly;
GRANT SELECT ON TABLE "sausage"."order_product" TO tables_readonly;
GRANT SELECT ON ALL TABLES IN SCHEMA public TO "read_user";
GRANT SELECT, UPDATE, INSERT ON ALL TABLES IN SCHEMA public TO "write_user";
GRANT ALL PRIVILEGES ON DATABASE "sausage" to "admin_user";
