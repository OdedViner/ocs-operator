#!/usr/bin/env bash

# shellcheck disable=SC2034
# disable unused variable warnings

GO111MODULE="on"
GOPROXY="https://proxy.golang.org"
GOROOT="${GOROOT:-go env GOROOT}"
GOOS="${GOOS:-linux}"
GOARCH="${GOARCH:-amd64}"

GO_LINT_IMG_LOCATION="${GO_LINT_IMG_LOCATION:-golangci/golangci-lint}"
GO_LINT_IMG_TAG="${GO_LINT_IMG_TAG:-v1.49.0}"
GO_LINT_IMG="${GO_LINT_IMG:-${GO_LINT_IMG_LOCATION}:${GO_LINT_IMG_TAG}}"

# Current DEV version of the CSV
DEFAULT_CSV_VERSION="4.13.0"
CSV_VERSION="${CSV_VERSION:-${DEFAULT_CSV_VERSION}}"
VERSION="${VERSION:-${CSV_VERSION}}"

OUTDIR="build/_output"
OUTDIR_BIN="build/_output/bin"
OUTDIR_OCS_CI="build/_output/ocs-ci-testsuite"
OUTDIR_TEMPLATES="deploy/csv-templates"
OUTDIR_CRDS="$OUTDIR_TEMPLATES/crds"
OUTDIR_TOOLS="$OUTDIR/tools"
OUTDIR_CLUSTER_DEPLOY_MANIFESTS="$OUTDIR/cluster-deploy-manifests"

DEPLOY_YAML_PATH="deploy/deploy-with-olm.yaml"
PROMETHEUS_RULES_PATH="metrics/deploy"

REDHAT_OCS_CI_DEFAULT_TEST_EXPRESSION="TestOSCBasics or TestPvCreation or TestRawBlockPV or TestReclaimPolicy or TestCreateSCSameName or TestBasicPVCOperations or TestVerifyAllFieldsInScYamlWithOcDescribe"
REDHAT_OCS_CI_REPO="${REDHAT_OCS_CI_REPO:-https://github.com/red-hat-storage/ocs-ci}"
REDHAT_OCS_CI_HASH="${REDHAT_OCS_CI_HASH:-}"
REDHAT_OCS_CI_TEST_EXPRESSION="${REDHAT_OCS_CI_TEST_EXPRESSION:-$REDHAT_OCS_CI_DEFAULT_TEST_EXPRESSION}"
REDHAT_OCS_CI_PYTHON_BINARY="${REDHAT_OCS_CI_PYTHON_BINARY:-python3.7}"
REDHAT_OCS_CI_FORCE_TOOL_POD_INSTALL="${REDHAT_OCS_CI_FORCE_TOOL_POD_INSTALL:-false}"

GINKGO_TEST_SUITE="${GINKGO_TEST_SUITE:-ocs}"

# This env var allows developers to point to a custom oc tool that isn't in $PATH
# defaults to just using the 'oc' binary provided in $PATH
OCS_OC_PATH="${OCS_OC_PATH:-oc}"
OCS_FINAL_DIR="deploy/ocs-operator/manifests"
ICS_FINAL_DIR="deploy/ics-operator/manifests"
BUNDLEMANIFESTS_DIR="rbac"

NOOBAA_CSV="$OUTDIR_TEMPLATES/noobaa-csv.yaml"
ROOK_CSV="$OUTDIR_TEMPLATES/rook-csv.yaml.in"
OCS_CSV="$OUTDIR_TEMPLATES/ocs-operator.csv.yaml.in"
FCS_CSV="$OUTDIR_TEMPLATES/ics-operator.csv.yaml.in"

LATEST_ROOK_IMAGE="docker.io/rook/ceph:v1.11.0"
LATEST_NOOBAA_IMAGE="quay.io/noobaa/noobaa-operator:master-20230306"
LATEST_NOOBAA_CORE_IMAGE="quay.io/noobaa/noobaa-core:master-20230306"
LATEST_NOOBAA_DB_IMAGE="centos/postgresql-12-centos7"
LATEST_CEPH_IMAGE="quay.io/ceph/ceph:v17"
LATEST_ROOK_CSIADDONS_IMAGE="quay.io/csiaddons/k8s-sidecar:v0.5.0"
# TODO: change image once the quay repo is changed
LATEST_MUST_GATHER_IMAGE="quay.io/ocs-dev/ocs-must-gather:latest"

DEFAULT_IMAGE_REGISTRY="quay.io"
DEFAULT_REGISTRY_NAMESPACE="ocs-dev"
DEFAULT_IMAGE_TAG="latest"
DEFAULT_OPERATOR_IMAGE_NAME="ocs-operator"
DEFAULT_OPERATOR_BUNDLE_NAME="ocs-operator-bundle"
DEFAULT_OPERATOR_INDEX_NAME="ocs-operator-index"
DEFAULT_FILE_BASED_CATALOG_NAME="ocs-operator-catalog"
DEFAULT_CATALOG_IMAGE_NAME="ocs-registry"
DEFAULT_METRICS_EXPORTER_IMAGE_NAME="ocs-metrics-exporter"

IMAGE_REGISTRY="${IMAGE_REGISTRY:-${DEFAULT_IMAGE_REGISTRY}}"
REGISTRY_NAMESPACE="${REGISTRY_NAMESPACE:-${DEFAULT_REGISTRY_NAMESPACE}}"
OPERATOR_IMAGE_NAME="${OPERATOR_IMAGE_NAME:-${DEFAULT_OPERATOR_IMAGE_NAME}}"
OPERATOR_BUNDLE_NAME="${OPERATOR_BUNDLE_NAME:-${DEFAULT_OPERATOR_BUNDLE_NAME}}"
OPERATOR_INDEX_NAME="${OPERATOR_INDEX_NAME:-${DEFAULT_OPERATOR_INDEX_NAME}}"
FILE_BASED_CATALOG_NAME="${FILE_BASED_CATALOG_NAME:-${DEFAULT_FILE_BASED_CATALOG_NAME}}"
CATALOG_IMAGE_NAME="${CATALOG_IMAGE_NAME:-${DEFAULT_CATALOG_IMAGE_NAME}}"
METRICS_EXPORTER_IMAGE_NAME="${METRICS_EXPORTER_IMAGE_NAME:-${DEFAULT_METRICS_EXPORTER_IMAGE_NAME}}"
IMAGE_TAG="${IMAGE_TAG:-${DEFAULT_IMAGE_TAG}}"

DEFAULT_OPERATOR_FULL_IMAGE_NAME="${IMAGE_REGISTRY}/${REGISTRY_NAMESPACE}/${OPERATOR_IMAGE_NAME}:${IMAGE_TAG}"
DEFAULT_BUNDLE_FULL_IMAGE_NAME="${IMAGE_REGISTRY}/${REGISTRY_NAMESPACE}/${OPERATOR_BUNDLE_NAME}:${IMAGE_TAG}"
DEFAULT_INDEX_FULL_IMAGE_NAME="${IMAGE_REGISTRY}/${REGISTRY_NAMESPACE}/${OPERATOR_INDEX_NAME}:${IMAGE_TAG}"
DEFAULT_FILE_BASED_CATALOG_FULL_IMAGE_NAME="${IMAGE_REGISTRY}/${REGISTRY_NAMESPACE}/${FILE_BASED_CATALOG_NAME}:${IMAGE_TAG}"
DEFAULT_CATALOG_FULL_IMAGE_NAME="${IMAGE_REGISTRY}/${REGISTRY_NAMESPACE}/${CATALOG_IMAGE_NAME}:${IMAGE_TAG}"
DEFAULT_METRICS_EXPORTER_FULL_IMAGE_NAME="${IMAGE_REGISTRY}/${REGISTRY_NAMESPACE}/${METRICS_EXPORTER_IMAGE_NAME}:${IMAGE_TAG}"

OPERATOR_FULL_IMAGE_NAME="${OPERATOR_FULL_IMAGE_NAME:-${DEFAULT_OPERATOR_FULL_IMAGE_NAME}}"
BUNDLE_FULL_IMAGE_NAME="${BUNDLE_FULL_IMAGE_NAME:-${DEFAULT_BUNDLE_FULL_IMAGE_NAME}}"
INDEX_FULL_IMAGE_NAME="${INDEX_FULL_IMAGE_NAME:-${DEFAULT_INDEX_FULL_IMAGE_NAME}}"
FILE_BASED_CATALOG_FULL_IMAGE_NAME="${FILE_BASED_CATALOG_FULL_IMAGE_NAME:-${DEFAULT_FILE_BASED_CATALOG_FULL_IMAGE_NAME}}"
CATALOG_FULL_IMAGE_NAME="${CATALOG_FULL_IMAGE_NAME:-${DEFAULT_CATALOG_FULL_IMAGE_NAME}}"
METRICS_EXPORTER_FULL_IMAGE_NAME="${METRICS_EXPORTER_FULL_IMAGE_NAME:-${DEFAULT_METRICS_EXPORTER_FULL_IMAGE_NAME}}"

DEFAULT_NOOBAA_BUNDLE_REGISTRY="quay.io/noobaa"
DEFAULT_NOOBAA_BUNDLE_NAME="noobaa-operator-bundle"
DEFAULT_NOOBAA_BUNDLE_TAG="v5.12.0"

NOOBAA_BUNDLE_REGISTRY="${NOOBAA_BUNDLE_REGISTRY:-${DEFAULT_NOOBAA_BUNDLE_REGISTRY}}"
NOOBAA_BUNDLE_NAME="${NOOBAA_BUNDLE_NAME:-${DEFAULT_NOOBAA_BUNDLE_NAME}}"
NOOBAA_BUNDLE_TAG="${NOOBAA_BUNDLE_TAG:-${DEFAULT_NOOBAA_BUNDLE_TAG}}"
NOOBAA_BUNDLE_FULL_IMAGE_NAME="${NOOBAA_BUNDLE_REGISTRY}/${NOOBAA_BUNDLE_NAME}:${NOOBAA_BUNDLE_TAG}"

OCS_OPERATOR_INSTALL="${OCS_OPERATOR_INSTALL:-false}"
OCS_CLUSTER_UNINSTALL="${OCS_CLUSTER_UNINSTALL:-false}"
OCS_SUBSCRIPTION_CHANNEL=${OCS_SUBSCRIPTION_CHANNEL:-alpha}
INSTALL_NAMESPACE="${INSTALL_NAMESPACE:-openshift-storage}"
OCS_ALLOW_UNSUPPORTED_CEPH_VERSION="${OCS_ALLOW_UNSUPPORTED_CEPH_VERSION:-allowed}"

UPGRADE_FROM_OCS_REGISTRY_IMAGE="${UPGRADE_FROM_OCS_REGISTRY_IMAGE:-quay.io/ocs-dev/ocs-registry:4.2.0}"
UPGRADE_FROM_OCS_SUBSCRIPTION_CHANNEL="${UPGRADE_FROM_OCS_SUBSCRIPTION_CHANNEL:-$OCS_SUBSCRIPTION_CHANNEL}"

OCS_MUST_GATHER_DIR="${OCS_MUST_GATHER_DIR:-ocs-must-gather}"
OCP_MUST_GATHER_DIR="${OCP_MUST_GATHER_DIR:-ocp-must-gather}"

OS_TYPE=$(uname)

# Protobuf
PROTOC_VERSION="3.14.0"
PROTOC_GEN_GO_VERSION="1.26.0"
PROTOC_GEN_GO_GRPC_VERSION="1.1.0"
OUTDIR_GRPC="build/_output/grpc"
OUTDIR_PROTO_DIST="build/_output/grpc/dist"
OUTDIR_PROTO_GOOGLE="build/_output/grpc/google/protobuf"

# gRPC services
declare -a SERVICES=("provider")
