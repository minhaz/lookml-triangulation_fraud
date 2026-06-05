view: credit_card {
  sql_table_name: `triangulation_fraud_demo.CreditCard` ;;
  sql_analytic_model_name: triangulation_fraud_demo ;;

  dimension: card_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.card_id ;;
  }
  dimension: bin {
    type: string
    sql: ${TABLE}.bin ;;
  }
  dimension: expiration_date {
    type: date
    sql: ${TABLE}.expiration_date ;;
  }
  dimension: card_type {
    type: string
    sql: ${TABLE}.card_type ;;
  }
  dimension: issuing_bank {
    type: string
    sql: ${TABLE}.issuing_bank ;;
  }
  dimension: is_compromised {
    type: yesno
    sql: ${TABLE}.is_compromised ;;
  }
}
