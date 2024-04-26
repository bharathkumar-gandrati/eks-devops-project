output "endpoint" {
  value = aws_eks_cluster.earth.endpoint
}

output "kubeconfig-certificate-authority-data" {
  value = aws_eks_cluster.earth.certificate_authority[0].data
}


output "security_group_public" {
   value = "${aws_security_group.worker_node_sg.id}"
}