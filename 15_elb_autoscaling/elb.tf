resource "aws_elb" "elb19" {
    name  = "elb19"
    subnets = [aws_subnet.public_subnet1.id,aws_subnet.public_subnet2.id]
    security_groups = [aws_security_group.elb-sg.id]
    listener {
        instance_port = 80
        instance_protocol = "http"
        lb_port = 80
        lb_protocol = "http"
    }
    health_check {
      healthy_threshold = 2
      unhealthy_threshold = 2
      timeout = 3
      target = "http:80/"
      interval = 30
    }
    cross_zone_load_balancing   = true
    connection_draining         = true
    connection_draining_timeout = 400
    tags = {
    Name = "elb19"
  }

}