resource "aws_alb" "vault" {
  name = "${var.namespace}-vault"

  security_groups = ["${aws_security_group.demostack.id}"]
  subnets         = "${aws_subnet.demostack.*.id}"

  tags = {
    Name           = "${var.namespace}-vault"
    owner          = var.owner
    created-by     = "${var.created-by}"
    sleep-at-night = "${var.sleep-at-night}"
    TTL            = var.TTL
 }
}

resource "aws_alb_target_group" "vault" {
  name = "${var.namespace}-vault"

  port     = "8200"
  vpc_id   = "${aws_vpc.demostack.id}"
  protocol = "HTTPS"

  health_check {
    interval          = "5"
    timeout           = "2"
    path              = "/v1/sys/health"
    port              = "8200"
    protocol          = "HTTPS"
    matcher           = "200,472,473"
    healthy_threshold = 2
  }
}

resource "aws_alb_listener" "vault" {
  depends_on = [
    aws_acm_certificate_validation.cert
  ]

  load_balancer_arn = "${aws_alb.vault.arn}"

  port            = "8200"
  protocol        = "HTTPS"
  certificate_arn = "${aws_acm_certificate_validation.cert.certificate_arn}"
  ssl_policy      = "ELBSecurityPolicy-TLS-1-2-Ext-2018-06"
  default_action {
    target_group_arn = "${aws_alb_target_group.vault.arn}"
    type             = "forward"
  }

}

resource "aws_alb_target_group_attachment" "vault" {
  count            = var.servers
  target_group_arn = "${aws_alb_target_group.vault.arn}"
  target_id        = "${element(aws_instance.server.*.id, count.index)}"
  port             = "8200"
}
