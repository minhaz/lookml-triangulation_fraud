view: chargeback {
  sql_table_name: `triangulation_fraud_demo.Chargeback` ;;
  sql_analytic_model_name: triangulation_fraud_demo ;;

  dimension: chargeback_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.chargeback_id ;;
  }
  dimension: reason_code {
    type: string
    sql: ${TABLE}.reason_code ;;
  }
  dimension: amount {
    type: number
    sql: ${TABLE}.amount ;;
  }
  dimension: dispute_date {
    type: date
    sql: ${TABLE}.dispute_date ;;
  }
  dimension: resolution_status {
    type: string
    sql: ${TABLE}.resolution_status ;;
  }
  dimension: win_probability {
    type: number
    sql: ${TABLE}.win_probability ;;
  }
}
