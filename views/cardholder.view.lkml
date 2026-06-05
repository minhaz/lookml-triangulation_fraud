view: cardholder {
  sql_table_name: `triangulation_fraud_demo.Cardholder` ;;
  sql_analytic_model_name: triangulation_fraud_demo ;;

  dimension: cardholder_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.cardholder_id ;;
  }
  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }
  dimension: risk_segment {
    type: string
    sql: ${TABLE}.risk_segment ;;
  }
  dimension: lifetime_value {
    type: number
    sql: ${TABLE}.lifetime_value ;;
  }
  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }
  dimension: tenure_months {
    type: number
    sql: ${TABLE}.tenure_months ;;
  }
  dimension: billing_zip_code {
    type: string
    sql: ${TABLE}.billing_zip_code ;;
  }
}
