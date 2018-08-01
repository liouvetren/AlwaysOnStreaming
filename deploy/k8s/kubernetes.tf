output "cluster_name" {
  value = "k8s.liouvetren.com"
}

output "master_security_group_ids" {
  value = ["${aws_security_group.masters-k8s-liouvetren-com.id}"]
}

output "masters_role_arn" {
  value = "${aws_iam_role.masters-k8s-liouvetren-com.arn}"
}

output "masters_role_name" {
  value = "${aws_iam_role.masters-k8s-liouvetren-com.name}"
}

output "node_security_group_ids" {
  value = ["${aws_security_group.nodes-k8s-liouvetren-com.id}"]
}

output "node_subnet_ids" {
  value = ["${aws_subnet.us-west-2a-k8s-liouvetren-com.id}", "${aws_subnet.us-west-2b-k8s-liouvetren-com.id}", "${aws_subnet.us-west-2c-k8s-liouvetren-com.id}"]
}

output "nodes_role_arn" {
  value = "${aws_iam_role.nodes-k8s-liouvetren-com.arn}"
}

output "nodes_role_name" {
  value = "${aws_iam_role.nodes-k8s-liouvetren-com.name}"
}

output "region" {
  value = "us-west-2"
}

output "vpc_id" {
  value = "${aws_vpc.k8s-liouvetren-com.id}"
}

provider "aws" {
  region = "us-west-2"
}

resource "aws_autoscaling_attachment" "master-us-west-2a-masters-k8s-liouvetren-com" {
  elb                    = "${aws_elb.api-k8s-liouvetren-com.id}"
  autoscaling_group_name = "${aws_autoscaling_group.master-us-west-2a-masters-k8s-liouvetren-com.id}"
}

resource "aws_autoscaling_attachment" "master-us-west-2b-masters-k8s-liouvetren-com" {
  elb                    = "${aws_elb.api-k8s-liouvetren-com.id}"
  autoscaling_group_name = "${aws_autoscaling_group.master-us-west-2b-masters-k8s-liouvetren-com.id}"
}

resource "aws_autoscaling_attachment" "master-us-west-2c-masters-k8s-liouvetren-com" {
  elb                    = "${aws_elb.api-k8s-liouvetren-com.id}"
  autoscaling_group_name = "${aws_autoscaling_group.master-us-west-2c-masters-k8s-liouvetren-com.id}"
}

resource "aws_autoscaling_group" "master-us-west-2a-masters-k8s-liouvetren-com" {
  name                 = "master-us-west-2a.masters.k8s.liouvetren.com"
  launch_configuration = "${aws_launch_configuration.master-us-west-2a-masters-k8s-liouvetren-com.id}"
  max_size             = 1
  min_size             = 1
  vpc_zone_identifier  = ["${aws_subnet.us-west-2a-k8s-liouvetren-com.id}"]

  tag = {
    key                 = "KubernetesCluster"
    value               = "k8s.liouvetren.com"
    propagate_at_launch = true
  }

  tag = {
    key                 = "Name"
    value               = "master-us-west-2a.masters.k8s.liouvetren.com"
    propagate_at_launch = true
  }

  tag = {
    key                 = "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/instancegroup"
    value               = "master-us-west-2a"
    propagate_at_launch = true
  }

  tag = {
    key                 = "k8s.io/role/master"
    value               = "1"
    propagate_at_launch = true
  }

  metrics_granularity = "1Minute"
  enabled_metrics     = ["GroupDesiredCapacity", "GroupInServiceInstances", "GroupMaxSize", "GroupMinSize", "GroupPendingInstances", "GroupStandbyInstances", "GroupTerminatingInstances", "GroupTotalInstances"]
}

resource "aws_autoscaling_group" "master-us-west-2b-masters-k8s-liouvetren-com" {
  name                 = "master-us-west-2b.masters.k8s.liouvetren.com"
  launch_configuration = "${aws_launch_configuration.master-us-west-2b-masters-k8s-liouvetren-com.id}"
  max_size             = 1
  min_size             = 1
  vpc_zone_identifier  = ["${aws_subnet.us-west-2b-k8s-liouvetren-com.id}"]

  tag = {
    key                 = "KubernetesCluster"
    value               = "k8s.liouvetren.com"
    propagate_at_launch = true
  }

  tag = {
    key                 = "Name"
    value               = "master-us-west-2b.masters.k8s.liouvetren.com"
    propagate_at_launch = true
  }

  tag = {
    key                 = "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/instancegroup"
    value               = "master-us-west-2b"
    propagate_at_launch = true
  }

  tag = {
    key                 = "k8s.io/role/master"
    value               = "1"
    propagate_at_launch = true
  }

  metrics_granularity = "1Minute"
  enabled_metrics     = ["GroupDesiredCapacity", "GroupInServiceInstances", "GroupMaxSize", "GroupMinSize", "GroupPendingInstances", "GroupStandbyInstances", "GroupTerminatingInstances", "GroupTotalInstances"]
}

resource "aws_autoscaling_group" "master-us-west-2c-masters-k8s-liouvetren-com" {
  name                 = "master-us-west-2c.masters.k8s.liouvetren.com"
  launch_configuration = "${aws_launch_configuration.master-us-west-2c-masters-k8s-liouvetren-com.id}"
  max_size             = 1
  min_size             = 1
  vpc_zone_identifier  = ["${aws_subnet.us-west-2c-k8s-liouvetren-com.id}"]

  tag = {
    key                 = "KubernetesCluster"
    value               = "k8s.liouvetren.com"
    propagate_at_launch = true
  }

  tag = {
    key                 = "Name"
    value               = "master-us-west-2c.masters.k8s.liouvetren.com"
    propagate_at_launch = true
  }

  tag = {
    key                 = "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/instancegroup"
    value               = "master-us-west-2c"
    propagate_at_launch = true
  }

  tag = {
    key                 = "k8s.io/role/master"
    value               = "1"
    propagate_at_launch = true
  }

  metrics_granularity = "1Minute"
  enabled_metrics     = ["GroupDesiredCapacity", "GroupInServiceInstances", "GroupMaxSize", "GroupMinSize", "GroupPendingInstances", "GroupStandbyInstances", "GroupTerminatingInstances", "GroupTotalInstances"]
}

resource "aws_autoscaling_group" "nodes-k8s-liouvetren-com" {
  name                 = "nodes.k8s.liouvetren.com"
  launch_configuration = "${aws_launch_configuration.nodes-k8s-liouvetren-com.id}"
  max_size             = 5
  min_size             = 5
  vpc_zone_identifier  = ["${aws_subnet.us-west-2a-k8s-liouvetren-com.id}", "${aws_subnet.us-west-2b-k8s-liouvetren-com.id}", "${aws_subnet.us-west-2c-k8s-liouvetren-com.id}"]

  tag = {
    key                 = "KubernetesCluster"
    value               = "k8s.liouvetren.com"
    propagate_at_launch = true
  }

  tag = {
    key                 = "Name"
    value               = "nodes.k8s.liouvetren.com"
    propagate_at_launch = true
  }

  tag = {
    key                 = "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/instancegroup"
    value               = "nodes"
    propagate_at_launch = true
  }

  tag = {
    key                 = "k8s.io/role/node"
    value               = "1"
    propagate_at_launch = true
  }

  metrics_granularity = "1Minute"
  enabled_metrics     = ["GroupDesiredCapacity", "GroupInServiceInstances", "GroupMaxSize", "GroupMinSize", "GroupPendingInstances", "GroupStandbyInstances", "GroupTerminatingInstances", "GroupTotalInstances"]
}

resource "aws_ebs_volume" "a-etcd-events-k8s-liouvetren-com" {
  availability_zone = "us-west-2a"
  size              = 20
  type              = "gp2"
  encrypted         = false

  tags = {
    KubernetesCluster                          = "k8s.liouvetren.com"
    Name                                       = "a.etcd-events.k8s.liouvetren.com"
    "k8s.io/etcd/events"                       = "a/a,b,c"
    "k8s.io/role/master"                       = "1"
    "kubernetes.io/cluster/k8s.liouvetren.com" = "owned"
  }
}

resource "aws_ebs_volume" "a-etcd-main-k8s-liouvetren-com" {
  availability_zone = "us-west-2a"
  size              = 20
  type              = "gp2"
  encrypted         = false

  tags = {
    KubernetesCluster                          = "k8s.liouvetren.com"
    Name                                       = "a.etcd-main.k8s.liouvetren.com"
    "k8s.io/etcd/main"                         = "a/a,b,c"
    "k8s.io/role/master"                       = "1"
    "kubernetes.io/cluster/k8s.liouvetren.com" = "owned"
  }
}

resource "aws_ebs_volume" "b-etcd-events-k8s-liouvetren-com" {
  availability_zone = "us-west-2b"
  size              = 20
  type              = "gp2"
  encrypted         = false

  tags = {
    KubernetesCluster                          = "k8s.liouvetren.com"
    Name                                       = "b.etcd-events.k8s.liouvetren.com"
    "k8s.io/etcd/events"                       = "b/a,b,c"
    "k8s.io/role/master"                       = "1"
    "kubernetes.io/cluster/k8s.liouvetren.com" = "owned"
  }
}

resource "aws_ebs_volume" "b-etcd-main-k8s-liouvetren-com" {
  availability_zone = "us-west-2b"
  size              = 20
  type              = "gp2"
  encrypted         = false

  tags = {
    KubernetesCluster                          = "k8s.liouvetren.com"
    Name                                       = "b.etcd-main.k8s.liouvetren.com"
    "k8s.io/etcd/main"                         = "b/a,b,c"
    "k8s.io/role/master"                       = "1"
    "kubernetes.io/cluster/k8s.liouvetren.com" = "owned"
  }
}

resource "aws_ebs_volume" "c-etcd-events-k8s-liouvetren-com" {
  availability_zone = "us-west-2c"
  size              = 20
  type              = "gp2"
  encrypted         = false

  tags = {
    KubernetesCluster                          = "k8s.liouvetren.com"
    Name                                       = "c.etcd-events.k8s.liouvetren.com"
    "k8s.io/etcd/events"                       = "c/a,b,c"
    "k8s.io/role/master"                       = "1"
    "kubernetes.io/cluster/k8s.liouvetren.com" = "owned"
  }
}

resource "aws_ebs_volume" "c-etcd-main-k8s-liouvetren-com" {
  availability_zone = "us-west-2c"
  size              = 20
  type              = "gp2"
  encrypted         = false

  tags = {
    KubernetesCluster                          = "k8s.liouvetren.com"
    Name                                       = "c.etcd-main.k8s.liouvetren.com"
    "k8s.io/etcd/main"                         = "c/a,b,c"
    "k8s.io/role/master"                       = "1"
    "kubernetes.io/cluster/k8s.liouvetren.com" = "owned"
  }
}

resource "aws_eip" "us-west-2a-k8s-liouvetren-com" {
  vpc = true

  tags = {
    KubernetesCluster                          = "k8s.liouvetren.com"
    Name                                       = "us-west-2a.k8s.liouvetren.com"
    "kubernetes.io/cluster/k8s.liouvetren.com" = "owned"
  }
}

resource "aws_eip" "us-west-2b-k8s-liouvetren-com" {
  vpc = true

  tags = {
    KubernetesCluster                          = "k8s.liouvetren.com"
    Name                                       = "us-west-2b.k8s.liouvetren.com"
    "kubernetes.io/cluster/k8s.liouvetren.com" = "owned"
  }
}

resource "aws_eip" "us-west-2c-k8s-liouvetren-com" {
  vpc = true

  tags = {
    KubernetesCluster                          = "k8s.liouvetren.com"
    Name                                       = "us-west-2c.k8s.liouvetren.com"
    "kubernetes.io/cluster/k8s.liouvetren.com" = "owned"
  }
}

resource "aws_elb" "api-k8s-liouvetren-com" {
  name = "api-k8s-liouvetren-com-bcvb0h"

  listener = {
    instance_port     = 443
    instance_protocol = "TCP"
    lb_port           = 443
    lb_protocol       = "TCP"
  }

  security_groups = ["${aws_security_group.api-elb-k8s-liouvetren-com.id}"]
  subnets         = ["${aws_subnet.utility-us-west-2a-k8s-liouvetren-com.id}", "${aws_subnet.utility-us-west-2b-k8s-liouvetren-com.id}", "${aws_subnet.utility-us-west-2c-k8s-liouvetren-com.id}"]

  health_check = {
    target              = "SSL:443"
    healthy_threshold   = 2
    unhealthy_threshold = 2
    interval            = 10
    timeout             = 5
  }

  idle_timeout = 300

  tags = {
    KubernetesCluster = "k8s.liouvetren.com"
    Name              = "api.k8s.liouvetren.com"
  }
}

resource "aws_iam_instance_profile" "masters-k8s-liouvetren-com" {
  name = "masters.k8s.liouvetren.com"
  role = "${aws_iam_role.masters-k8s-liouvetren-com.name}"
}

resource "aws_iam_instance_profile" "nodes-k8s-liouvetren-com" {
  name = "nodes.k8s.liouvetren.com"
  role = "${aws_iam_role.nodes-k8s-liouvetren-com.name}"
}

resource "aws_iam_role" "masters-k8s-liouvetren-com" {
  name               = "masters.k8s.liouvetren.com"
  assume_role_policy = "${file("${path.module}/data/aws_iam_role_masters.k8s.liouvetren.com_policy")}"
}

resource "aws_iam_role" "nodes-k8s-liouvetren-com" {
  name               = "nodes.k8s.liouvetren.com"
  assume_role_policy = "${file("${path.module}/data/aws_iam_role_nodes.k8s.liouvetren.com_policy")}"
}

resource "aws_iam_role_policy" "masters-k8s-liouvetren-com" {
  name   = "masters.k8s.liouvetren.com"
  role   = "${aws_iam_role.masters-k8s-liouvetren-com.name}"
  policy = "${file("${path.module}/data/aws_iam_role_policy_masters.k8s.liouvetren.com_policy")}"
}

resource "aws_iam_role_policy" "nodes-k8s-liouvetren-com" {
  name   = "nodes.k8s.liouvetren.com"
  role   = "${aws_iam_role.nodes-k8s-liouvetren-com.name}"
  policy = "${file("${path.module}/data/aws_iam_role_policy_nodes.k8s.liouvetren.com_policy")}"
}

resource "aws_internet_gateway" "k8s-liouvetren-com" {
  vpc_id = "${aws_vpc.k8s-liouvetren-com.id}"

  tags = {
    KubernetesCluster                          = "k8s.liouvetren.com"
    Name                                       = "k8s.liouvetren.com"
    "kubernetes.io/cluster/k8s.liouvetren.com" = "owned"
  }
}

resource "aws_key_pair" "kubernetes-k8s-liouvetren-com-4e294169e81b89a66d2b416f84a8321c" {
  key_name   = "kubernetes.k8s.liouvetren.com-4e:29:41:69:e8:1b:89:a6:6d:2b:41:6f:84:a8:32:1c"
  public_key = "${file("${path.module}/data/aws_key_pair_kubernetes.k8s.liouvetren.com-4e294169e81b89a66d2b416f84a8321c_public_key")}"
}

resource "aws_launch_configuration" "master-us-west-2a-masters-k8s-liouvetren-com" {
  name_prefix                 = "master-us-west-2a.masters.k8s.liouvetren.com-"
  image_id                    = "ami-4bfe6f33"
  instance_type               = "m3.medium"
  key_name                    = "${aws_key_pair.kubernetes-k8s-liouvetren-com-4e294169e81b89a66d2b416f84a8321c.id}"
  iam_instance_profile        = "${aws_iam_instance_profile.masters-k8s-liouvetren-com.id}"
  security_groups             = ["${aws_security_group.masters-k8s-liouvetren-com.id}"]
  associate_public_ip_address = false
  user_data                   = "${file("${path.module}/data/aws_launch_configuration_master-us-west-2a.masters.k8s.liouvetren.com_user_data")}"

  root_block_device = {
    volume_type           = "gp2"
    volume_size           = 64
    delete_on_termination = true
  }

  ephemeral_block_device = {
    device_name  = "/dev/sdc"
    virtual_name = "ephemeral0"
  }

  lifecycle = {
    create_before_destroy = true
  }

  enable_monitoring = false
}

resource "aws_launch_configuration" "master-us-west-2b-masters-k8s-liouvetren-com" {
  name_prefix                 = "master-us-west-2b.masters.k8s.liouvetren.com-"
  image_id                    = "ami-4bfe6f33"
  instance_type               = "m3.medium"
  key_name                    = "${aws_key_pair.kubernetes-k8s-liouvetren-com-4e294169e81b89a66d2b416f84a8321c.id}"
  iam_instance_profile        = "${aws_iam_instance_profile.masters-k8s-liouvetren-com.id}"
  security_groups             = ["${aws_security_group.masters-k8s-liouvetren-com.id}"]
  associate_public_ip_address = false
  user_data                   = "${file("${path.module}/data/aws_launch_configuration_master-us-west-2b.masters.k8s.liouvetren.com_user_data")}"

  root_block_device = {
    volume_type           = "gp2"
    volume_size           = 64
    delete_on_termination = true
  }

  ephemeral_block_device = {
    device_name  = "/dev/sdc"
    virtual_name = "ephemeral0"
  }

  lifecycle = {
    create_before_destroy = true
  }

  enable_monitoring = false
}

resource "aws_launch_configuration" "master-us-west-2c-masters-k8s-liouvetren-com" {
  name_prefix                 = "master-us-west-2c.masters.k8s.liouvetren.com-"
  image_id                    = "ami-4bfe6f33"
  instance_type               = "m3.medium"
  key_name                    = "${aws_key_pair.kubernetes-k8s-liouvetren-com-4e294169e81b89a66d2b416f84a8321c.id}"
  iam_instance_profile        = "${aws_iam_instance_profile.masters-k8s-liouvetren-com.id}"
  security_groups             = ["${aws_security_group.masters-k8s-liouvetren-com.id}"]
  associate_public_ip_address = false
  user_data                   = "${file("${path.module}/data/aws_launch_configuration_master-us-west-2c.masters.k8s.liouvetren.com_user_data")}"

  root_block_device = {
    volume_type           = "gp2"
    volume_size           = 64
    delete_on_termination = true
  }

  ephemeral_block_device = {
    device_name  = "/dev/sdc"
    virtual_name = "ephemeral0"
  }

  lifecycle = {
    create_before_destroy = true
  }

  enable_monitoring = false
}

resource "aws_launch_configuration" "nodes-k8s-liouvetren-com" {
  name_prefix                 = "nodes.k8s.liouvetren.com-"
  image_id                    = "ami-4bfe6f33"
  instance_type               = "t2.medium"
  key_name                    = "${aws_key_pair.kubernetes-k8s-liouvetren-com-4e294169e81b89a66d2b416f84a8321c.id}"
  iam_instance_profile        = "${aws_iam_instance_profile.nodes-k8s-liouvetren-com.id}"
  security_groups             = ["${aws_security_group.nodes-k8s-liouvetren-com.id}"]
  associate_public_ip_address = false
  user_data                   = "${file("${path.module}/data/aws_launch_configuration_nodes.k8s.liouvetren.com_user_data")}"

  root_block_device = {
    volume_type           = "gp2"
    volume_size           = 128
    delete_on_termination = true
  }

  lifecycle = {
    create_before_destroy = true
  }

  enable_monitoring = false
}

resource "aws_nat_gateway" "us-west-2a-k8s-liouvetren-com" {
  allocation_id = "${aws_eip.us-west-2a-k8s-liouvetren-com.id}"
  subnet_id     = "${aws_subnet.utility-us-west-2a-k8s-liouvetren-com.id}"

  tags = {
    KubernetesCluster                          = "k8s.liouvetren.com"
    Name                                       = "us-west-2a.k8s.liouvetren.com"
    "kubernetes.io/cluster/k8s.liouvetren.com" = "owned"
  }
}

resource "aws_nat_gateway" "us-west-2b-k8s-liouvetren-com" {
  allocation_id = "${aws_eip.us-west-2b-k8s-liouvetren-com.id}"
  subnet_id     = "${aws_subnet.utility-us-west-2b-k8s-liouvetren-com.id}"

  tags = {
    KubernetesCluster                          = "k8s.liouvetren.com"
    Name                                       = "us-west-2b.k8s.liouvetren.com"
    "kubernetes.io/cluster/k8s.liouvetren.com" = "owned"
  }
}

resource "aws_nat_gateway" "us-west-2c-k8s-liouvetren-com" {
  allocation_id = "${aws_eip.us-west-2c-k8s-liouvetren-com.id}"
  subnet_id     = "${aws_subnet.utility-us-west-2c-k8s-liouvetren-com.id}"

  tags = {
    KubernetesCluster                          = "k8s.liouvetren.com"
    Name                                       = "us-west-2c.k8s.liouvetren.com"
    "kubernetes.io/cluster/k8s.liouvetren.com" = "owned"
  }
}

resource "aws_route" "0-0-0-0--0" {
  route_table_id         = "${aws_route_table.k8s-liouvetren-com.id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${aws_internet_gateway.k8s-liouvetren-com.id}"
}

resource "aws_route" "private-us-west-2a-0-0-0-0--0" {
  route_table_id         = "${aws_route_table.private-us-west-2a-k8s-liouvetren-com.id}"
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = "${aws_nat_gateway.us-west-2a-k8s-liouvetren-com.id}"
}

resource "aws_route" "private-us-west-2b-0-0-0-0--0" {
  route_table_id         = "${aws_route_table.private-us-west-2b-k8s-liouvetren-com.id}"
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = "${aws_nat_gateway.us-west-2b-k8s-liouvetren-com.id}"
}

resource "aws_route" "private-us-west-2c-0-0-0-0--0" {
  route_table_id         = "${aws_route_table.private-us-west-2c-k8s-liouvetren-com.id}"
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = "${aws_nat_gateway.us-west-2c-k8s-liouvetren-com.id}"
}

resource "aws_route53_record" "api-k8s-liouvetren-com" {
  name = "api.k8s.liouvetren.com"
  type = "A"

  alias = {
    name                   = "${aws_elb.api-k8s-liouvetren-com.dns_name}"
    zone_id                = "${aws_elb.api-k8s-liouvetren-com.zone_id}"
    evaluate_target_health = false
  }

  zone_id = "/hostedzone/Z1VB2C2D30QP0B"
}

resource "aws_route_table" "k8s-liouvetren-com" {
  vpc_id = "${aws_vpc.k8s-liouvetren-com.id}"

  tags = {
    KubernetesCluster                          = "k8s.liouvetren.com"
    Name                                       = "k8s.liouvetren.com"
    "kubernetes.io/cluster/k8s.liouvetren.com" = "owned"
    "kubernetes.io/kops/role"                  = "public"
  }
}

resource "aws_route_table" "private-us-west-2a-k8s-liouvetren-com" {
  vpc_id = "${aws_vpc.k8s-liouvetren-com.id}"

  tags = {
    KubernetesCluster                          = "k8s.liouvetren.com"
    Name                                       = "private-us-west-2a.k8s.liouvetren.com"
    "kubernetes.io/cluster/k8s.liouvetren.com" = "owned"
    "kubernetes.io/kops/role"                  = "private-us-west-2a"
  }
}

resource "aws_route_table" "private-us-west-2b-k8s-liouvetren-com" {
  vpc_id = "${aws_vpc.k8s-liouvetren-com.id}"

  tags = {
    KubernetesCluster                          = "k8s.liouvetren.com"
    Name                                       = "private-us-west-2b.k8s.liouvetren.com"
    "kubernetes.io/cluster/k8s.liouvetren.com" = "owned"
    "kubernetes.io/kops/role"                  = "private-us-west-2b"
  }
}

resource "aws_route_table" "private-us-west-2c-k8s-liouvetren-com" {
  vpc_id = "${aws_vpc.k8s-liouvetren-com.id}"

  tags = {
    KubernetesCluster                          = "k8s.liouvetren.com"
    Name                                       = "private-us-west-2c.k8s.liouvetren.com"
    "kubernetes.io/cluster/k8s.liouvetren.com" = "owned"
    "kubernetes.io/kops/role"                  = "private-us-west-2c"
  }
}

resource "aws_route_table_association" "private-us-west-2a-k8s-liouvetren-com" {
  subnet_id      = "${aws_subnet.us-west-2a-k8s-liouvetren-com.id}"
  route_table_id = "${aws_route_table.private-us-west-2a-k8s-liouvetren-com.id}"
}

resource "aws_route_table_association" "private-us-west-2b-k8s-liouvetren-com" {
  subnet_id      = "${aws_subnet.us-west-2b-k8s-liouvetren-com.id}"
  route_table_id = "${aws_route_table.private-us-west-2b-k8s-liouvetren-com.id}"
}

resource "aws_route_table_association" "private-us-west-2c-k8s-liouvetren-com" {
  subnet_id      = "${aws_subnet.us-west-2c-k8s-liouvetren-com.id}"
  route_table_id = "${aws_route_table.private-us-west-2c-k8s-liouvetren-com.id}"
}

resource "aws_route_table_association" "utility-us-west-2a-k8s-liouvetren-com" {
  subnet_id      = "${aws_subnet.utility-us-west-2a-k8s-liouvetren-com.id}"
  route_table_id = "${aws_route_table.k8s-liouvetren-com.id}"
}

resource "aws_route_table_association" "utility-us-west-2b-k8s-liouvetren-com" {
  subnet_id      = "${aws_subnet.utility-us-west-2b-k8s-liouvetren-com.id}"
  route_table_id = "${aws_route_table.k8s-liouvetren-com.id}"
}

resource "aws_route_table_association" "utility-us-west-2c-k8s-liouvetren-com" {
  subnet_id      = "${aws_subnet.utility-us-west-2c-k8s-liouvetren-com.id}"
  route_table_id = "${aws_route_table.k8s-liouvetren-com.id}"
}

resource "aws_security_group" "api-elb-k8s-liouvetren-com" {
  name        = "api-elb.k8s.liouvetren.com"
  vpc_id      = "${aws_vpc.k8s-liouvetren-com.id}"
  description = "Security group for api ELB"

  tags = {
    KubernetesCluster                          = "k8s.liouvetren.com"
    Name                                       = "api-elb.k8s.liouvetren.com"
    "kubernetes.io/cluster/k8s.liouvetren.com" = "owned"
  }
}

resource "aws_security_group" "masters-k8s-liouvetren-com" {
  name        = "masters.k8s.liouvetren.com"
  vpc_id      = "${aws_vpc.k8s-liouvetren-com.id}"
  description = "Security group for masters"

  tags = {
    KubernetesCluster                          = "k8s.liouvetren.com"
    Name                                       = "masters.k8s.liouvetren.com"
    "kubernetes.io/cluster/k8s.liouvetren.com" = "owned"
  }
}

resource "aws_security_group" "nodes-k8s-liouvetren-com" {
  name        = "nodes.k8s.liouvetren.com"
  vpc_id      = "${aws_vpc.k8s-liouvetren-com.id}"
  description = "Security group for nodes"

  tags = {
    KubernetesCluster                          = "k8s.liouvetren.com"
    Name                                       = "nodes.k8s.liouvetren.com"
    "kubernetes.io/cluster/k8s.liouvetren.com" = "owned"
  }
}

resource "aws_security_group_rule" "all-master-to-master" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.masters-k8s-liouvetren-com.id}"
  source_security_group_id = "${aws_security_group.masters-k8s-liouvetren-com.id}"
  from_port                = 0
  to_port                  = 0
  protocol                 = "-1"
}

resource "aws_security_group_rule" "all-master-to-node" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.nodes-k8s-liouvetren-com.id}"
  source_security_group_id = "${aws_security_group.masters-k8s-liouvetren-com.id}"
  from_port                = 0
  to_port                  = 0
  protocol                 = "-1"
}

resource "aws_security_group_rule" "all-node-to-node" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.nodes-k8s-liouvetren-com.id}"
  source_security_group_id = "${aws_security_group.nodes-k8s-liouvetren-com.id}"
  from_port                = 0
  to_port                  = 0
  protocol                 = "-1"
}

resource "aws_security_group_rule" "api-elb-egress" {
  type              = "egress"
  security_group_id = "${aws_security_group.api-elb-k8s-liouvetren-com.id}"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "https-api-elb-0-0-0-0--0" {
  type              = "ingress"
  security_group_id = "${aws_security_group.api-elb-k8s-liouvetren-com.id}"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "https-elb-to-master" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.masters-k8s-liouvetren-com.id}"
  source_security_group_id = "${aws_security_group.api-elb-k8s-liouvetren-com.id}"
  from_port                = 443
  to_port                  = 443
  protocol                 = "tcp"
}

resource "aws_security_group_rule" "master-egress" {
  type              = "egress"
  security_group_id = "${aws_security_group.masters-k8s-liouvetren-com.id}"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "node-egress" {
  type              = "egress"
  security_group_id = "${aws_security_group.nodes-k8s-liouvetren-com.id}"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "node-to-master-protocol-ipip" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.masters-k8s-liouvetren-com.id}"
  source_security_group_id = "${aws_security_group.nodes-k8s-liouvetren-com.id}"
  from_port                = 0
  to_port                  = 65535
  protocol                 = "4"
}

resource "aws_security_group_rule" "node-to-master-tcp-1-2379" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.masters-k8s-liouvetren-com.id}"
  source_security_group_id = "${aws_security_group.nodes-k8s-liouvetren-com.id}"
  from_port                = 1
  to_port                  = 2379
  protocol                 = "tcp"
}

resource "aws_security_group_rule" "node-to-master-tcp-2382-4001" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.masters-k8s-liouvetren-com.id}"
  source_security_group_id = "${aws_security_group.nodes-k8s-liouvetren-com.id}"
  from_port                = 2382
  to_port                  = 4001
  protocol                 = "tcp"
}

resource "aws_security_group_rule" "node-to-master-tcp-4003-65535" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.masters-k8s-liouvetren-com.id}"
  source_security_group_id = "${aws_security_group.nodes-k8s-liouvetren-com.id}"
  from_port                = 4003
  to_port                  = 65535
  protocol                 = "tcp"
}

resource "aws_security_group_rule" "node-to-master-udp-1-65535" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.masters-k8s-liouvetren-com.id}"
  source_security_group_id = "${aws_security_group.nodes-k8s-liouvetren-com.id}"
  from_port                = 1
  to_port                  = 65535
  protocol                 = "udp"
}

resource "aws_security_group_rule" "ssh-external-to-master-0-0-0-0--0" {
  type              = "ingress"
  security_group_id = "${aws_security_group.masters-k8s-liouvetren-com.id}"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "ssh-external-to-node-0-0-0-0--0" {
  type              = "ingress"
  security_group_id = "${aws_security_group.nodes-k8s-liouvetren-com.id}"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_subnet" "us-west-2a-k8s-liouvetren-com" {
  vpc_id            = "${aws_vpc.k8s-liouvetren-com.id}"
  cidr_block        = "172.20.32.0/19"
  availability_zone = "us-west-2a"

  tags = {
    KubernetesCluster                          = "k8s.liouvetren.com"
    Name                                       = "us-west-2a.k8s.liouvetren.com"
    SubnetType                                 = "Private"
    "kubernetes.io/cluster/k8s.liouvetren.com" = "owned"
    "kubernetes.io/role/internal-elb"          = "1"
  }
}

resource "aws_subnet" "us-west-2b-k8s-liouvetren-com" {
  vpc_id            = "${aws_vpc.k8s-liouvetren-com.id}"
  cidr_block        = "172.20.64.0/19"
  availability_zone = "us-west-2b"

  tags = {
    KubernetesCluster                          = "k8s.liouvetren.com"
    Name                                       = "us-west-2b.k8s.liouvetren.com"
    SubnetType                                 = "Private"
    "kubernetes.io/cluster/k8s.liouvetren.com" = "owned"
    "kubernetes.io/role/internal-elb"          = "1"
  }
}

resource "aws_subnet" "us-west-2c-k8s-liouvetren-com" {
  vpc_id            = "${aws_vpc.k8s-liouvetren-com.id}"
  cidr_block        = "172.20.96.0/19"
  availability_zone = "us-west-2c"

  tags = {
    KubernetesCluster                          = "k8s.liouvetren.com"
    Name                                       = "us-west-2c.k8s.liouvetren.com"
    SubnetType                                 = "Private"
    "kubernetes.io/cluster/k8s.liouvetren.com" = "owned"
    "kubernetes.io/role/internal-elb"          = "1"
  }
}

resource "aws_subnet" "utility-us-west-2a-k8s-liouvetren-com" {
  vpc_id            = "${aws_vpc.k8s-liouvetren-com.id}"
  cidr_block        = "172.20.0.0/22"
  availability_zone = "us-west-2a"

  tags = {
    KubernetesCluster                          = "k8s.liouvetren.com"
    Name                                       = "utility-us-west-2a.k8s.liouvetren.com"
    SubnetType                                 = "Utility"
    "kubernetes.io/cluster/k8s.liouvetren.com" = "owned"
    "kubernetes.io/role/elb"                   = "1"
  }
}

resource "aws_subnet" "utility-us-west-2b-k8s-liouvetren-com" {
  vpc_id            = "${aws_vpc.k8s-liouvetren-com.id}"
  cidr_block        = "172.20.4.0/22"
  availability_zone = "us-west-2b"

  tags = {
    KubernetesCluster                          = "k8s.liouvetren.com"
    Name                                       = "utility-us-west-2b.k8s.liouvetren.com"
    SubnetType                                 = "Utility"
    "kubernetes.io/cluster/k8s.liouvetren.com" = "owned"
    "kubernetes.io/role/elb"                   = "1"
  }
}

resource "aws_subnet" "utility-us-west-2c-k8s-liouvetren-com" {
  vpc_id            = "${aws_vpc.k8s-liouvetren-com.id}"
  cidr_block        = "172.20.8.0/22"
  availability_zone = "us-west-2c"

  tags = {
    KubernetesCluster                          = "k8s.liouvetren.com"
    Name                                       = "utility-us-west-2c.k8s.liouvetren.com"
    SubnetType                                 = "Utility"
    "kubernetes.io/cluster/k8s.liouvetren.com" = "owned"
    "kubernetes.io/role/elb"                   = "1"
  }
}

resource "aws_vpc" "k8s-liouvetren-com" {
  cidr_block           = "172.20.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    KubernetesCluster                          = "k8s.liouvetren.com"
    Name                                       = "k8s.liouvetren.com"
    "kubernetes.io/cluster/k8s.liouvetren.com" = "owned"
  }
}

resource "aws_vpc_dhcp_options" "k8s-liouvetren-com" {
  domain_name         = "us-west-2.compute.internal"
  domain_name_servers = ["AmazonProvidedDNS"]

  tags = {
    KubernetesCluster                          = "k8s.liouvetren.com"
    Name                                       = "k8s.liouvetren.com"
    "kubernetes.io/cluster/k8s.liouvetren.com" = "owned"
  }
}

resource "aws_vpc_dhcp_options_association" "k8s-liouvetren-com" {
  vpc_id          = "${aws_vpc.k8s-liouvetren-com.id}"
  dhcp_options_id = "${aws_vpc_dhcp_options.k8s-liouvetren-com.id}"
}

terraform = {
  required_version = ">= 0.9.3"
}
