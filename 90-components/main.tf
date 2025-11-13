/* module "this" {
    source = "../../tf-aws-components"
    component = var.component
    rule_priority = var.rule_priority
} */

module "components" {
    for_each = var.components
    source = "git::https://github.com/azharmd-dev/tf-aws-components.git?ref=main"
    component = each.key
    rule_priority = each.value.rule_priority
}