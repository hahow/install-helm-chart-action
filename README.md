# Install Helm Chart action

Installing helm chart to Google Kubernetes Engine (GKE).


## Inputs

### `gcloud_auth_key`

**Required** The JSON key that is used to access GKE.

### `gcloud_project_id`

**Required** Your Google Cloud Platform project ID.

### `cluster_name`

**Required** The name of GKE cluster.

### `cluster_region`

**Required** The region of GKE cluster.

### `release_namespace`

**Required** The Kubernetes namespace to install release into.

### `release_name`

**Required** The Helm release name for this chart.

### `chart_name`

**Required** Chart reference, or path to a chart.

### `helm_upgrade_args`

**Required** Additional arguments passed to helm upgrade.


## Example usage

    uses: hahow/install-helm-chart-action@v1.0.0
    with:
      gcloud_auth_key: ${{ secrets.GCLOUD_AUTH_KEY }}
      gcloud_project_id: ${{ secrets.GCLOUD_PROJECT_ID }}
      cluster_name: ${{ secrets.CLUSTER_NAME }}
      cluster_region: asia-east1-a
      release_namespace: core
      release_name: payment-system
      chart_name: ./charts/payment-system
      helm_upgrade_args: |
        --set image.tag=${{ github.sha }}
