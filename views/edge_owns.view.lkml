view: edge_owns {
  sql_table_name: `triangulation_fraud_demo.edge_owns` ;;
  sql_analytic_model_name: triangulation_fraud_demo ;;

  dimension: pk {
    primary_key: yes
    hidden: yes
    type: string
    sql: CONCAT(${cardholder_id}, '-', ${card_id}) ;;
  }
  dimension: cardholder_id {
    type: string
    sql: ${TABLE}.cardholder_id ;;
  }
  dimension: card_id {
    type: string
    sql: ${TABLE}.card_id ;;
  }
}
