# Terraform solution for deploying EFK stack for Rancher 2.6

## Getting Started & Documentation

Documentation is available on the [Rancher website](https://rancher.com/docs/rancher/v2.5/en/logging/).

## 1. Enable logging

[Enabling logging](https://rancher.com/docs/rancher/v2.5/en/logging/#:~:text=Troubleshooting-,Enabling%20Logging,-You%20can%20enable) is implemented though rancher_app_logging.tf by installing rancher logging application solution.

Logging application for Rancher basically installs [Banzai Cloud Logging Operator](https://rancher.com/docs/rancher/v2.5/en/logging/architecture/#how-the-banzai-cloud-logging-operator-works). It deploys and configures a Fluent Bit DaemonSet on every node to collect container and application logs from the node file system.

Fluent Bit queries the Kubernetes API and enriches the logs with metadata about the pods, and transfers both the logs and the metadata to Fluentd. Fluentd receives, filters, and transfers logs to multiple Outputs.

The following custom resources are used to define how logs are filtered and sent to their Outputs:

- **A Flow** is a namespaced custom resource that uses filters and selectors to route log messages to the appropriate Outputs.
- **A ClusterFlow** is used to route cluster-level log messages.
An Output is a namespaced resource that defines where the log messages are sent.
- **A ClusterOutput** defines an Output that is available from all Flows and ClusterFlows.
Each **Flow** must reference an **Output**, and each **ClusterFlow** must reference a **ClusterOutput**.

The following figure from the Banzai documentation shows the new logging architecture:

![alt](https://rancher.com/docs/img/rancher/banzai-cloud-logging-operator.png)

## 2. Deploy Elasticsearch and Kibana

In the main.tf we deploy to the cluster [ECK operator](https://www.elastic.co/guide/en/cloud-on-k8s/current/k8s-install-helm.html) using helm, Kibana and Elasticsearch resources.