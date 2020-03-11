#!/usr/bin/env bash

display_usage() {
    echo "Download impala profile to local dir."
    echo "Usage: sync-impala-profile.sh [date] [local_dir]"
    echo "~/.dwx_rc.sh must be sourced first"
    exit 1
}

if [ $# -lt 2 ]
then
    display_usage
else
    LOG_DATE=$1
    TARGET_DIR=$2
fi

if [ -z $DWX_EXTERNAL_BUCKET ]; then
    display_usage
fi

if [ -z $DWX_CLUSTER_ENV ]; then
    display_usage
fi

if [ -z $DWX_CATALOG_NS ]; then
    display_usage
fi

if [ -z $DWX_IMPALA_NS ]; then
    display_usage
fi

aws-okta exec cu_dwx_dev -- aws s3 cp \
    "s3://$DWX_EXTERNAL_BUCKET/clusters/$DWX_CLUSTER_ENV/$DWX_CATALOG_NS/warehouse/tablespace/external/hive/sys.db/logs/dt=$LOG_DATE/ns=$DWX_IMPALA_NS/app=impala-profiles/" \
        $TARGET_DIR --recursive
