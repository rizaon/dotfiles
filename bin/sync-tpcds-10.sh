#!/usr/bin/env bash

display_usage() {
    echo "Copy raw TPCDS data to external bucket."
    echo "Usage: sync-tpcds-10.sh"
    echo "~/.dwx_rc.sh must be sourced first"
    exit 1
}

if [ -z $DWX_EXTERNAL_BUCKET ]; then
    display_usage
fi

if [ -z $DWX_CLUSTER_ENV ]; then
    display_usage
fi

if [ -z $DWX_CATALOG_NS ]; then
    display_usage
fi

aws-okta exec cu_dwx_dev -- aws s3 sync "s3://riza-dwx1/tmp/tpcds-generate/10" \
    "s3://$DWX_EXTERNAL_BUCKET/clusters/$DWX_CLUSTER_ENV/$DWX_CATALOG_NS/tmp/tpcds-generate/10"

