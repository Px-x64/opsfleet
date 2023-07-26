## Task 01: Automate EKS cluster setup on AWS

### Prerequisites

1. S3 bucket for Terraform state storage (opsfleet-test-bucket).
2. AWS IAM user with access to s3 bucket.
3. AWS credentials configured on the execution host.
4. AWS CLI binary installed on the same host.
5. Terraform binary installed on the same host.
6. Kubectl binary installed on the same host.

### Deployment

1. Navigate to https://docs.aws.amazon.com/eks/latest/userguide/platform-versions.html to find the latest available EKS platform version or run the following command to obtain the same
```aws eks describe-addon-versions | jq -r ".addons[] | .addonVersions[] | .compatibilities[] | .clusterVersion" | sort | uniq```
2. Navigate to 01_terraform/deployments/01_eks folder, and in vars.tf file update cluster_version variable with the version above
3. Also, in the same file, put your values in vpc_id and subnets variables.
4. Run
```
terraform init
```
Command and see if there are any errors. If they are present, this means that some prerequisite steps were not fully completed.
5. If the command above didn't produce any errors, run
```
terraform apply
```
Command to deploy the cluster.
6. Obtain kubectl credentials for cluster with
```
aws eks --region $(terraform output -raw region) update-kubeconfig --name $(terraform output -raw cluster_name)
```
/* untested, I'm lazy )) */

8. Once cluster is deployed, navigate to 01_terraform/deployments/02_iam folder, and perform additional role deployment with the same
```
terraform init
terraform apply
```
Commands.

### Usage

A developer can use the created Service Account in "default" namespace using "serviceAccountName" annotation in pod spec.
A test container could be deployed with the following command
```
kubectl apply -f- <<EOF
apiVersion: v1
kind: Pod
metadata:
  name: amazonlinux
  namespace: default
spec:
  serviceAccountName: k8s-sa
  containers:
    - name: amazonlinux
      image: amazonlinux
      command: [ "sh", "-c", "sleep 8h" ]
EOF
```
Namespace and Service Account name can be found and configured in 01_terraform/modules/iam/k8s-service-account.tf file

## Task 02: Managing secrets on Kubernetes

A couple of options could be used according to https://waswani.medium.com/integrating-secrets-manager-with-aws-eks-79c93e70c74e article.
But taking into account provided limitations: "they have a small team and their capacity for self-hosted solutions is limited" the best option would be using AWS Secrets Manager and "Kubernetes Secrets Store CSI Driver".
A good article from AWS could be found on this link: https://archive.eksworkshop.com/beginner/194_secrets_manager/.

Another viable solution would be using managed Vault deployment, using one of the following guides
https://aws.amazon.com/solutions/partners/eks-vault/
https://developer.hashicorp.com/vault/tutorials/cloud-ops/vault-eks
