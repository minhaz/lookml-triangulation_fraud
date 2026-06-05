connection: "my_connection" # Adjust connection name as needed

include: "/demos/triangulation_fraud/lookml/views/**/*.view.lkml"
include: "/demos/triangulation_fraud/lookml/dashboards/**/*.dashboard.lookml"

explore: triangulation_fraud {
  sql_analytic_model_name: triangulation_fraud_demo ;;
  from: order # Use order as base

  join: edge_fulfilled_by {
    type: left_outer
    relationship: many_to_one
    sql_on: ${triangulation_fraud.order_id} = ${edge_fulfilled_by.order_id} ;;
  }

  join: merchant_storefront {
    type: left_outer
    relationship: many_to_one
    sql_on: ${edge_fulfilled_by.storefront_id} = ${merchant_storefront.storefront_id} ;;
  }

  join: edge_shipped_to {
    type: left_outer
    relationship: many_to_one
    sql_on: ${triangulation_fraud.order_id} = ${edge_shipped_to.order_id} ;;
  }

  join: shipping_address {
    type: left_outer
    relationship: many_to_one
    sql_on: ${edge_shipped_to.shipping_id} = ${shipping_address.shipping_id} ;;
  }

  join: edge_pays_for {
    type: left_outer
    relationship: many_to_one
    sql_on: ${triangulation_fraud.order_id} = ${edge_pays_for.order_id} ;;
  }

  join: credit_card {
    type: left_outer
    relationship: many_to_one
    sql_on: ${edge_pays_for.card_id} = ${credit_card.card_id} ;;
  }

  join: edge_owns {
    type: left_outer
    relationship: many_to_one
    sql_on: ${credit_card.card_id} = ${edge_owns.card_id} ;;
  }

  join: cardholder {
    type: left_outer
    relationship: many_to_one
    sql_on: ${edge_owns.cardholder_id} = ${cardholder.cardholder_id} ;;
  }

  join: edge_results_in {
    type: left_outer
    relationship: one_to_many
    sql_on: ${triangulation_fraud.order_id} = ${edge_results_in.order_id} ;;
  }

  join: chargeback {
    type: left_outer
    relationship: many_to_one
    sql_on: ${edge_results_in.chargeback_id} = ${chargeback.chargeback_id} ;;
  }
}
