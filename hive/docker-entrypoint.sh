#!/bin/bash

# https://github.com/apache/hive/blob/master/packaging/src/docker/entrypoint.sh

set -x

: ${DB_DRIVER:=derby}

[[ $VERBOSE = "true" ]] && VERBOSE_MODE="--verbose" || VERBOSE_MODE=""

function initialize_hive {
  COMMAND="-initOrUpgradeSchema"
  if [ "$(echo "$HIVE_VER" | cut -d '.' -f1)" -lt "4" ]; then
    COMMAND="-${SCHEMA_COMMAND:-initSchema}"
  fi
  if ! $HIVE_HOME/bin/schematool -info -dbType $DB_DRIVER -verbose 2>&1 | grep -q "Metastore schema version" ; then
    $HIVE_HOME/bin/schematool -dbType $DB_DRIVER $COMMAND $VERBOSE_MODE
    if [ $? -eq 0 ]; then
      echo "Initialized schema successfully.."
    else
      echo "Schema initialization failed!"
      exit 1
    fi
  fi
}

export HIVE_CONF_DIR=$HIVE_HOME/conf
if [ -d "${HIVE_CUSTOM_CONF_DIR:-}" ]; then
  find "${HIVE_CUSTOM_CONF_DIR}" -type f -exec \
    ln -sfn {} "${HIVE_CONF_DIR}"/ \;
  export HADOOP_CONF_DIR=$HIVE_CONF_DIR
  export TEZ_CONF_DIR=$HIVE_CONF_DIR
fi

export HADOOP_CLIENT_OPTS="$HADOOP_CLIENT_OPTS -Xmx1G $SERVICE_OPTS"

# handles schema initialization
initialize_hive

if [ "${SERVICE_NAME}" == "hiveserver2" ]; then
  export HADOOP_CLASSPATH=$TEZ_HOME/*:$TEZ_HOME/lib/*:$HADOOP_CLASSPATH
  exec $HIVE_HOME/bin/hive --skiphadoopversion --skiphbasecp --service $SERVICE_NAME
elif [ "${SERVICE_NAME}" == "metastore" ]; then
  export METASTORE_PORT=${METASTORE_PORT:-9083}
  exec $HIVE_HOME/bin/hive --skiphadoopversion --skiphbasecp $VERBOSE_MODE --service $SERVICE_NAME
fi