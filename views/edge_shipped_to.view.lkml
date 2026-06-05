view: edge_shipped_to {
  sql_table_name: `triangulation_fraud_demo.edge_shipped_to` ;;
  sql_analytic_model_name: triangulation_fraud_demo ;;

  dimension: pk {
    primary_key: yes
    hidden: yes
    type: string
    sql: CONCAT(${order_id}, '-', ${shipping_id}) ;;
  }
  dimension: order_id {
    type: string
    sql: ${TABLE}.order_id ;;
  }
  dimension: shipping_id {
    type: string
    sql: ${TABLE}.shipping_id ;;
  }
}
