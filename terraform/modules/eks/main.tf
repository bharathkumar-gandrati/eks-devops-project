# EKS-Cluster Creation
resource "aws_eks_cluster" "earth" {
  name     = "earth"
  role_arn = aws_iam_role.earth-cluster.arn
  vpc_config {
    subnet_ids = [var.earth_subnet1_id, var.earth_subnet2_id]
    endpoint_public_access  = var.cluster_endpoint_public_access
    public_access_cidrs     = var.cluster_endpoint_public_access_cidrs    
  }
  depends_on = [
    aws_iam_role_policy_attachment.earth-AmazonEKSClusterPolicy,
    aws_iam_role_policy_attachment.earth-AmazonEKSVPCResourceController,
  ]
  tags = {
    Name = "Earth-Cluster"
  }
}


# Creation of Node Group
resource "aws_eks_node_group" "earth" {
  cluster_name    = aws_eks_cluster.earth.name
  node_group_name = "earth-nodegroup"
  node_role_arn   = aws_iam_role.earth-node.arn
  subnet_ids      = [var.earth_subnet1_id, var.earth_subnet2_id]
  capacity_type = "ON_DEMAND"
  disk_size = 20
  instance_types = ["t2.small"]
  remote_access {
    ec2_ssh_key = "valaxy-key"
    source_security_group_ids = [aws_security_group.worker_node_sg.id]
  }
  scaling_config {
    desired_size = 1
    max_size     = 2
    min_size     = 1
  }
  update_config {
    max_unavailable = 1
  }
  depends_on = [
    aws_iam_role_policy_attachment.earth-AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.earth-AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.earth-AmazonEC2ContainerRegistryReadOnly,
  ]
  tags = {
    Name = "Earth-Public-Node-Group"
  }
}
