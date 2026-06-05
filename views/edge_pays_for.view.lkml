view: edge_pays_for {
  sql_table_name: `triangulation_fraud_demo.edge_pays_for` ;;
  sql_analytic_model_name: triangulation_fraud_demo ;;

  dimension: pk {
    primary_key: yes
    hidden: yes
    type: string
    sql: CONCAT(${card_id}, '-', ${order_id}) ;;
  }
  dimension: card_id {
    type: string
    sql: ${TABLE}.card_id ;;
  }
  dimension: order_id {
    type: string
    sql: ${TABLE}.order_id ;;
  }
}
