view: edge_results_in {
  sql_table_name: `triangulation_fraud_demo.edge_results_in` ;;
  sql_analytic_model_name: triangulation_fraud_demo ;;

  dimension: pk {
    primary_key: yes
    hidden: yes
    type: string
    sql: CONCAT(${order_id}, '-', ${chargeback_id}) ;;
  }
  dimension: order_id {
    type: string
    sql: ${TABLE}.order_id ;;
  }
  dimension: chargeback_id {
    type: string
    sql: ${TABLE}.chargeback_id ;;
  }
}
