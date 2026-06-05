view: edge_fulfilled_by {
  sql_table_name: `triangulation_fraud_demo.edge_fulfilled_by` ;;
  sql_analytic_model_name: triangulation_fraud_demo ;;

  dimension: pk {
    primary_key: yes
    hidden: yes
    type: string
    sql: CONCAT(${order_id}, '-', ${storefront_id}) ;;
  }
  dimension: order_id {
    type: string
    sql: ${TABLE}.order_id ;;
  }
  dimension: storefront_id {
    type: string
    sql: ${TABLE}.storefront_id ;;
  }
}
