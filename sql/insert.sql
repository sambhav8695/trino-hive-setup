CREATE SCHEMA iceberg.tpch_sf1 
WITH (location= 'gs://trino-hive-demo/iceberg/tpch/sf1');

use iceberg.tpch_sf1;

CREATE TABLE iceberg.tpch_sf1.customer
WITH (
    format = 'PARQUET',
    partitioning = ARRAY['nationkey', 'mktsegment'],
    sorted_by = ARRAY['custkey']
)
AS 
SELECT * FROM tpch.sf1.customer;

CREATE TABLE iceberg.tpch_sf1.lineitem
WITH (
    format = 'PARQUET',
    partitioning = ARRAY['year(shipdate)', 'shipmode'],
    sorted_by = ARRAY['orderkey']
)
AS 
SELECT * FROM tpch.sf1.lineitem;

CREATE TABLE iceberg.tpch_sf1.nation
WITH (
    format = 'PARQUET',
    sorted_by = ARRAY['nationkey']
)
AS 
SELECT * FROM tpch.sf1.nation;

CREATE TABLE iceberg.tpch_sf1.region
WITH (
    format = 'PARQUET',
    sorted_by = ARRAY['regionkey']
)
AS 
SELECT * FROM tpch.sf1.region;

CREATE TABLE iceberg.tpch_sf1.orders
WITH (
    format = 'PARQUET',
    partitioning = ARRAY['year(orderdate)', 'orderstatus'],
    sorted_by = ARRAY['orderkey']
)
AS 
SELECT * FROM tpch.sf1.orders;

CREATE TABLE iceberg.tpch_sf1.supplier
WITH (
    format = 'PARQUET',
    partitioning = ARRAY['nationkey'],
    sorted_by = ARRAY['suppkey']
)
AS 
SELECT * FROM tpch.sf1.supplier;

CREATE TABLE iceberg.tpch_sf1.part
WITH (
    format = 'PARQUET',
    partitioning = ARRAY['brand', 'mfgr'],
    sorted_by = ARRAY['partkey']
)
AS 
SELECT * FROM tpch.sf1.part;

CREATE TABLE iceberg.tpch_sf1.partsupp
WITH (
    format = 'PARQUET',
    partitioning = ARRAY['bucket(partkey, 10)'],
    sorted_by = ARRAY['suppkey']
)
AS 
SELECT * FROM tpch.sf1.partsupp;
