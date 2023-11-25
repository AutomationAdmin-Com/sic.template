#!/bin/bash

set -eu

STR="$CURRENT_DIRECTORY"
STG_ONE='stage1'
STG_TWO='stage2'
if [[ "$STR" == *"$STG_ONE"* ]]; then
   echo "Setting Github Output stage to: stage1"
   echo "stage=$STG_ONE" >>$GITHUB_OUTPUT
elif [[ "$STR" == *"$STG_TWO"* ]]; then
   echo "Setting Github Output stage to: stage2"
   echo "stage=$STG_TWO" >>$GITHUB_OUTPUT
else
   echo "no stage found! ERROR"
   exit 1
fi

HUB_NONPRD='nonprd'
HUB_PRD='prd'
HUB='hub'
SPK='spoke'

# First, find out if nonprod or prod - Set the Storage Account access key based on environment AND set the Hub Provider to the correct Hub environment
if [[ "$STR" == *"$HUB_NONPRD"* ]]; then
   echo "Setting Github Output hub_subscription_secret_name to: Hub nonprod"
   HUB_SECRET='nonprd-hub-id'
   echo "hub_subscription_secret_name=$HUB_SECRET" >>$GITHUB_OUTPUT

   echo "Setting Github Output storage_account_key_name to: nonprd-storage-account-access-key"
   SA_ACCESS_KEY_NAME='nonprd-storage-account-access-key'
   echo "storage_account_key_name=$SA_ACCESS_KEY_NAME" >>$GITHUB_OUTPUT

elif [[ "$STR" == *"$HUB_PRD"* ]]; then
   echo "Setting Github Output hub_subscription_secret_name to: Hub prod"
   HUB_SECRET='prd-hub-id'
   echo "hub_subscription_secret_name=$HUB_SECRET" >>$GITHUB_OUTPUT

   echo "Setting Github Output storage_account_key_name to: prd-storage-account-access-key"
   SA_ACCESS_KEY_NAME='prd-storage-account-access-key'
   echo "storage_account_key_name=$SA_ACCESS_KEY_NAME" >>$GITHUB_OUTPUT
else
   echo "ERROR! Unable to parse directory for hub subscription secret" >&2
   exit 1
fi

# Next, find the subscription:
case $STR in

*"$HUB"*)
   echo "Parsed subscription name: hub"
   SUBSCRIPTION='hub'
   ;;

*"$SPK"*)
   echo "Parsed subscription name: spoke"
   SUBSCRIPTION='spoke'
   ;;

*)
   echo "ERROR! Unable to parse subscription!" >&2
   ;;
esac

# Last, finally just combine them
if [[ "$SUBSCRIPTION" == 'hub' && "$HUB_SECRET" == 'nonprd-hub-id' ]]; then
   echo "Setting spoke secret to: hub nonprod"
   SPOKE_SECRET='nonprd-hub-id'
   echo "spoke_subscription_secret_name=$SPOKE_SECRET" >>$GITHUB_OUTPUT
elif [[ "$SUBSCRIPTION" == 'hub' && "$HUB_SECRET" == 'prd-hub-id' ]]; then
   echo "Setting spoke secret to: hub prod"
   SPOKE_SECRET='prd-hub-id'
   echo "spoke_subscription_secret_name=$SPOKE_SECRET" >>$GITHUB_OUTPUT
elif [[ "$SUBSCRIPTION" == 'spoke' && "$HUB_SECRET" == 'nonprd-hub-id' ]]; then
   echo "Setting spoke secret to: spoke nonprod"
   SPOKE_SECRET='nonprd-spoke-id'
   echo "spoke_subscription_secret_name=$SPOKE_SECRET" >>$GITHUB_OUTPUT
elif [[ "$SUBSCRIPTION" == 'spoke' && "$HUB_SECRET" == 'prd-hub-id' ]]; then
   echo "Setting spoke secret to: spoke prod"
   SPOKE_SECRET='prd-spoke-id'
   echo "spoke_subscription_secret_name=$SPOKE_SECRET" >>$GITHUB_OUTPUT
else
   echo "ERROR! Unable to parse subscription and environment" >&2
   exit 1
fi
