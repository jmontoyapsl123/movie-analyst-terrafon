variable "instanceId" {
        type = string
}

resource "aws_lb_target_group_attachment" "tg_attachment_test" {
    target_group_arn = "arn:aws:elasticloadbalancing:us-west-1:961518039473:targetgroup/julian-montoyag-target-group-ui/a7b25a48ec6e5168"
    target_id        = var.instanceId
    port             = 3030
}