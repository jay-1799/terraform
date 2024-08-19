resource "aws_launch_configuration" "lc19" {
    name_prefix = "lc19"
    image_id = var.ami_id
    instance_type = "t2.micro"
    key_name = aws_key_pair.key15.key_name
    security_groups = [aws_security_group.sg15.id]
    user_data = "#!/bin/bash\napt-get update\napt-get -y install nginx\nMYIP=`ifconfig | grep 'addr:10' | awk '{ print $2 }' | cut -d ':' -f2`\necho 'this is: '$MYIP > /var/www/html/index.html\nservice nginx start"
    lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "asg19" {
    name = "asg19"
    vpc_zone_identifier = [aws_subnet.public_subnet1.id,aws_subnet.public_subnet2.id]
    launch_configuration = aws_launch_configuration.lc19.name
    min_size = 2
    max_size = 3
    health_check_grace_period = 300
    health_check_type = "ELB"
    load_balancers = [aws_elb.elb19.name]
    force_delete = true

    tag {
  key = "Name"
  value = "ec2 instance"
  propagate_at_launch = true
}
}