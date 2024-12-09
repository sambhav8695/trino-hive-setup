CREATE SCHEMA iceberg.tpch_sf1 
WITH (location= 'gs://trino-hive-demo/iceberg/tpch/sf1');

use iceberg.tpch_sf1;

CALL iceberg.system.register_table
(
  schema_name => 'tpch_sf1', 
  table_name => 'customer', 
  table_location => 'gs://trino-hive-demo/iceberg/tpch/sf1/customer'
);
CALL iceberg.system.register_table
(
  schema_name => 'tpch_sf1', 
  table_name => 'lineitem', 
  table_location => 'gs://trino-hive-demo/iceberg/tpch/sf1/lineitem'
);
CALL iceberg.system.register_table
(
  schema_name => 'tpch_sf1', 
  table_name => 'nation', 
  table_location => 'gs://trino-hive-demo/iceberg/tpch/sf1/nation'
);
CALL iceberg.system.register_table
(
  schema_name => 'tpch_sf1', 
  table_name => 'orders', 
  table_location => 'gs://trino-hive-demo/iceberg/tpch/sf1/orders'
);
CALL iceberg.system.register_table
(
  schema_name => 'tpch_sf1', 
  table_name => 'part', 
  table_location => 'gs://trino-hive-demo/iceberg/tpch/sf1/part'
);
CALL iceberg.system.register_table
(
  schema_name => 'tpch_sf1', 
  table_name => 'partsupp', 
  table_location => 'gs://trino-hive-demo/iceberg/tpch/sf1/partsupp'
);
CALL iceberg.system.register_table
(
  schema_name => 'tpch_sf1', 
  table_name => 'region', 
  table_location => 'gs://trino-hive-demo/iceberg/tpch/sf1/region'
);
CALL iceberg.system.register_table
(
  schema_name => 'tpch_sf1', 
  table_name => 'supplier', 
  table_location => 'gs://trino-hive-demo/iceberg/tpch/sf1/supplier'
);
